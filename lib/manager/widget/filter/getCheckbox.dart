import 'package:builder_mhrs/manager/color/colorManager.dart';
import 'package:flutter/material.dart';

Widget checkboxArme(String img, bool check, Function(bool) onTapAction) {
  return Card(
      color: getThird(),
      child: GestureDetector(
          onTap: () => onTapAction(!check),
          child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  border: Border.all(color: getFifth(), width: 1),
                  image: DecorationImage(image: AssetImage(img)),
                  borderRadius: BorderRadius.circular(5),
                  color: check ? getFifth() : Colors.transparent))));
}

Widget checkboxRank(String txt, bool check, Function onTapAction) {
  return Card(
      color: getThird(),
      child: GestureDetector(
          onTap: () => onTapAction(),
          child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  border: Border.all(color: getFifth(), width: 1),
                  borderRadius: BorderRadius.circular(5),
                  color: check ? getFifth() : Colors.transparent),
              child: Center(
                  child: Text(txt,
                      style: const TextStyle(fontWeight: FontWeight.bold))))));
}

Widget checkboxAugment(String txt, bool check, Function onTapAction) {
  return Card(
      color: getThird(),
      child: GestureDetector(
          onTap: () => onTapAction(),
          child: Container(
              width: 80,
              height: 30,
              decoration: BoxDecoration(
                  border: Border.all(color: getFifth(), width: 1),
                  borderRadius: BorderRadius.circular(5),
                  color: check ? getFifth() : Colors.transparent),
              child: Center(
                  child: Text(txt,
                      style: const TextStyle(fontWeight: FontWeight.bold))))));
}

Widget checkboxModAugment(
    Widget child, bool check, int i, int slot, Function onTapAction) {
  return Card(
      color: getFourth(),
      child: GestureDetector(
          onTap: /*i <= slot ?*/ () => onTapAction() /*: null*/,
          child: Container(
              width: 50,
              height: 30,
              decoration: BoxDecoration(
                  border: Border.all(color: getFifth(), width: 1),
                  borderRadius: BorderRadius.circular(5),
                  color: check ? getFifth() : Colors.transparent),
              child: Center(child: child))));
}
