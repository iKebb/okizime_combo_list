import 'package:ab_final_entregable/screens/functions/background_widget.dart';
import 'package:ab_final_entregable/screens/functions/crud_forum_type.dart';
import 'package:ab_final_entregable/screens/functions/custom_video_player.dart';
import 'package:ab_final_entregable/screens/functions/navigation_buttons.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

Widget getTypeLumina(BuildContext context) {
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;

  return SizedBox(
    height: screenHeight,
    width: screenWidth,
    child: Stack(
      fit: StackFit.expand,
      children: [
        buildBackgroundMBTL(context),
        buildEnterButtonTL(context),
        buildBackButton(context),
        buildExpandImageButtonTL(context),
        buildRightArrowButtonTL(context),
      ],
    ),
  );
}

Widget getActressAgain(BuildContext context) {
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;

  return SizedBox(
    height: screenHeight,
    width: screenWidth,
    child: Stack(
      fit: StackFit.expand,
      children: [
        buildBackgroundMBAACC(context),
        buildEnterButtonAACC(context),
        buildBackButton(context),
        buildExpandImageButtonAACC(context),
        buildLeftArrowButtonAACC(context),
      ],
    ),
  );
}

Widget getBody(
  BuildContext context,
  VideoPlayerController controller1,
  VideoPlayerController controller2,
) {
  return Column(
    children: [
      buildVideoPlayer(context, controller1),
      const SizedBox(height: 20),
      buildVideoPlayer(context, controller2),
      const SizedBox(height: 30),
      const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ultrices nisl nec massa vehicula, ac interdum elit porttitor.",
          style: TextStyle(color: Colors.white, fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
      const SizedBox(height: 20),
      SizedBox(height: 400, child: CrudForumType()),
    ],
  );
}