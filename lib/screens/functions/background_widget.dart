import 'package:flutter/material.dart';

Widget buildBackgroundMBTL(BuildContext context) {
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

Widget buildBackgroundMBAACC(BuildContext context) {
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
