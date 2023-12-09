import 'package:builder_mhrs/controller/color/colorManager.dart';
import 'package:builder_mhrs/controller/img/imgManager.dart';
import 'package:builder_mhrs/controller/img/kinsect.dart';
import 'package:builder_mhrs/controller/logic/morphoHache.dart';
import 'package:builder_mhrs/controller/mh/joyauManager.dart';
import 'package:builder_mhrs/controller/mh/weapon/sharpManager.dart';
import 'package:builder_mhrs/controller/mh/statManager.dart';
import 'package:builder_mhrs/controller/text/color.dart';
import 'package:builder_mhrs/controller/text/localization/arme/cbTypeFiole.dart';
import 'package:builder_mhrs/controller/text/localization/arme/glTypeCanon.dart';
import 'package:builder_mhrs/controller/text/localization/arme/saTypeFiole.dart';
import 'package:builder_mhrs/controller/widget/printStatSimply.dart';
import 'package:builder_mhrs/model/Kinsect.dart';
import 'package:builder_mhrs/model/Stuff.dart';
import 'package:builder_mhrs/model/weapon/Arme.dart';
import 'package:builder_mhrs/model/weapon/tranchant/CornedeChasse.dart';
import 'package:builder_mhrs/model/weapon/tranchant/Insectoglaive.dart';
import 'package:builder_mhrs/model/weapon/tranchant/LameDouble.dart';
import 'package:builder_mhrs/model/weapon/tranchant/Lancecanon.dart';
import 'package:builder_mhrs/model/weapon/tranchant/MorphoHache.dart';
import 'package:builder_mhrs/model/weapon/tranchant/VoltoHache.dart';
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
                  child: boldOrange(weapon.name))
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
                Card(
                    color: primary,
                    child: joyauArme(s.weapon.slots[0], 0, s, onUpdated)),
            if (s.weapon.slots.length >= 2)
              if (s.weapon.slots[1] != 0)
                Card(
                    color: primary,
                    child: joyauArme(s.weapon.slots[1], 1, s, onUpdated)),
            if (s.weapon.slots.length == 3)
              if (s.weapon.slots[2] != 0)
                Card(
                    color: primary,
                    child: joyauArme(s.weapon.slots[2], 2, s, onUpdated)),
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

Widget morpho(Stuff s, BuildContext context, bool img) {
  MorphoHache morpho = s.weapon as MorphoHache;
  return morpho.valueFiole != 0
      ? img
          ? black(
              "${getSaFiole(morpho.typeFiole, context)} ${valueFiole(s, context)}")
          : white(
              "${getSaFiole(morpho.typeFiole, context)} ${valueFiole(s, context)}")
      : img
          ? black(getSaFiole(morpho.typeFiole, context))
          : white(getSaFiole(morpho.typeFiole, context));
}

Widget volto(VoltoHache volto, BuildContext context, bool img) {
  return img
      ? black(getCbFiole(volto.typeFiole, context))
      : white(getCbFiole(volto.typeFiole, context));
}

Widget lancecanon(Lancecanon gunlance, BuildContext context, bool img) {
  int niveau = gunlance.niveauCanon;
  if (Arme.augments) niveau = gunlance.niveauCanon + Arme.transcendance.shell;
  return img
      ? black(
          "${AppLocalizations.of(context)!.canon} : ${getTypeCanon(gunlance.typeCanon, context)} $niveau")
      : white(
          "${AppLocalizations.of(context)!.canon} : ${getTypeCanon(gunlance.typeCanon, context)} $niveau");
}

Widget insecto(Insectoglaive insect, BuildContext context, bool img) {
  return img
      ? black(
          "${AppLocalizations.of(context)!.kinsectLvl} : ${insect.niveauKinsect}")
      : white(
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
            if (s.kinsect.id != 9999)
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: statWhite(
                        kAtt, k.niveauKinsect[i.niveauKinsect][0].toString())),
                Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: statWhite(
                        kVit, k.niveauKinsect[i.niveauKinsect][1].toString())),
                Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: statWhite(
                        kHeal, k.niveauKinsect[i.niveauKinsect][2].toString())),
              ])
          ])));
}
