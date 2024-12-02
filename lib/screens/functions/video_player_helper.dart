import 'package:video_player/video_player.dart';

VideoPlayerController loopingVideo(String assetPath) {
  //define la función loopingVideo que inicializa la clase VideoPlayerController
  //para reproducir el vídeo en la ruta del parámetro assetPath
  final controller = VideoPlayerController.asset(assetPath);
  controller.initialize().then(
    //controller.initialize es un método de VideoPlayerController
    //que inicia el controller y lo prepara para su reproducción
    //luego devuelve un Future que se completa cuando el init del
    //vídeo se ha hecho correctamente
    //con then se hace callback cuando el Future de initialize() se completa.
    //no necesita el valor que devuelve (_)
    (_) {
      controller
        ..setLooping(true)
        ..setVolume(0)
        ..play();
    },
  );
  return controller;
  //retorna controller.
}
