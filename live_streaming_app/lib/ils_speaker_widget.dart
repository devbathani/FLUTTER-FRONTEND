import 'package:flutter/material.dart';
import 'package:live_streaming_app/meeting_controls_widget.dart';
import 'package:live_streaming_app/participant_tile_widget.dart';
import 'package:videosdk/videosdk.dart';

class ILSSpeakerView extends StatefulWidget {
  final Room room;
  const ILSSpeakerView({super.key, required this.room});

  @override
  State<ILSSpeakerView> createState() => _ILSSpeakerViewState();
}

class _ILSSpeakerViewState extends State<ILSSpeakerView> {
  var micEnabled = false;
  var camEnabled = false;
  String hlsState = "HLS_STOPPED";
  // PubSubMessages
  PubSubMessages? messages;
  Map<String, Participant> participants = {};

  @override
  void initState() {
    super.initState();
    //Setting up the event listeners and initializing the participants and hls state
    setMeetingEventListener();
    participants.putIfAbsent(
        widget.room.localParticipant.id, () => widget.room.localParticipant);
    //filtering the CONFERENCE participants to be shown in the grid
    for (var participant in widget.room.participants.values) {
      if (participant.mode == Mode.CONFERENCE) {
        participants.putIfAbsent(participant.id, () => participant);
      }
    }
    hlsState = widget.room.hlsState;
    // Subscribing 'CHAT' Topic
    widget.room.pubSub
        .subscribe("CHAT", messageHandler)
        .then((value) => setState((() => messages = value)));
  }

  // listening to room events for participants join, left and hls state changes
  void setMeetingEventListener() {
    widget.room.on(
      Events.participantJoined,
      (Participant participant) {
        //Adding only Conference participant to show in grid
        if (participant.mode == Mode.CONFERENCE) {
          setState(
            () => participants.putIfAbsent(participant.id, () => participant),
          );
        }
      },
    );

    widget.room.on(Events.participantLeft, (String participantId) {
      if (participants.containsKey(participantId)) {
        setState(
          () => participants.remove(participantId),
        );
      }
    });
    widget.room.on(
      Events.hlsStateChanged,
      (Map<String, dynamic> data) {
        setState(
          () => hlsState = data['status'],
        );
      },
    );
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    // Unsubscribe
    widget.room.pubSub.unsubscribe("CHAT", messageHandler);
    super.dispose();
  }

  //Handler which will be called when new mesasge is received
  void messageHandler(PubSubMessage message) {
    //Show snackbar on new message
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 5),
        content: Text(
          message.message,
          overflow: TextOverflow.fade,
        ),
      ));
    }
    setState(() => messages!.messages.add(message));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  widget.room.leave();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: const Text(
                  "Leave",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 9 / 16,
              ),
              itemBuilder: (context, index) {
                return ParticipantTile(
                  participant: participants.values.elementAt(index),
                );
              },
              itemCount: participants.length,
            ),
          ),
          //Rending the meeting Controls
          MeetingControls(
            hlsState: hlsState,
            isMicEnabled: micEnabled,
            isCamEnabled: camEnabled,
            onToggleMicButtonPressed: () {
              micEnabled ? widget.room.muteMic() : widget.room.unmuteMic();
              micEnabled = !micEnabled;
              setState(() {});
            },
            onToggleCameraButtonPressed: () {
              camEnabled ? widget.room.disableCam() : widget.room.enableCam();
              camEnabled = !camEnabled;
              setState(() {});
            },
            onHLSButtonPressed: () => {
              if (hlsState == "HLS_STOPPED")
                {
                  widget.room.startHls(
                    config: {
                      "layout": {
                        "type": "SPOTLIGHT",
                        "priority": "PIN",
                        "GRID": 20,
                      },
                      "mode": "video-and-audio",
                      "theme": "DARK",
                      "quality": "high",
                      "orientation": "portrait",
                    },
                  ),
                }
              else if (hlsState == "HLS_STARTED" || hlsState == "HLS_PLAYABLE")
                {
                  widget.room.stopHls(),
                  widget.room.stopRecording(),
                }
            },
          ),
        ],
      ),
    );
  }
}
