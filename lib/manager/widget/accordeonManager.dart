import 'package:accordion/accordion.dart';
import 'package:builder_mhrs/manager/color/colorManager.dart';
import 'package:flutter/material.dart';

Widget accordeon(AccordionSection content) {
  return Card(
      margin: const EdgeInsets.all(2),
      color: third,
      child: Accordion(
          paddingListTop: 0,
          paddingListBottom: 0,
          paddingListHorizontal: 0,
          headerBackgroundColor: third,
          headerBorderWidth: 0,
          headerBorderColorOpened: third,
          headerBackgroundColorOpened: third,
          contentBackgroundColor: third,
          contentBorderColor: third,
          contentBorderWidth: 0,
          scaleWhenAnimating: true,
          openAndCloseAnimation: true,
          headerPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          children: [content]));
}
