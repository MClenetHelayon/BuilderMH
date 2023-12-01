import 'package:builder_mhrs/manager/color/colorManager.dart';
import 'package:builder_mhrs/manager/img/imgManager.dart';
import 'package:builder_mhrs/manager/img/weapon.dart';
import 'package:builder_mhrs/object/Stuff.dart';
import 'package:flutter/material.dart';

Widget afficheImgKinsect() {
  return Card(
      color: secondary,
      child: Container(
          padding: const EdgeInsets.all(3),
          margin: const EdgeInsets.all(5),
          height: 35,
          width: 35,
          child: Image.asset(ksct)));
}

Widget afficheIconArmor(Stuff s, int i, bool isArmor) {
  return Card(
      color: secondary,
      child: Container(
          padding: const EdgeInsets.all(3),
          margin: const EdgeInsets.all(5),
          height: 50,
          width: 70,
          child: Image.asset(isArmor ? armure(i) : arme(s.weapon.categorie))));
}

Widget afficheIconArmorImg(Stuff s, int i, bool isArmor) {
  return Card(
      color: secondary,
      child: Container(
          padding: const EdgeInsets.all(3),
          margin: const EdgeInsets.all(5),
          height: 35,
          width: 35,
          child: Image.asset(isArmor ? armure(i) : arme(s.weapon.categorie))));
}
