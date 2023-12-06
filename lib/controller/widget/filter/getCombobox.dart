import 'package:builder_mhrs/controller/color/colorManager.dart';
import 'package:builder_mhrs/controller/text/color.dart';
import 'package:builder_mhrs/controller/text/localization/arme/fusarb/getMod.dart';
import 'package:builder_mhrs/controller/text/localization/getCalam.dart';
import 'package:builder_mhrs/controller/text/localization/getElem.dart';
import 'package:builder_mhrs/controller/text/localization/getSharp.dart';
import 'package:builder_mhrs/controller/widget/printStatSimply.dart';
import 'package:builder_mhrs/model/Talent.dart';
import 'package:builder_mhrs/model/weapon/Arme.dart';
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
      }).toList());
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
      }).toList());
}

Widget filterComboSkill(List<Talent> skills, Talent cbxSkill,
    BuildContext context, Function(int?) onChanged) {
  skills = skills.toSet().toList();
  return DropdownButton<int>(
      onChanged: onChanged,
      value: cbxSkill.id,
      items: skills.map((Talent talent) {
        return DropdownMenuItem<int>(
            value: talent.id, child: Text(talent.name));
      }).toList());
}

Widget comboModFusar(
    Fusarbalete w, BuildContext context, Function(int?) onChanged) {
  return DropdownButton<int>(
      alignment: AlignmentDirectional.center,
      dropdownColor: primary,
      onChanged: onChanged,
      value: w.mod,
      items: <int>[0, 1, 2].map((int id) {
        return DropdownMenuItem<int>(
            alignment: AlignmentDirectional.center,
            value: id,
            child: white(getMod(id, w, context)));
      }).toList());
}

Widget comboCharmSlotLvl(int value, int max, Function(int?) onChanged) {
  List<DropdownMenuItem<int>> items = [];
  for (int i = 0; i <= max; i++) {
    items.add(DropdownMenuItem(value: i, child: Text('$i')));
  }
  return Container(
      margin: const EdgeInsets.all(5.0),
      child: DropdownButton<int>(
          value: value, onChanged: onChanged, items: items));
}

Widget comboCharmSkill(List<Talent> lskill, int talentIndex, bool first,
    int tIndexActif, Function(int?) onChanged) {
  List<DropdownMenuItem<int>> items = [];
  if (first) {
    for (int i = 0; i <= (lskill.length - 1); i++) {
      items.add(DropdownMenuItem(value: i, child: Text(lskill[i].name)));
    }
  } else {
    for (int i = 0; i <= (lskill.length - 1); i++) {
      if (lskill[i].id != tIndexActif || lskill[i].id == -1) {
        items.add(DropdownMenuItem(value: i, child: Text(lskill[i].name)));
      }
    }
  }
  return Container(
      margin: const EdgeInsets.all(5.0),
      child: DropdownButton<int>(
          value: talentIndex, onChanged: onChanged, items: items));
}

Widget comboCharmSkillLvl(int talentIndex, int talentLevel, 
    Function(int?) onChanged) {
  List<DropdownMenuItem<int>> items = [];
  if (talentIndex != -1) {
    for (int i = 1; i <= talentLevel; i++) {
      items.add(DropdownMenuItem(value: i, child: Text('$i')));
    }
  } else {
    items.add(const DropdownMenuItem(value: 0, child: Text('0')));
  }
  if (items.isEmpty) {
    items.add(const DropdownMenuItem(value: 0, child: Text('0')));
  }
  return Container(
      margin: const EdgeInsets.all(5.0),
      child: DropdownButton<int>(
          value: talentLevel, onChanged: onChanged, items: items));
}

