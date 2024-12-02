import 'package:ab_final_entregable/widgets/content.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:ab_final_entregable/widgets/video_player_controller.dart';

class ActressAgain extends StatefulWidget {
  const ActressAgain({super.key});

  @override
  ActressAgainState createState() => ActressAgainState();
}

class ActressAgainState extends State<ActressAgain> {
  late final VideoPlayerController _controller1;
  late final VideoPlayerController _controller2;

  @override
  void initState() {
    super.initState();
    _controller1 = loopingVideo('assets/videos/demos/MBAACC_Demo_1.mp4');
    _controller2 = loopingVideo('assets/videos/demos/MBAACC_Demo_2.mp4');
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
            getActressAgain(context),
            const SizedBox(height: 8),
            getBody(context, _controller1, _controller2),
          ],
        ),
      ),
    );
  }
}
