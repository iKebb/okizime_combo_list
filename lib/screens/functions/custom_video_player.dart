import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

Widget buildVideoPlayer(
    BuildContext context, VideoPlayerController controller) {
  double screenWidth = MediaQuery.of(context).size.width;
  double videoHeight = screenWidth * 9 / 16;
  //el método buildVideoPlayer define las dimensiones de la pantall
  //se toma la pantalla con MediaQuery.of de la pantalla de largo donde
  //se ejecuta la app y se extiende a lo ancho de 9/16 para una resolución 16:9.

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: screenWidth,
      height: videoHeight,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(
          28,
        ),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      //boxdecoration para el marco del vídeo.
      child: FutureBuilder<void>(
        // 
        future: controller.initialize(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: VideoPlayer(controller),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    ),
  );
}
