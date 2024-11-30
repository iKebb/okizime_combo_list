import 'package:ab_final_entregable/screens/functions/full_screen_image.dart';
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
                imagePath:
                    "assets/images/bgs/MBTL_Cover.png"), // Imagen de TypeLumina
          ),
        );
      },
    ),
  );
}

// Método específico para expandir imagen en ActressAgain
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
                imagePath:
                    "assets/images/bgs/MBAACC_Cover.png"), // Imagen de ActressAgain
          ),
        );
      },
    ),
  );
}

// Método para la flecha derecha de TypeLumina a ActressAgain
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
            transitionDuration:
                const Duration(seconds: 1), // 2 segundos de duración
            pageBuilder: (context, animation, secondaryAnimation) {
              return const ActressAgain();
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              // Fade + Slide (deslizar desde la derecha)
              var fadeAnimation =
                  animation.drive(CurveTween(curve: Curves.easeInOut));
              var slideAnimation =
                  Tween(begin: Offset(1.0, 0.0), end: Offset.zero)
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

// Método para la flecha izquierda de ActressAgain a TypeLumina
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
            transitionDuration:
                const Duration(seconds: 1), // 2 segundos de duración
            pageBuilder: (context, animation, secondaryAnimation) {
              return const TypeLumina();
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              // Fade + Slide (deslizar desde la izquierda)
              var fadeAnimation =
                  animation.drive(CurveTween(curve: Curves.easeInOut));
              var slideAnimation =
                  Tween(begin: Offset(-1.0, 0.0), end: Offset.zero)
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
