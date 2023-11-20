import 'package:accordion/accordion.dart';
import 'package:builder_mhrs/manager/colorManager.dart';
import 'package:flutter/material.dart';

Widget accordeon(AccordionSection content) {
  return Card(
      margin: const EdgeInsets.all(2),
      color: getThird(),
      child: Accordion(
          paddingListTop: 0,
          paddingListBottom: 0,
          paddingListHorizontal: 0,
          headerBackgroundColor: getThird(),
          headerBorderWidth: 0,
          headerBorderColorOpened: getThird(),
          headerBackgroundColorOpened: getThird(),
          contentBackgroundColor: getThird(),
          contentBorderColor: getThird(),
          contentBorderWidth: 0,
          scaleWhenAnimating: true,
          openAndCloseAnimation: true,
          headerPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          children: [content]));
}
