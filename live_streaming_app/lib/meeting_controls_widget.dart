import 'package:flutter/material.dart';

class MeetingControls extends StatelessWidget {
  final String hlsState;
  final void Function() onToggleMicButtonPressed;
  final void Function() onToggleCameraButtonPressed;
  final void Function() onHLSButtonPressed;
  final bool isMicEnabled;
  final bool isCamEnabled;

  const MeetingControls({
    super.key,
    required this.hlsState,
    required this.onToggleMicButtonPressed,
    required this.onToggleCameraButtonPressed,
    required this.onHLSButtonPressed,
    required this.isMicEnabled,
    required this.isCamEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        InkWell(
          onTap: onToggleMicButtonPressed,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black26),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                isMicEnabled ? Icons.mic : Icons.mic_off,
                color: Colors.blue,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: onToggleCameraButtonPressed,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black26),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                isCamEnabled ? Icons.videocam : Icons.videocam_off,
                color: Colors.blue,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: onHLSButtonPressed,
          child: Container(
            width: 150,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                hlsState == "HLS_STOPPED"
                    ? 'Start Stream'
                    : hlsState == "HLS_STARTING"
                        ? "Starting Stream"
                        : hlsState == "HLS_STARTED" ||
                                hlsState == "HLS_PLAYABLE"
                            ? "Stop Stream"
                            : hlsState == "HLS_STOPPING"
                                ? "Stopping Stream"
                                : "Start Stream",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
