import 'package:builder_mhrs/manager/local/getSharp.dart';
import 'package:builder_mhrs/manager/sharpManager.dart';
import 'package:builder_mhrs/object/Talent.dart';
import 'package:flutter/material.dart';

import '../local/getCalam.dart';
import '../local/getElem.dart';

Widget filterComboElem(
    String cbxElem, BuildContext context, Function(String?) onChanged) {
  return DropdownButton<String>(
      value: cbxElem,
      onChanged: onChanged,
      items: <String>[
        'all',
        'none',
        'fire',
        'water',
        'thunder',
        'ice',
        'dragon',
        'poison',
        'para',
        'sleep',
        'explo'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
            value: value, child: getElemForCombo(value, context));
      }).toList());
}

Widget filterComboSharp(
    String cbxSharp, BuildContext context, Function(String?) onChanged) {
  return DropdownButton<String>(
    value: cbxSharp,
    onChanged: onChanged,
    items: <String>['r', 'o', 'j', 'v', 'b', 'bc', 'vl']
        .map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
          value: value,
          child: statComboSharp(convertStringSharpToIdSharp(value),
              getSharpName(value, context)));
    }).toList(),
  );
}

Widget filterComboCalam(
    String cbxCalam, BuildContext context, Function(String?) onChanged) {
  return DropdownButton<String>(
    value: cbxCalam,
    onChanged: onChanged,
    items: <String>['all', '1', '2', '3']
        .map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
          value: value, child: getCalamForCombo(value, context));
    }).toList(),
  );
}

Widget filterComboSkill(List<Talent> skills, Talent cbxSkill,
    BuildContext context, Function(int?) onChanged) {
  skills = skills.toSet().toList();
  return DropdownButton<int>(
    onChanged: onChanged,
    value: cbxSkill.id,
    items: skills.map((Talent talent) {
      return DropdownMenuItem<int>(
        value: talent.id,
        child: Text(talent.name),
      );
    }).toList(),
  );
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
    Container(width: 10.0, height: 10.0, color: couleur(id)),
    const SizedBox(width: 3),
    Text(stat),
  ]);
}
