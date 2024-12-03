import 'dart:ui';

import 'package:flutter/material.dart';

Widget buildBackgroundMBTL() {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/bgs/MBTL_Cover.png"),
        fit: BoxFit.cover,
      ),
    ),
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: [
            Colors.black.withOpacity(0.4),
            Colors.transparent,
          ],
        ),
      ),
    ),
  );
}

Widget buildBackgroundMBAACC() {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/bgs/MBAACC_Cover.png"),
        fit: BoxFit.cover,
      ),
    ),
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: [
            Colors.black.withOpacity(0.4),
            Colors.transparent,
          ],
        ),
      ),
    ),
  );
}

Widget getBlurrCover(double screenHeight) {
  return Column(
    children: [
      Container(
        height: screenHeight,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bgs/MBTL_Cover.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.8),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
