import 'package:flutter/material.dart';
import 'package:live_streaming_app/live_stream_player_widget.dart';
import 'package:videosdk/videosdk.dart';

class ILSViewerView extends StatefulWidget {
  final Room room;
  const ILSViewerView({super.key, required this.room});

  @override
  State<ILSViewerView> createState() => _ILSViewerViewState();
}

class _ILSViewerViewState extends State<ILSViewerView> {
  String hlsState = "HLS_STOPPED";
  String? playbackHlsUrl;
  final msgTextController = TextEditingController();
  final ScrollController _controller = ScrollController();

  // PubSubMessages

  List<PubSubMessage> messages = [];

  @override
  void initState() {
    super.initState();

    hlsState = widget.room.hlsState;

    setMeetingEventListener();

    widget.room.pubSub.subscribe("CHAT", messageHandler);
  }

  @override
  void dispose() {
    // Unsubscribe
    widget.room.pubSub.unsubscribe("CHAT", messageHandler);
    super.dispose();
  }

  //Handler which will be called when new mesasge is received
  void messageHandler(PubSubMessage message) {
    messages.add(message);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.jumpTo(_controller.position.maxScrollExtent);
    });
    setState((() {}));
  }

  void setMeetingEventListener() {
    // listening to hlsStateChanged events and updating the hlsState and downstremUrl
    widget.room.on(
      Events.hlsStateChanged,
      (Map<String, dynamic> data) {
        String status = data['status'];
        if (mounted) {
          setState(() {
            hlsState = status;
            if (status == "HLS_PLAYABLE" || status == "HLS_STOPPED") {
              playbackHlsUrl = data['playbackHlsUrl'];
            }
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SizedBox(
          height: 80,
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 280,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        top: 5,
                        bottom: 5,
                      ),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(
                                "https://st3.depositphotos.com/6672868/13701/v/450/depositphotos_137014128-stock-illustration-user-profile-icon.jpg"),
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            height: 50,
                            width: 200,
                            child: TextField(
                              cursorColor: Colors.white,
                              controller: msgTextController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Write something...",
                                hintStyle: TextStyle(color: Colors.black45),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      if (msgTextController.text.trim().isNotEmpty) {
                        widget.room.pubSub
                            .publish(
                              "CHAT",
                              msgTextController.text,
                              const PubSubPublishOptions(persist: false),
                            )
                            .then(
                              (value) => msgTextController.clear(),
                            );
                      }
                    },
                    child: Container(
                      height: 48,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.send,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () => {widget.room.leave()},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text(
                        "Leave",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15),
              //Show the livestream player if the playbackHlsUrl is present
              playbackHlsUrl != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: SizedBox(
                        height: 200,
                        width: MediaQuery.sizeOf(context).width,
                        child:
                            LivestreamPlayer(playbackHlsUrl: playbackHlsUrl!),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        height: 200,
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black26),
                          color: Colors.grey.withOpacity(0.23),
                        ),
                        child: const Center(
                          child: Text(
                            "Host has not started the stream",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
              Container(
                height: 400,
                width: MediaQuery.sizeOf(context).width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Questions",
                            style: TextStyle(fontSize: 14),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.black45,
                            size: 30,
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      messages.isEmpty
                          ? const Text(
                              "No questions",
                              style: TextStyle(color: Colors.black45),
                            )
                          : SizedBox(
                              height: 250,
                              child: ListView.builder(
                                reverse: true,
                                controller: _controller,
                                itemCount: messages.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          messages[index].message,
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                        const SizedBox(height: 5),
                                        const Divider(color: Colors.black26),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
