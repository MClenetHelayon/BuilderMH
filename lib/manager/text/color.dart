import 'package:builder_mhrs/manager/color/colorManager.dart';
import 'package:flutter/material.dart';

Text blue(String t) {
  return Text(t, style: const TextStyle(color: Colors.blue));
}

Text black(String t) {
  return Text(t, style: const TextStyle(color: secondary));
}

Text white(String t) {
  return Text(t, style: const TextStyle(color: fourth));
}

Text whiteBoldUnderligne(String t) {
  return Text(t,
      style: const TextStyle(
          color: fourth,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline));
}

Text switchColorWhite(String t, int max, num value) {
  return Text(t,
      style: TextStyle(
          color: value <= max && value > 0 ? fourth : Colors.red));
}

Text switchColorBlack(String t, int max, num value) {
  return Text(t,
      style: TextStyle(
          color: value <= max && value > 0 ? secondary : Colors.red));
}

Text boldBlack(String t) {
  return Text(t,
      style: const TextStyle(color: sixth, fontWeight: FontWeight.bold));
}

Text boldWhite(String t) {
  return Text(t,
      style: const TextStyle(color: fourth, fontWeight: FontWeight.bold));
}

Text boldOrange(String t) {
  return Text(t,
      style: const TextStyle(color: fifth, fontWeight: FontWeight.bold));
}
