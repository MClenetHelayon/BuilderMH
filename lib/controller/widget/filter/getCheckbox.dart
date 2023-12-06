import 'package:builder_mhrs/controller/color/colorManager.dart';
import 'package:builder_mhrs/controller/text/color.dart';
import 'package:flutter/material.dart';

Widget checkboxArme(String img, bool check, Function(bool) onTapAction) {
  return Card(
      color: third,
      child: GestureDetector(
          onTap: () => onTapAction(!check),
          child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  border: Border.all(color: fifth, width: 1),
                  image: DecorationImage(image: AssetImage(img)),
                  borderRadius: BorderRadius.circular(5),
                  color: check ? fifth : Colors.transparent))));
}

Widget checkboxDeco(
    String img, bool check, bool actif, Function(bool) onTapAction) {
  return Card(
      color: third,
      child: GestureDetector(
          onTap: () => actif ? onTapAction(!check) : null,
          child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  border: Border.all(color: actif ? fifth : third, width: 1),
                  image: DecorationImage(image: AssetImage(img)),
                  borderRadius: BorderRadius.circular(5),
                  color: check ? fifth : Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                        color: actif ? secondary : third,
                        spreadRadius: 3,
                        blurRadius: 2)
                  ]))));
}

Widget checkboxRank(String txt, bool check, Function onTapAction) {
  return Card(
      color: third,
      child: GestureDetector(
          onTap: () => onTapAction(),
          child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  border: Border.all(color: fifth, width: 1),
                  borderRadius: BorderRadius.circular(5),
                  color: check ? fifth : Colors.transparent),
              child: Center(child: boldBlack(txt)))));
}

Widget checkboxAugment(String txt, bool check, Function onTapAction) {
  return Card(
      color: third,
      child: GestureDetector(
          onTap: () => onTapAction(),
          child: Container(
              width: 80,
              height: 30,
              decoration: BoxDecoration(
                  border: Border.all(color: fifth, width: 1),
                  borderRadius: BorderRadius.circular(5),
                  color: check ? fifth : Colors.transparent),
              child: Center(
                  child: Text(txt,
                      style: const TextStyle(fontWeight: FontWeight.bold))))));
}

Widget checkboxModAugment(
    Widget child, bool check, int i, int slot, Function onTapAction) {
  return Card(
      color: i <= slot ? fourth : third,
      child: GestureDetector(
          onTap: (i <= slot) || check ? () => onTapAction() : null,
          child: Container(
              width: 50,
              height: 30,
              decoration: BoxDecoration(
                  border: Border.all(color: fifth, width: 1),
                  borderRadius: BorderRadius.circular(5),
                  color: check ? fifth : Colors.transparent),
              child: Center(child: child))));
}
