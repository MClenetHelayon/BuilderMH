import 'package:flutter/material.dart';

Widget slotJowel(List<int> slots) {
  String vretour = '';
  if (slots.isNotEmpty) {
    for (int i = 0; i < 3; i++) {
      if (slots.length > i) {
        vretour += '${slots[i].toString()} ${endSlot(i)}';
      } else {
        vretour += ' - ${endSlot(i)}';
      }
    }
  } else {
    vretour = '- / - / -';
  }
  return Text(vretour);
}

String endSlot(int i) {
  return i != 2 ? '/' : '';
}
