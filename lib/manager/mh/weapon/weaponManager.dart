import 'package:builder_mhrs/manager/color/colorManager.dart';
import 'package:builder_mhrs/manager/img/imgManager.dart';
import 'package:builder_mhrs/manager/img/simplyKinsect.dart';
import 'package:builder_mhrs/manager/mh/joyauManager.dart';
import 'package:builder_mhrs/manager/mh/weapon/sharpManager.dart';
import 'package:builder_mhrs/manager/mh/statManager.dart';
import 'package:builder_mhrs/manager/text/color.dart';
import 'package:builder_mhrs/manager/text/localization/arme/cbTypeFiole.dart';
import 'package:builder_mhrs/manager/text/localization/arme/glTypeCanon.dart';
import 'package:builder_mhrs/manager/text/localization/arme/saTypeFiole.dart';
import 'package:builder_mhrs/manager/widget/printStatSimply.dart';
import 'package:builder_mhrs/object/Kinsect.dart';
import 'package:builder_mhrs/object/Stuff.dart';
import 'package:builder_mhrs/object/weapon/Arme.dart';
import 'package:builder_mhrs/object/weapon/tranchant/CornedeChasse.dart';
import 'package:builder_mhrs/object/weapon/tranchant/Insectoglaive.dart';
import 'package:builder_mhrs/object/weapon/tranchant/LameDouble.dart';
import 'package:builder_mhrs/object/weapon/tranchant/Lancecanon.dart';
import 'package:builder_mhrs/object/weapon/tranchant/MorphoHache.dart';
import 'package:builder_mhrs/object/weapon/tranchant/VoltoHache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget valueWeapon(Arme weapon, BuildContext context) {
  return Container(
      margin: const EdgeInsets.all(10.0),
      child: Container(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  child: Text(weapon.name,
                      style: TextStyle(
                          color: getFifth(), fontWeight: FontWeight.bold)))
            ]),
            statOff(weapon, context),
            if (weapon is Tranchant)
              Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        sharpStat(weapon),
                      ]))
          ])));
}

Widget joyau(
    Arme weapon, Stuff s, VoidCallback onUpdated, BuildContext context) {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    Column(children: [
      Container(
          margin: const EdgeInsets.only(bottom: 10.0),
          child: white(s.weapon.slots.isEmpty
              ? AppLocalizations.of(context)!.nJoyau
              : AppLocalizations.of(context)!.joyaux)),
      Container(
          margin: const EdgeInsets.only(bottom: 10.0),
          child: Column(children: [
            if (s.weapon.slots.isNotEmpty)
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
  ]);
}

Widget corne(CorneDeChasse horn, BuildContext context) {
  return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(children: [
          Container(
              margin: const EdgeInsets.only(bottom: 10.0, top: 5.0),
              child: Text(AppLocalizations.of(context)!.music)),
          statWhite(musique(0), horn.musique[0].name),
          statWhite(musique(1), horn.musique[1].name),
          statWhite(musique(2), horn.musique[2].name),
        ])
      ]));
}

Widget morpho(MorphoHache morpho, BuildContext context) {
  return morpho.valueFiole != 0
      ? white("${getSaFiole(morpho.typeFiole, context)} ${morpho.valueFiole}")
      : white(getSaFiole(morpho.typeFiole, context));
}

Widget volto(VoltoHache volto, BuildContext context) {
  return white(getCbFiole(volto.typeFiole, context));
}

Widget lancecanon(Lancecanon gunlance, BuildContext context) {
  int niveau = gunlance.niveauCanon;
  if (Arme.augments) niveau = gunlance.niveauCanon + Arme.transcendance.shell;
  return white(
      "${AppLocalizations.of(context)!.canon} : ${getTypeCanon(gunlance.typeCanon, context)} $niveau");
}

Widget insecto(Insectoglaive insect, BuildContext context) {
  return white(
      "${AppLocalizations.of(context)!.kinsectLvl} : ${insect.niveauKinsect}");
}

Widget isDualBlade(Arme weapon, BuildContext context) {
  Widget vretour = white(AppLocalizations.of(context)!.none);
  if (weapon is LameDouble && weapon.idElement2 != 0) {
    vretour = doubleElemWhite(element(weapon.idElement), weapon.element,
        element(weapon.idElement2), weapon.element2);
  } else if (weapon.idElement != 0) {
    vretour = statWhite(element(weapon.idElement), weapon.element.toString());
  }
  return vretour;
}

Widget StatKinsect(Stuff s) {
  Kinsect k = s.kinsect;
  Insectoglaive i = s.weapon as Insectoglaive;
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
                    child: statWhite(
                        kAtt, k.niveauKinsect[i.niveauKinsect][0].toString())),
              if (s.kinsect.id != 9999)
                Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: statWhite(
                        kVit, k.niveauKinsect[i.niveauKinsect][1].toString())),
              if (s.kinsect.id != 9999)
                Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: statWhite(
                        kHeal, k.niveauKinsect[i.niveauKinsect][2].toString())),
            ])
          ])));
}
