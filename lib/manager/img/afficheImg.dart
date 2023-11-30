import 'package:builder_mhrs/manager/color/colorManager.dart';
import 'package:builder_mhrs/manager/img/weapon.dart';
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
