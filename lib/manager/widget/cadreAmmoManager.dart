import 'package:flutter/material.dart';

Widget cadreAmmoValueImg(double w, Widget value) {
  return Container(
      width: w,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.black, // Couleur de la bordure
        width: 1.0, // Épaisseur de la bordure
      )),
      child: value);
}

Widget cadreAmmoValueStat(double w, Widget value) {
  return SizedBox(width: w, child: value);
}
