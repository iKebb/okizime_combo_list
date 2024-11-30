import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

Widget buildVideoPlayer(
    BuildContext context, VideoPlayerController controller) {
  double screenWidth = MediaQuery.of(context).size.width;
  double videoHeight = screenWidth * 9 / 16;

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: screenWidth,
      height: videoHeight,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black.withOpacity(0.5), width: 2),
      ),
      child: FutureBuilder<void>(
        future: controller.initialize(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: VideoPlayer(controller),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    ),
  );
}
