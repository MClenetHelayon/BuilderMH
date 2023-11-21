import 'package:builder_mhrs/manager/color/colorManager.dart';
import 'package:builder_mhrs/manager/text/color.dart';
import 'package:flutter/material.dart';

import 'img/imgManager.dart';

Container title(String t) {
  return Container(
      margin: const EdgeInsets.only(top: 5),
      child: Text(t,
          style: TextStyle(
            color: getFifth(),
            fontWeight: FontWeight.bold,
          )));
}

Container gDefSimply(String img, int value) {
  return Container(
      margin: const EdgeInsets.only(right: 5),
      child: printStatWhite(img, value.toString()));
}

Widget jowel(int leSlot, String nom) {
  String img = slot(leSlot);
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    Image.asset(img, height: 22, width: 22),
    const SizedBox(width: 10),
    white(nom),
  ]);
}

Widget printDoubleElemBlack(
    String image, int value, String image2, int value2) {
  return Row(children: [
    printStatBlack(image, value.toString()),
    black("/"),
    printStatBlack(image2, value2.toString())
  ]);
}

Widget printDoubleElemWhite(
    String image, int value, String image2, int value2) {
  return Row(children: [
    printStatWhite(image, value.toString()),
    white("/"),
    printStatWhite(image2, value2.toString())
  ]);
}

Widget printStatBlack(String img, String stat) {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    Image.asset(img, height: 15, width: 15),
    const SizedBox(width: 3),
    black(stat),
  ]);
}

Widget printStatWhite(String img, String stat) {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    Image.asset(img, height: 15, width: 15),
    const SizedBox(width: 3),
    white(stat),
  ]);
}

Widget cadreAmmoValueImg(double w, Widget value) {
  return Container(
      width: w,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black, // Couleur de la bordure
          width: 1.0, // Épaisseur de la bordure
        ),
      ),
      child: value);
}

Widget cadreAmmoValueStat(double w, Widget value) {
  return SizedBox(width: w, child: value);
}

Widget slotJowel(List<int> slots) {
  return slots.isEmpty
      ? const Text('- / - / -')
      : Row(children: [
          for (int i = 0; i < 3; i++)
            Container(
                margin: const EdgeInsets.only(right: 8),
                child: Text(slots.length > i
                    ? '${slots[i].toString()} /'
                    : i != 2
                        ? '- /'
                        : '-'))
        ]);
}
