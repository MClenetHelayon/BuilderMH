import 'package:builder_mhrs/manager/color/colorManager.dart';
import 'package:flutter/material.dart';

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

Text whiteBoldUnderligne(String t) {
  return Text(t,
      style: TextStyle(
        color: getFourth(),
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline,
      ));
}

Text switchColorWhite(String t, int max, num value) {
  return Text(t,
      style: TextStyle(
          color: value <= max && value > 0 ? getFourth() : Colors.red));
}

Text switchColorBlack(String t, int max, num value) {
  return Text(t,
      style: TextStyle(
          color: value <= max && value > 0 ? getSecondary() : Colors.red));
}
