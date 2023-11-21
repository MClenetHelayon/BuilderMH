import 'package:builder_mhrs/manager/color/colorManager.dart';
import 'package:builder_mhrs/manager/statManager.dart';
import 'package:builder_mhrs/manager/text/color.dart';
import 'package:builder_mhrs/manager/textManager.dart';
import 'package:builder_mhrs/object/armor/Armure.dart';
import 'package:builder_mhrs/object/Stuff.dart';
import 'package:builder_mhrs/object/Talisman.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'joyauManager.dart';
import 'talentManager.dart';

Widget armorTopInfo(Armure armure) {
  return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              margin: const EdgeInsets.only(bottom: 20.0),
              child: title(armure.name))
        ]),
        statDef(armure),
      ]));
}

Row armorTalent(Armure armure, BuildContext context) {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    Container(
        margin: const EdgeInsets.only(top: 10.0, bottom: 3),
        child: Column(
          children: [
            white(AppLocalizations.of(context)!.talent),
            talentIfHere(armure),
          ],
        ))
  ]);
}

Widget armorSlot(Armure armure, BuildContext context, Widget joyau) {
  return Container(
      margin: const EdgeInsets.only(top: 10.0, bottom: 5),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(children: [
          Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              child: white(armure.slots.length == 0
                  ? AppLocalizations.of(context)!.nJoyau
                  : AppLocalizations.of(context)!.joyaux)),
          Container(child: joyau)
        ])
      ]));
}

Widget armorSlotCasque(
    Armure armure, Stuff s, VoidCallback onUpdated, BuildContext context) {
  return Column(children: [
    if (armure.slots.length >= 1)
      if (armure.slots[0] != 0)
        Card(
            color: getPrimary(),
            child: joyauCasque(armure.slots[0], 0, s, onUpdated)),
    if (armure.slots.length >= 2)
      if (armure.slots[1] != 0)
        Card(
            color: getPrimary(),
            child: joyauCasque(armure.slots[1], 1, s, onUpdated)),
    if (armure.slots.length == 3)
      if (armure.slots[2] != 0)
        Card(
            color: getPrimary(),
            child: joyauCasque(armure.slots[2], 2, s, onUpdated)),
  ]);
}

Widget armorSlotPlastron(
    Armure armure, Stuff s, VoidCallback onUpdated, BuildContext context) {
  return Column(children: [
    if (armure.slots.length >= 1)
      if (armure.slots[0] != 0)
        Card(
            color: getPrimary(),
            child: joyauPlastron(armure.slots[0], 0, s, onUpdated)),
    if (armure.slots.length >= 2)
      if (armure.slots[1] != 0)
        Card(
            color: getPrimary(),
            child: joyauPlastron(armure.slots[1], 1, s, onUpdated)),
    if (armure.slots.length == 3)
      if (armure.slots[2] != 0)
        Card(
            color: getPrimary(),
            child: joyauPlastron(armure.slots[2], 2, s, onUpdated)),
  ]);
}

Widget armorSlotBras(
    Armure armure, Stuff s, VoidCallback onUpdated, BuildContext context) {
  return Column(children: [
    if (armure.slots.length >= 1)
      if (armure.slots[0] != 0)
        Card(
            color: getPrimary(),
            child: joyauBras(armure.slots[0], 0, s, onUpdated)),
    if (armure.slots.length >= 2)
      if (armure.slots[1] != 0)
        Card(
            color: getPrimary(),
            child: joyauBras(armure.slots[1], 1, s, onUpdated)),
    if (armure.slots.length == 3)
      if (armure.slots[2] != 0)
        Card(
            color: getPrimary(),
            child: joyauBras(armure.slots[2], 2, s, onUpdated)),
  ]);
}

Widget armorSlotCeinture(
    Armure armure, Stuff s, VoidCallback onUpdated, BuildContext context) {
  return Column(children: [
    if (armure.slots.length >= 1)
      if (armure.slots[0] != 0)
        Card(
            color: getPrimary(),
            child: joyauCeinture(armure.slots[0], 0, s, onUpdated)),
    if (armure.slots.length >= 2)
      if (armure.slots[1] != 0)
        Card(
            color: getPrimary(),
            child: joyauCeinture(armure.slots[1], 1, s, onUpdated)),
    if (armure.slots.length == 3)
      if (armure.slots[2] != 0)
        Card(
            color: getPrimary(),
            child: joyauCeinture(armure.slots[2], 2, s, onUpdated)),
  ]);
}

Widget armorSlotJambiere(
    Armure armure, Stuff s, VoidCallback onUpdated, BuildContext context) {
  return Column(children: [
    if (armure.slots.length >= 1)
      if (armure.slots[0] != 0)
        Card(
            color: getPrimary(),
            child: joyauJambiere(armure.slots[0], 0, s, onUpdated)),
    if (armure.slots.length >= 2)
      if (armure.slots[1] != 0)
        Card(
            color: getPrimary(),
            child: joyauJambiere(armure.slots[1], 1, s, onUpdated)),
    if (armure.slots.length == 3)
      if (armure.slots[2] != 0)
        Card(
            color: getPrimary(),
            child: joyauJambiere(armure.slots[2], 2, s, onUpdated)),
  ]);
}

Widget TalisJoyau(
    Talisman charm, Stuff s, VoidCallback onUpdated, BuildContext context) {
  return Column(children: [
    Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        child: whiteBoldUnderligne(s.charm.slots.length == 0
            ? AppLocalizations.of(context)!.nJoyau
            : AppLocalizations.of(context)!.joyaux)),
    Column(children: [
      if (s.charm.slots.length >= 1)
        if (s.charm.slots[0] != 0)
          Card(
              color: getPrimary(),
              child: joyauTalisman(s.charm.slots[0], 0, s, onUpdated)),
      if (s.charm.slots.length >= 2)
        if (s.charm.slots[1] != 0)
          Card(
              color: getPrimary(),
              child: joyauTalisman(s.charm.slots[1], 1, s, onUpdated)),
      if (s.charm.slots.length == 3)
        if (s.charm.slots[2] != 0)
          Card(
              color: getPrimary(),
              child: joyauTalisman(s.charm.slots[2], 2, s, onUpdated)),
    ])
  ]);
}

Widget TalisTalent(Talisman charm, BuildContext context) {
  return Column(children: [
    Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        child: whiteBoldUnderligne(charm.talents.isEmpty
            ? AppLocalizations.of(context)!.nTalent
            : AppLocalizations.of(context)!.talents)),
    Column(children: [
      if (charm.talents.length >= 1)
        Container(
          margin: const EdgeInsets.only(bottom: 5.0),
          child: talent("${charm.talents[0].name} +${charm.talents[0].level}"),
        ),
      if (charm.talents.length >= 2)
        Container(
            margin: const EdgeInsets.only(bottom: 5.0),
            child:
                talent("${charm.talents[1].name} +${charm.talents[1].level}"))
    ])
  ]);
}
