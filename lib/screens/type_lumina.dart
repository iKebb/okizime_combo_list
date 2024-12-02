import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:ab_final_entregable/widgets/content.dart';
import 'package:ab_final_entregable/widgets/video_player_helper.dart';

class TypeLumina extends StatefulWidget {
  const TypeLumina({super.key});

  @override
  TypeLuminaState createState() => TypeLuminaState();
  //gestión lógica del apartado mutable en la pantalla
  //lo que permite a la pantalla actualizarse "statefullwidget".
}

class TypeLuminaState extends State<TypeLumina> {
  late final VideoPlayerController _controller1;
  late final VideoPlayerController _controller2;
  //propiedad que define dos controladores en late
  //para manejar la reproducción de vídeos en el initState.

  @override
  void initState() {
    super.initState();
    _controller1 = loopingVideo('assets/videos/demos/MBTL_Demo_1.mp4');
    _controller2 = loopingVideo('assets/videos/demos/MBTL_Demo_2.mp4');
    //ejecución de los controladores que devuelven
    //loopingVideo con la ruta proporcionada.
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
    //se castea dispose encima de los controllers
    //se castea super.dispose para que se ejecute en la clase State
    //dispose libera los recursos de los controladores para liberar memoria
    //al pasar de una pantalla a otra.
  }

  @override
  Widget build(BuildContext context) {
    //build es el método que se utiliza para definir la UI
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        //permite desplazarse en la pantalla si el contenido es mayor
        //que el alto designado por la resolución del teléfono.
        child: Column(
          children: [
            getTypeLumina(context),
            //se castea getTypeLumina con el contexto porque
            //la función utiliza métodos que requieren el contexto
            //de la pantalla como MediaQuery.of(context).size o los
            //navigator dentro de los botones del método navigation_buttons
            const SizedBox(height: 8),
            getBody(context, _controller1, _controller2),
            //se castea getBody con los parámetros context y los controllers
            //que retorna el contenido que vemos en pantalla:
            //los vídeos (Widgets), un texto (Lorem Ipsum) y el Widget
            //CrudForumType.
            //Context en este caso
          ],
        ),
      ),
    );
  }
}
