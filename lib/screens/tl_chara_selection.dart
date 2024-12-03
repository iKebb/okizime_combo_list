import 'package:ab_final_entregable/widgets/backgrounds.dart';
import 'package:ab_final_entregable/widgets/card_ch.dart';
import 'package:flutter/material.dart';

class TlCharaSelection extends StatelessWidget {
  const TlCharaSelection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          getBlurrCover(screenHeight),
          buildCardCh(),
          Positioned(
            top: 12,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 32),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
