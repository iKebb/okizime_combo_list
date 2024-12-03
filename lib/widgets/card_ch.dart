import 'package:ab_final_entregable/data/data.dart';
import 'package:flutter/material.dart';

Widget buildCardCh() {
  return Padding(
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
  );
}
