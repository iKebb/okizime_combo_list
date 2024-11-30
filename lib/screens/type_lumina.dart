import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:ab_final_entregable/screens/functions/content.dart';
import 'package:ab_final_entregable/screens/functions/video_player_helper.dart';

class TypeLumina extends StatefulWidget {
  const TypeLumina({super.key});

  @override
  _TypeLuminaState createState() => _TypeLuminaState();
}

class _TypeLuminaState extends State<TypeLumina> {
  late VideoPlayerController _controller1;
  late VideoPlayerController _controller2;

  @override
  void initState() {
    super.initState();
    _controller1 = initializeVideo('assets/videos/demos/MBTL_Demo_1.mp4');
    _controller2 = initializeVideo('assets/videos/demos/MBTL_Demo_2.mp4');
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            getTypeLumina(context),
            const SizedBox(height: 2),
            getBody(context, _controller1, _controller2),
          ],
        ),
      ),
    );
  }
}
