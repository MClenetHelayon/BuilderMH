import 'package:builder_mhrs/manager/color/colorManager.dart';
import 'package:builder_mhrs/manager/text/color.dart';
import 'package:builder_mhrs/manager/text/localization/arme/fusarb/getMod.dart';
import 'package:builder_mhrs/manager/text/localization/getCalam.dart';
import 'package:builder_mhrs/manager/text/localization/getElem.dart';
import 'package:builder_mhrs/manager/text/localization/getSharp.dart';
import 'package:builder_mhrs/manager/widget/printStatSimply.dart';
import 'package:builder_mhrs/object/Talent.dart';
import 'package:builder_mhrs/object/weapon/Arme.dart';
import 'package:flutter/material.dart';

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

Widget comboModFusar(
    Fusarbalete w, BuildContext context, Function(int?) onChanged) {
  return DropdownButton<int>(
    alignment: AlignmentDirectional.center,
    dropdownColor: getPrimary(),
    onChanged: onChanged,
    value: w.mod,
    items: <int>[0, 1, 2].map((int id) {
      return DropdownMenuItem<int>(
        alignment: AlignmentDirectional.center,
        value: id,
        child: white(getMod(id, w, context)),
      );
    }).toList(),
  );
}