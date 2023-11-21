import 'package:builder_mhrs/manager/color/colorManager.dart';
import 'package:flutter/material.dart';

Widget verticalDivider() {
  return Container(
    height: 50.0,
    color: getThird(), // Couleur du séparateur
    width: 1.0, // Épaisseur du séparateur
  );
}

Widget verticalDividerBlack() {
  return Container(
    height: 50.0,
    color: Colors.black, // Couleur du séparateur
    width: 1.0, // Épaisseur du séparateur
  );
}
