import 'package:builder_mhrs/manager/colorManager.dart';
import 'package:builder_mhrs/manager/local/arme/cbTypeFiole.dart';
import 'package:builder_mhrs/manager/local/arme/saTypeFiole.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../object/weapon/Arme.dart';
import '../object/Stuff.dart';
import '../object/weapon/tranchant/CornedeChasse.dart';
import '../object/weapon/tranchant/Insectoglaive.dart';
import '../object/weapon/tranchant/LameDouble.dart';
import '../object/weapon/tranchant/Lancecanon.dart';
import '../object/weapon/tranchant/MorphoHache.dart';
import '../object/weapon/tranchant/VoltoHache.dart';
import 'imgManager.dart';
import 'joyauManager.dart';
import 'local/arme/glTypeCanon.dart';
import 'sharpManager.dart';
import 'statManager.dart';
import 'textManager.dart';

Widget valueWeapon(Arme weapon, BuildContext context) {
  return Container(
      margin: const EdgeInsets.all(10.0),
      child: Container(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    weapon.name,
                    style: TextStyle(
                      color: getFifth(),
                      fontWeight: FontWeight.bold,
                    ),
                  ))
            ]),
            statOff(weapon, context),
            if (weapon is Tranchant)
              Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        sharpStat(weapon),
                      ])),
            if (weapon is Lancecanon) lancecanon(weapon, context),
            if (weapon is MorphoHache) morpho(weapon, context),
            if (weapon is VoltoHache) volto(weapon, context),
            if (weapon is Insectoglaive) insecto(weapon, context),
          ])));
}

Widget joyau(
    Arme weapon, Stuff s, VoidCallback onUpdated, BuildContext context) {
  return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    Column(children: [
      Container(
          margin: const EdgeInsets.only(bottom: 10.0),
          child: white(s.weapon.slots.length == 0
              ? AppLocalizations.of(context)!.nJoyau
              : AppLocalizations.of(context)!.joyaux)),
      Container(
          margin: const EdgeInsets.only(bottom: 10.0),
          child: Column(children: [
            if (s.weapon.slots.length >= 1)
              if (s.weapon.slots[0] != 0)
                Card(child: joyauArme(s.weapon.slots[0], 0, s, onUpdated)),
            if (s.weapon.slots.length >= 2)
              if (s.weapon.slots[1] != 0)
                Card(child: joyauArme(s.weapon.slots[1], 1, s, onUpdated)),
            if (s.weapon.slots.length == 3)
              if (s.weapon.slots[2] != 0)
                Card(child: joyauArme(s.weapon.slots[2], 2, s, onUpdated)),
          ]))
    ])
  ]));
}

Widget corne(CorneDeChasse horn, BuildContext context) {
  return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(children: [
          Container(
              margin: const EdgeInsets.only(bottom: 10.0, top: 5.0),
              child: Text(AppLocalizations.of(context)!.music)),
          printStatWhite(musique(0), horn.musique[0].name),
          printStatWhite(musique(1), horn.musique[1].name),
          printStatWhite(musique(2), horn.musique[2].name),
        ])
      ]));
}

Widget morpho(MorphoHache morpho, BuildContext context) {
  return Container(
      margin: const EdgeInsets.only(bottom: 5.0, top: 15.0),
      child: morpho.valueFiole != 0
          ? Text(
              "${getSaFiole(morpho.typeFiole, context)} ${morpho.valueFiole}")
          : Text(getSaFiole(morpho.typeFiole, context)));
}

Widget volto(VoltoHache volto, BuildContext context) {
  return Container(
      margin: const EdgeInsets.only(bottom: 5.0, top: 15.0),
      child: Text(getCbFiole(volto.typeFiole, context)));
}

Widget lancecanon(Lancecanon gunlance, BuildContext context) {
  return Container(
      margin: const EdgeInsets.only(bottom: 5.0, top: 15.0),
      child: Text(
          "${AppLocalizations.of(context)!.canon} : ${getTypeCanon(gunlance.typeCanon, context)} ${gunlance.niveauCanon}"));
}

Widget insecto(Insectoglaive insect, BuildContext context) {
  return Container(
      margin: const EdgeInsets.only(bottom: 10.0, top: 10.0),
      child: Column(children: [
        Text(
            "${AppLocalizations.of(context)!.kinsectLvl} : ${insect.niveauKinsect}")
      ]));
}

Widget isDualBlade(Arme weapon, BuildContext context) {
  Widget vretour = white(AppLocalizations.of(context)!.none);
  if (weapon is LameDouble && weapon.idElement2 != 0) {
    vretour = printDoubleElemWhite(element(weapon.idElement), weapon.element,
        element(weapon.idElement2), weapon.element2);
  } else if (weapon.idElement != 0) {
    vretour =
        printStatWhite(element(weapon.idElement), weapon.element.toString());
  }

  return vretour;
}

Widget StatKinsect(Stuff s) {
  return Container(
      margin: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(children: [
          Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              child: title(s.kinsect.name)),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            if (s.kinsect.id != 9999)
              Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  child: printStatBlack(
                    "images/elementaire/AttKinsect.png",
                    s
                        .kinsect
                        .niveauKinsect[
                            (s.weapon as Insectoglaive).niveauKinsect][0]
                        .toString(),
                  )),
            if (s.kinsect.id != 9999)
              Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  child: printStatBlack(
                    "images/elementaire/VitKinsect.png",
                    s
                        .kinsect
                        .niveauKinsect[
                            (s.weapon as Insectoglaive).niveauKinsect][1]
                        .toString(),
                  )),
            if (s.kinsect.id != 9999)
              Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  child: printStatBlack(
                    "images/elementaire/HealKinsect.png",
                    s
                        .kinsect
                        .niveauKinsect[
                            (s.weapon as Insectoglaive).niveauKinsect][2]
                        .toString(),
                  )),
          ])
        ]),
      ));
}
