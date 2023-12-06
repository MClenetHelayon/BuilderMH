import 'package:builder_mhrs/controller/color/colorManager.dart';
import 'package:flutter/material.dart';

Container similyCardKinsectValue(Widget child) {
  return Container(
      padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: primary
        ),
        child: child);
}