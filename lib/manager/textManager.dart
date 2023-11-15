import 'package:builder_mhrs/manager/colorManager.dart';
import 'package:builder_mhrs/manager/statManager.dart';
import 'package:flutter/material.dart';

import '../object/Stuff.dart';
import '../object/weapon/Arme.dart';
import 'imgManager.dart';

Container title(String t) {
  return Container(
      margin: const EdgeInsets.only(top: 5),
      child: Text(t,
          style: TextStyle(
            color: getFifth(),
            fontWeight: FontWeight.bold,
          )));
}

Text blue(String t) {
  return Text(t,
      style: const TextStyle(
        color: Colors.blue,
      ));
}

Text black(String t) {
  return Text(t,
      style: TextStyle(
        color: getSecondary(),
      ));
}

Text white(String t) {
  return Text(t,
      style: TextStyle(
        color: getFourth(),
      ));
}

Text switchColor(String t, int max, num value) {
  return Text(t,
      style: TextStyle(
          color: value <= max && value > 0 ? Colors.black : Colors.red));
}

Container gDefSimply(String img, int value) {
  return Container(
      margin: const EdgeInsets.only(right: 5),
      child: printStat(img, value.toString()));
}

Widget jowel(int leSlot, String nom) {
  String img = slot(leSlot);
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    Image.asset(img, height: 22, width: 22),
    const SizedBox(width: 10),
    Text(nom, style: const TextStyle(color: Colors.blue)),
  ]);
}

Widget printDoubleElem(String image, int value, String image2, int value2) {
  return Row(
    children: [
      printStat(image, value.toString()),
      const Text("/", style: TextStyle(color: Colors.blue)),
      printStat(image2, value2.toString())
    ],
  );
}

Widget printStat(String img, String stat) {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    Image.asset(img, height: 15, width: 15),
    const SizedBox(width: 3),
    Text(stat),
  ]);
}

Widget printStatWhite(String img, String stat) {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    Image.asset(img, height: 15, width: 15),
    const SizedBox(width: 3),
    Text(
      stat,
      style: const TextStyle(color: Colors.white),
    ),
  ]);
}

Widget listTranchant(Stuff s) {
  List<int> allSharp = allIntSharp(s);

  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    Text(
        "${allSharp[0]}/${allSharp[1]}/${allSharp[2]}/${allSharp[3]}/${allSharp[4]}/${allSharp[5]}/${allSharp[6]}")
  ]);
}

Widget cadreAmmoValue(double w, Widget value) {
  return Container(
      width: w,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black, // Couleur de la bordure
          width: 1.0, // Épaisseur de la bordure
        ),
      ),
      child: value);
}

Widget printSlotJowel(Arme weapon) {
  Widget vretour = const Text('- / - / -');
  if (weapon.slots.isNotEmpty) {
    Row(children: [
      for (int i = 0; i < 3; i++)
        Container(
          margin: const EdgeInsets.only(right: 8),
          child: Text(
            weapon.slots.length > i
                ? i != 2 || weapon.slots.length > i + 1
                    ? '${weapon.slots[i].toString()} /'
                    : weapon.slots[i].toString()
                : i != 2
                    ? '- /'
                    : '-',
          ),
        ),
    ]);
  }
  return vretour;
}

Widget verticalDivider() {
  return Container(
    height: 50.0,
    color: getThird(), // Couleur du séparateur
    width: 1.0, // Épaisseur du séparateur
  );
}
