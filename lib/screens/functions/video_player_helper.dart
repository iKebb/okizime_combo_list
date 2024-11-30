import 'package:video_player/video_player.dart';

VideoPlayerController initializeVideo(String assetPath) {
  final controller = VideoPlayerController.asset(assetPath);
  controller.initialize().then((_) {
    controller
      ..setLooping(true)
      ..setVolume(0)
      ..play();
  }).catchError((e) {
    print("Error al inicializar el video: $e");
  });
  return controller;
}
