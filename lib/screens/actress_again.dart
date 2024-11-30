import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:ab_final_entregable/screens/functions/background_widget.dart';
import 'package:ab_final_entregable/screens/functions/custom_video_player.dart';
import 'package:ab_final_entregable/screens/functions/navigation_buttons.dart';
import 'package:ab_final_entregable/screens/functions/video_player_helper.dart';
import 'package:ab_final_entregable/screens/functions/crud_forum_type.dart';

class ActressAgain extends StatefulWidget {
  const ActressAgain({super.key});

  @override
  _ActressAgainState createState() => _ActressAgainState();
}

class _ActressAgainState extends State<ActressAgain> {
  late final VideoPlayerController _controller1;
  late final VideoPlayerController _controller2;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    _controller1 = initializeVideo('assets/videos/demos/MBAACC_Demo_1.mp4');
    _controller2 = initializeVideo('assets/videos/demos/MBAACC_Demo_2.mp4');
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
            const SizedBox(height: 30),
            getBody(context),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ultrices nisl nec massa vehicula, ac interdum elit porttitor.",
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 300,
              child: CrudForumType(),
            ),
          ],
        ),
      ),
    );
  }

  Widget getActressAgain(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        fit: StackFit.expand,
        children: [
          buildBackgroundMBAACC(context),
          buildEnterButton(context),
          buildBackButton(context),
          buildExpandImageButtonAACC(context),
          buildLeftArrowButtonAACC(context),
        ],
      ),
    );
  }

  Widget buildEnterButton(BuildContext context) {
    return Align(
      alignment: Alignment(0, 0.6),
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.arrow_back, size: 30, color: Colors.white),
        label: const Text(
          "ENTER",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.white, width: 3),
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
    );
  }

  Widget getBody(BuildContext context) {
    return Column(
      children: [
        buildVideoPlayer(context, _controller1),
        const SizedBox(height: 20),
        buildVideoPlayer(context, _controller2),
      ],
    );
  }
}
