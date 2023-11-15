import 'package:flutter/material.dart';

Widget checkboxArme(String img, bool check, Function(bool) onTapAction) {
  return Card(
      color: const Color.fromARGB(255, 190, 190, 190),
      child: GestureDetector(
          onTap: () => onTapAction(!check),
          child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(img),
                  ),
                  borderRadius: BorderRadius.circular(5),
                  color: check
                      ? const Color.fromARGB(148, 207, 25, 25)
                      : Colors.transparent))));
}

Widget checkboxRank(String txt, bool check, Function onTapAction) {
  return Card(
      color: const Color.fromARGB(255, 190, 190, 190),
      child: GestureDetector(
          onTap: () => onTapAction(),
          child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: check
                      ? const Color.fromARGB(148, 207, 25, 25)
                      : Colors.transparent),
              child: Center(
                  child: Text(txt,
                      style: const TextStyle(fontWeight: FontWeight.bold))))));
}
