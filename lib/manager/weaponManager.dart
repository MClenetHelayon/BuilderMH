import 'package:builder_mhrs/manager/local/arc/typeBarrage.dart';
import 'package:builder_mhrs/manager/local/arc/typeTir.dart';
import 'package:builder_mhrs/manager/local/cbTypeFiole.dart';
import 'package:builder_mhrs/manager/local/saTypeFiole.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../object/Arme.dart';
import '../object/Stuff.dart';
import '../object/ITranchant.dart';
import 'imgManager.dart';
import 'joyauManager.dart';
import 'local/glTypeCanon.dart';
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
                  ))
            ]),
            statOff(weapon, context),
            if (weapon is Tranchant)
              Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        sharpStat(weapon as Tranchant),
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
          child: Text(s.weapon.slots.length == 0
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

Widget arc(Arc bow, Stuff s, BuildContext context) {
  return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
    Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        margin: const EdgeInsets.only(bottom: 10.0, top: 10.0),
        child: Column(children: [
          Text("${AppLocalizations.of(context)!.barrage} :"),
          Text(getTypeBarrage(bow.barrage, context)),
        ]),
      ),
      Container(
        margin: const EdgeInsets.only(bottom: 10.0, top: 10.0),
        child: Column(children: [
          Text("${AppLocalizations.of(context)!.chargeShot} :"),
          Text('${getTypeTir(bow.typeMun1, context)} ${bow.lvlTypeMun1}'),
          Text('${getTypeTir(bow.typeMun2, context)} ${bow.lvlTypeMun2}'),
          Text('${getTypeTir(bow.typeMun3, context)} ${bow.lvlTypeMun3}'),
          Text('${getTypeTir(bow.typeMun4, context)} ${bow.lvlTypeMun4}',
              style: TextStyle(
                  color: s.getTalentById(82) == 0 ? Colors.grey : Colors.blue))
        ]),
      )
    ]),
    Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              margin: const EdgeInsets.only(bottom: 5.0),
              child: Text("${AppLocalizations.of(context)!.fiole} :")),
          fiole(bow.combat, AppLocalizations.of(context)!.combat, context),
          fiole(bow.force, AppLocalizations.of(context)!.force, context),
          fiole(bow.poison, AppLocalizations.of(context)!.poison, context),
          fiole(bow.para, AppLocalizations.of(context)!.para, context),
          fiole(bow.sleep, AppLocalizations.of(context)!.sleep, context),
          fiole(bow.explo, AppLocalizations.of(context)!.explo, context),
          fiole(bow.fatigue, AppLocalizations.of(context)!.faiblesse, context),
        ]))
  ]));
}

Widget fiole(int fiole, String nom, BuildContext context) {
  if (fiole != 0) {
    if (fiole == 2) {
      return Text("$nom +");
    } else {
      return Text(nom);
    }
  } else {
    return Text(
      nom,
      style: const TextStyle(
        color: Colors.grey,
      ),
    );
  }
}

Widget corne(CorneDeChasse horn, BuildContext context) {
  return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(children: [
          Container(
              margin: const EdgeInsets.only(bottom: 10.0, top: 5.0),
              child: Text(AppLocalizations.of(context)!.music)),
          printStat(musique(0), horn.musique[0].name),
          printStat(musique(1), horn.musique[1].name),
          printStat(musique(2), horn.musique[2].name),
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
  Widget vretour = Text(AppLocalizations.of(context)!.none,
      style: const TextStyle(color: Colors.blue));
  if (weapon is LameDouble && weapon.idElement2 != 0) {
    vretour = printDoubleElem(element(weapon.idElement), weapon.element,
        element(weapon.idElement2), weapon.element2);
  } else if (weapon.idElement != 0) {
    vretour = printStat(element(weapon.idElement), weapon.element.toString());
  }

  return vretour;
}

Widget AmmoFusar(List<dynamic> mun, String nom) {
  return Container();
}

Widget StatKinsect(Stuff s) {
  return Container(
      margin: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(children: [
          Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              child: title(
                s.kinsect.name,
              )),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            if (s.kinsect.id != 9999)
              Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  child: printStat(
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
                  child: printStat(
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
                  child: printStat(
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
