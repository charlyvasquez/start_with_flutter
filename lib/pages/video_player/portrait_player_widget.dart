import 'package:flutter/material.dart';
import 'package:start_with_flutter_again/pages/video_player/video_player_fullscreen_widget.dart';
import 'package:video_player/video_player.dart';

class PortraitPlayerWidget extends StatefulWidget {
  // const PortraitPlayerWidget({Key? key}) : super(key: key);

  @override
  State<PortraitPlayerWidget> createState() => _PortraitPlayerWidgetState();
}

class _PortraitPlayerWidgetState extends State<PortraitPlayerWidget> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(
        "https://cmsdimayor.s3.amazonaws.com/golesfecha13dim.mp4")
      ..addListener(() {
        setState(() {});
      })
      ..setLooping(true)
      ..initialize().then((_) => controller.play());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => VideoPlayerFullscreenWidget(
        controller: controller,
      );
}
