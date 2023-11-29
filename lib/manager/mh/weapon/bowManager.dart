import 'package:builder_mhrs/manager/color/colorManager.dart';
import 'package:builder_mhrs/manager/text/color.dart';
import 'package:builder_mhrs/manager/text/localization/arme/arc/getTypeBarrage.dart';
import 'package:builder_mhrs/manager/text/localization/arme/arc/getTypeTir.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:builder_mhrs/object/Stuff.dart';
import 'package:builder_mhrs/object/weapon/Arc.dart';

Widget arc(Arc bow, Stuff s, BuildContext context) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
    Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          margin: const EdgeInsets.only(bottom: 10.0, top: 10.0),
          child: Column(children: [
            Text("${AppLocalizations.of(context)!.barrage} :"),
            Text(getTypeBarrage(bow.barrage, context)),
          ])),
      Container(
          margin: const EdgeInsets.only(bottom: 10.0, top: 10.0),
          child: Column(children: [
            Text("${AppLocalizations.of(context)!.chargeShot} :"),
            typeShoot(bow, context, s.getTalentValueById(82))
          ]))
    ]),
    Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              margin: const EdgeInsets.only(bottom: 5.0),
              child: Text("${AppLocalizations.of(context)!.fiole} :")),
          coating(bow, context)
        ]))
  ]);
}

Column tBarrage(Arc bow, BuildContext context) {
  return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    white(
        "${AppLocalizations.of(context)!.barrage} : ${getTypeBarrage(bow.barrage, context)}"),
  ]);
}

Column typeShoot(Arc bow, BuildContext context, int skill) {
  return Column(children: [
    white('${getTypeTir(bow.typeMun1, context)} ${bow.lvlTypeMun1}'),
    white('${getTypeTir(bow.typeMun2, context)} ${bow.lvlTypeMun2}'),
    white('${getTypeTir(bow.typeMun3, context)} ${bow.lvlTypeMun3}'),
    Text('${getTypeTir(bow.typeMun4, context)} ${bow.lvlTypeMun4}',
        style: TextStyle(color: skill == 0 ? Colors.grey : fourth))
  ]);
}

Column typeShootListing(Arc bow, BuildContext context) {
  return Column(children: [
    Text('${getTypeTir(bow.typeMun1, context)} ${bow.lvlTypeMun1}'),
    Text('${getTypeTir(bow.typeMun2, context)} ${bow.lvlTypeMun2}'),
    Text('${getTypeTir(bow.typeMun3, context)} ${bow.lvlTypeMun3}'),
    Text('${getTypeTir(bow.typeMun4, context)} ${bow.lvlTypeMun4}')
  ]);
}

Column coating(Arc bow, BuildContext context) {
  return Column(children: [
    if (bow.combat != 0)
      fiole(bow.combat, AppLocalizations.of(context)!.cCombat, 1),
    if (bow.force != 0)
      fiole(bow.force, AppLocalizations.of(context)!.cForce, 1),
    if (bow.poison != 0)
      fiole(bow.poison, AppLocalizations.of(context)!.cPoison, 1),
    if (bow.para != 0) fiole(bow.para, AppLocalizations.of(context)!.cPara, 1),
    if (bow.sleep != 0)
      fiole(bow.sleep, AppLocalizations.of(context)!.cSleep, 1),
    if (bow.explo != 0)
      fiole(bow.explo, AppLocalizations.of(context)!.cExplo, 1),
    if (bow.fatigue != 0)
      fiole(bow.fatigue, AppLocalizations.of(context)!.cFaiblesse, 1),
  ]);
}

Column coatingListing(Arc bow, BuildContext context) {
  return Column(children: [
    if (bow.combat != 0)
      fiole(bow.combat, AppLocalizations.of(context)!.combat, 0),
    if (bow.force != 0)
      fiole(bow.force, AppLocalizations.of(context)!.force, 0),
    if (bow.poison != 0)
      fiole(bow.poison, AppLocalizations.of(context)!.poison, 0),
    if (bow.para != 0) fiole(bow.para, AppLocalizations.of(context)!.para, 0),
    if (bow.sleep != 0)
      fiole(bow.sleep, AppLocalizations.of(context)!.sleep, 0),
    if (bow.explo != 0)
      fiole(bow.explo, AppLocalizations.of(context)!.explo, 0),
    if (bow.fatigue != 0)
      fiole(bow.fatigue, AppLocalizations.of(context)!.faiblesse, 0),
  ]);
}

Widget fiole(int fiole, String nom, int i) {
  String vretour = nom;
  if (fiole == 2) {
    vretour = "$nom +";
  }
  return i == 0 ? Text(vretour) : white(vretour);
}
