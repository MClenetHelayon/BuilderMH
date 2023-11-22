import 'package:builder_mhrs/manager/color/colorManager.dart';
import 'package:builder_mhrs/manager/color/colorSharp.dart';
import 'package:builder_mhrs/manager/text/color.dart';
import 'package:flutter/material.dart';

Widget doubleElemBlack(String image, int value, String image2, int value2) {
  return Row(children: [
    statBlack(image, value.toString()),
    black("/"),
    statBlack(image2, value2.toString())
  ]);
}

Widget doubleElemWhite(String image, int value, String image2, int value2) {
  return Row(children: [
    statWhite(image, value.toString()),
    white("/"),
    statWhite(image2, value2.toString())
  ]);
}

Widget statBlack(String img, String stat) {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    Image.asset(img, height: 15, width: 15),
    const SizedBox(width: 3),
    black(stat),
  ]);
}

Widget statWhite(String img, String stat) {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    Image.asset(img, height: 15, width: 15),
    const SizedBox(width: 3),
    white(stat),
  ]);
}

Widget statComboElem(String img, String stat) {
  return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
    Image.asset(img, height: 18, width: 18),
    const SizedBox(width: 3),
    Text(stat),
  ]);
}

Widget statComboCalam(String img) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [Image.asset(img, height: 18, width: 18)]);
}

Widget statComboSharp(int id, String stat) {
  return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
    Container(width: 10.0, height: 10.0, color: couleur(id)),
    const SizedBox(width: 3),
    Text(stat),
  ]);
}

Container statDefSimply(String img, int value) {
  return Container(
      margin: const EdgeInsets.only(right: 5),
      child: statWhite(img, value.toString()));
}

Container statFlor(String img, int stat) {
  return Container(
    margin: const EdgeInsets.only(left: 10.0),
    child: statWhite(img, stat.toString()),
  );
}

Container statArme(Widget wg) {
  return Container(
      margin: const EdgeInsets.only(bottom: 5.0, top: 15.0), child: wg);
}

Container talent(String nom) {
  return Container(
      margin: const EdgeInsets.only(left: 20.0),
      child: Row(children: [
        Image.asset('images/joyau/skill.webp', height: 22, width: 22),
        const SizedBox(width: 5),
        white(nom),
      ]));
}

Container title(String t) {
  return Container(
      margin: const EdgeInsets.only(top: 5),
      child: Text(t,
          style: TextStyle(
            color: getFifth(),
            fontWeight: FontWeight.bold,
          )));
}
