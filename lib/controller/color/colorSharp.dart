import 'package:flutter/material.dart';

Color couleur(int i) {
  switch (i) {
    case 1:
      return const Color.fromARGB(
        255,
        190,
        56,
        67,
      );
    case 2:
      return const Color.fromARGB(
        255,
        211,
        103,
        61,
      );
    case 3:
      return const Color.fromARGB(
        255,
        201,
        178,
        50,
      );
    case 4:
      return const Color.fromARGB(
        255,
        129,
        176,
        52,
      );
    case 5:
      return const Color.fromARGB(
        255,
        58,
        88,
        215,
      );
    case 6:
      return const Color.fromARGB(
        255,
        226,
        226,
        226,
      );
    case 7:
      return const Color.fromARGB(
        255,
        136,
        90,
        236,
      );
    default:
      return const Color.fromARGB(255, 45, 45, 45);
  }
}
