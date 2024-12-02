import 'package:ab_final_entregable/screens/functions/full_screen_image.dart';
import 'package:ab_final_entregable/screens/tl_chara_selection.dart';
import 'package:flutter/material.dart';
import 'package:ab_final_entregable/screens/type_lumina.dart';
import 'package:ab_final_entregable/screens/actress_again.dart';

//TODOS los navigation buttons (funciones definidas en este archivo)
//están o estarán wrapeados a un Stack; Positioned se utiliza para darle
//a los botones una posición absoluta dentro de la pantalla.
Widget buildBackButton(BuildContext context) {
  return Positioned(
    top: 12,
    left: 16,
    child: IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.white,
        size: 26,
      ),
      onPressed: () => Navigator.pop(context),
      //lleva a una pantalla anterior pero no definida
      //se añadirá una homescreen y este botón retornará
      //a la homescreen.
    ),
  );
}

Widget buildExpandImageButtonTL(BuildContext context) {
  return Positioned(
    top: 12,
    right: 16,
    child: IconButton(
      icon: const Icon(
        Icons.unfold_more_double,
        color: Colors.white,
        size: 26,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const FullScreenImage(
                //Navigator nos lleva a la nueva pantalla que es FullScreenImage
                //que se construye con el builder pasándole el contexto y su constructor
                //en este caso la ruta imagePath "..."
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
      icon: const Icon(
        Icons.unfold_more_double,
        color: Colors.white,
        size: 26,
      ),
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
    //se define con precisión la altura a la que estará
    //el iconButton; 0.5 es la mitad de la pantalla.
    //funciona como una matriz donde 0 es fullbot y 1 es fulltop.
    right: 16,
    child: IconButton(
      icon: const Icon(
        Icons.arrow_right,
        color: Colors.white,
        size: 40,
      ),
      onPressed: () {
        Navigator.pushReplacement(
          //pushReplacemente lleva a una nueva pantalla
          //pero elimina la anterior de la pila, es decir
          //que no se puede volver atrás usando buildBackButton.
          context,
          PageRouteBuilder(
            //función que permite buildear animaciones
            //de transición de pantallas.
            transitionDuration: const Duration(seconds: 1),
            pageBuilder: (context, animation, secondaryAnimation) {
              return const ActressAgain();
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var fadeAnimation =
                  //EXPLICACIÓN TÁCITA SACADA DE CHAT GPT:
                  //drive se utiliza para aplicar una curva de animación (CurveTween)
                  //al progreso de la animación.
                  //Esto asegura que la transición de opacidad
                  //tenga una aceleración/desaceleración suave con la curva easeInOut.
                  animation.drive(CurveTween(curve: Curves.easeInOut));
              var slideAnimation =
                  //slideAnimation es una animación de deslizamientO
                  //que mueve el widget desde fuera de la pantalla hasta su posición final.
                  Tween(begin: const Offset(1.0, 0.0), end: Offset.zero)
                      .chain(CurveTween(curve: Curves.easeInOut))
                      .animate(animation);

              return SlideTransition(
                position: slideAnimation,
                child: FadeTransition(
                  opacity: fadeAnimation,
                  child: child,
                  //SlideTransition aplica la animación de deslizamiento
                  //al child (el widget de la nueva pantalla).
                  //FadeTransition aplica la animación de desvanecimiento al mismo child.
                ),
              );
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
      icon: const Icon(
        Icons.arrow_left,
        color: Colors.white,
        size: 40,
      ),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(seconds: 1),
            pageBuilder: (context, animation, secondaryAnimation) {
              return const TypeLumina();
            },
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              var fadeAnimation = animation.drive(
                CurveTween(
                  curve: Curves.easeInOut,
                ),
              );
              var slideAnimation = Tween(
                begin: const Offset(-1.0, 0.0),
                end: Offset.zero,
              ).chain(CurveTween(curve: Curves.easeInOut)).animate(
                    animation,
                  );

              return SlideTransition(
                position: slideAnimation,
                child: FadeTransition(
                  opacity: fadeAnimation,
                  child: child,
                ),
              );
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
    //alineación del botón ENTER
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
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 16,
        ),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.white,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "ENTER",
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 10),
          Icon(
            Icons.arrow_forward,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),
    ),
  );
}

Widget buildEnterButtonAACC(BuildContext context) {
  return Align(
    alignment: const Alignment(0, 0.6),
    //alineación del botón ENTER
    child: ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 16,
        ),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.white,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.white,
          ),
          SizedBox(width: 10),
          Text(
            "ENTER",
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );
}
