import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class LivestreamPlayer extends StatefulWidget {
  final String playbackHlsUrl;
  const LivestreamPlayer({
    super.key,
    required this.playbackHlsUrl,
  });

  @override
  LivestreamPlayerState createState() => LivestreamPlayerState();
}

class LivestreamPlayerState extends State<LivestreamPlayer>
    with AutomaticKeepAliveClientMixin {
  late VlcPlayerController _controller;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    //initializing the player
    _controller = VlcPlayerController.network(widget.playbackHlsUrl,
        options: VlcPlayerOptions());
  }

  @override
  void dispose() async {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    //rendering the VlcPlayer
    return VlcPlayer(
      controller: _controller,
      aspectRatio: 16 / 9,
      placeholder: const Center(child: CircularProgressIndicator()),
    );
  }
}
