import 'package:builder_mhrs/controller/color/colorManager.dart';
import 'package:builder_mhrs/controller/color/colorSharp.dart';
import 'package:builder_mhrs/controller/img/armor.dart';
import 'package:builder_mhrs/controller/text/color.dart';
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

Widget stat(String img, String stat) {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    Image.asset(img, height: 18, width: 18),
    const SizedBox(width: 3),
    Text(stat),
  ]);
}

Widget statBlack(String img, String stat) {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    Image.asset(img, height: 18, width: 18),
    const SizedBox(width: 3),
    black(stat),
  ]);
}

Widget statWhite(String img, String stat) {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    Image.asset(img, height: 18, width: 18),
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
    Container(
        width: 10.0,
        height: 10.0,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: secondary),
            color: couleur(id))),
    const SizedBox(width: 3),
    Text(stat),
  ]);
}

Widget pMusic(String img, String stat, bool forImg) {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    Image.asset(img, height: 40, width: 40),
    const SizedBox(width: 3),
    forImg ? black(stat) : white(stat)
  ]);
}

Container statDefSimply(String img, int value) {
  return Container(
      margin: const EdgeInsets.only(right: 5),
      child: statWhite(img, value.toString()));
}

Container statDefSimplyImg(String img, int value) {
  return Container(
      margin: const EdgeInsets.only(right: 5),
      child: statBlack(img, value.toString()));
}

Container statFlor(String img, int stat, bool isImg) {
  return Container(
    padding: isImg ? const EdgeInsets.all(3) : const EdgeInsets.all(0),
    decoration: isImg
        ? BoxDecoration(
            color: secondary, borderRadius: BorderRadius.circular(5))
        : const BoxDecoration(),
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
        Image.asset(skill, height: 22, width: 22),
        const SizedBox(width: 5),
        white(nom),
      ]));
}

Container title(String t) {
  return Container(margin: const EdgeInsets.only(top: 5), child: boldOrange(t));
}
