import 'package:flutter/material.dart';
import 'package:ab_final_entregable/data/data.dart';
import 'dart:ui';

class TlCharaSelection extends StatelessWidget {
  const TlCharaSelection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

//ESTE CÓDIGO NECESITA SER OPTIMIZADO Y RETOCADO
//ESTE CÓDIGO NECESITA SER OPTIMIZADO Y RETOCADO
//ESTE CÓDIGO NECESITA SER OPTIMIZADO Y RETOCADO
//ESTE CÓDIGO NECESITA SER OPTIMIZADO Y RETOCADO

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
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
                          //TRASPASAR EL FONDO BLURREADO A UNA FUNCIÓN CALLEABLE
                          //TRASPASAR EL FONDO BLURREADO A UNA FUNCIÓN CALLEABLE
                          //FUNCIÓN blurrBackgroundTL
                          //TRASPASAR EL FONDO BLURREADO A UNA FUNCIÓN CALLEABLE
                          //TRASPASAR EL FONDO BLURREADO A UNA FUNCIÓN CALLEABLE
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView(
              children: [
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  alignment: WrapAlignment.center,
                  children: characterData.map((character) {
                    return SizedBox(
                      width: 180,
                      height: 395,
                      child: Card(
                        color: Colors.black.withOpacity(0.7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.asset(
                                character.chImage,
                                fit: BoxFit.fitHeight,
                                width: double.infinity,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              character.chName,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                //TRASPASAR EL USAGE DE CARDS POR DATA
                                //A UNA FUNCIÓN CALLEABLE DENTRO DEL WIDGET
                                //CONTENT.DART
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Positioned(
            top: 12,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 32),
              onPressed: () {
                Navigator.pop(context);
                //EL BOTÓN SERÁ HECHO UN WIDGET Y LLEVADO A LOS NAVIGATION_BUTTONS
              },
            ),
          ),
        ],
      ),
    );
  }
}
