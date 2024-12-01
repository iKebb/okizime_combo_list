import 'package:ab_final_entregable/screens/functions/full_screen_image.dart';
import 'package:ab_final_entregable/screens/tl_chara_selection.dart';
import 'package:flutter/material.dart';
import 'package:ab_final_entregable/screens/type_lumina.dart'; // Importa TypeLumina
import 'package:ab_final_entregable/screens/actress_again.dart'; // Importa ActressAgain

// Método común para el botón de retroceso
Widget buildBackButton(BuildContext context) {
  return Positioned(
    top: 12,
    left: 16,
    child: IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.white, size: 26),
      onPressed: () => Navigator.pop(context),
    ),
  );
}

// Método específico para expandir imagen en TypeLumina
Widget buildExpandImageButtonTL(BuildContext context) {
  return Positioned(
    top: 12,
    right: 16,
    child: IconButton(
      icon: const Icon(Icons.unfold_more_double, color: Colors.white, size: 26),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const FullScreenImage(
                imagePath: "assets/images/bgs/MBTL_Cover.png"),
          ),
        );
      },
    ),
  );
}

Widget buildExpandImageButtonAACC(BuildContext context) {
  return Positioned(
    top: 12,
    right: 16,
    child: IconButton(
      icon: const Icon(Icons.unfold_more_double, color: Colors.white, size: 26),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const FullScreenImage(
                imagePath: "assets/images/bgs/MBAACC_Cover.png"),
          ),
        );
      },
    ),
  );
}

Widget buildRightArrowButtonTL(BuildContext context) {
  return Positioned(
    top: MediaQuery.of(context).size.height * 0.5,
    right: 16,
    child: IconButton(
      icon: const Icon(Icons.arrow_right, color: Colors.white, size: 40),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(seconds: 1),
            pageBuilder: (context, animation, secondaryAnimation) {
              return const ActressAgain();
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var fadeAnimation =
                  animation.drive(CurveTween(curve: Curves.easeInOut));
              var slideAnimation =
                  Tween(begin: const Offset(1.0, 0.0), end: Offset.zero)
                      .chain(CurveTween(curve: Curves.easeInOut))
                      .animate(animation);

              return SlideTransition(
                  position: slideAnimation,
                  child: FadeTransition(opacity: fadeAnimation, child: child));
            },
          ),
        );
      },
    ),
  );
}

Widget buildLeftArrowButtonAACC(BuildContext context) {
  return Positioned(
    top: MediaQuery.of(context).size.height * 0.5,
    left: 16,
    child: IconButton(
      icon: const Icon(Icons.arrow_left, color: Colors.white, size: 40),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(seconds: 1),
            pageBuilder: (context, animation, secondaryAnimation) {
              return const TypeLumina();
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var fadeAnimation =
                  animation.drive(CurveTween(curve: Curves.easeInOut));
              var slideAnimation =
                  Tween(begin: const Offset(-1.0, 0.0), end: Offset.zero)
                      .chain(CurveTween(curve: Curves.easeInOut))
                      .animate(animation);

              return SlideTransition(
                  position: slideAnimation,
                  child: FadeTransition(opacity: fadeAnimation, child: child));
            },
          ),
        );
      },
    ),
  );
}

Widget buildEnterButtonTL(BuildContext context) {
  return Align(
    alignment: const Alignment(0, 0.6),
    child: ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TlCharaSelection(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.white, width: 3),
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "ENTER",
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          SizedBox(width: 10),
          Icon(Icons.arrow_forward, size: 30, color: Colors.white),
        ],
      ),
    ),
  );
}

Widget buildEnterButtonAACC(BuildContext context) {
  return Align(
    alignment: const Alignment(0, 0.6),
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
