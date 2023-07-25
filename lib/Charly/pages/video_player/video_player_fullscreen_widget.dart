import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerFullscreenWidget extends StatelessWidget {
  final VideoPlayerController controller;
  const VideoPlayerFullscreenWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) =>
      controller != null && controller.value.isInitialized
          ? Container(alignment: Alignment.topCenter, child: buildVideo())
          : Center(child: CircularProgressIndicator());

  Widget buildVideo() => Stack(
        children: [
          buildVideoPlayer(),
          // BasicOverlayWidget(controller: )
        ],
      );

  Widget buildVideoPlayer() => AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: VideoPlayer(controller),
      );
}
