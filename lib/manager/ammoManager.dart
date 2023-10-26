import 'package:builder_mhrs/manager/skill/ammo/qteAmmoManager.dart';
import 'package:builder_mhrs/manager/skill/ammo/reculAmmoManager.dart';
import 'package:builder_mhrs/manager/skill/ammo/reloadAmmoManager.dart';
import 'package:builder_mhrs/manager/textManager.dart';
import 'package:builder_mhrs/object/weapon/fusarbalete/FusarbaleteLourd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../object/Stuff.dart';
import '../object/weapon/Arme.dart';
import '../object/weapon/fusarbalete/FusarbaleteLeger.dart';

getPrintImgAmmo(Stuff s, BuildContext context) {
  Fusarbalete w = s.weapon as Fusarbalete;
  int maxMun = s.getTalentById(91);
  int reculB = s.getTalentById(116);
  int reloadB = s.getTalentById(144);
  if (s.getTalentById(118) != 0 && w.mod == 0) reloadB += 1;
  if (w is FusarbaleteLeger && w.mod == 1) reculB += 1;
  return Column(children: [
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      cadreAmmoValue(120, Text(AppLocalizations.of(context)!.name)),
      cadreAmmoValue(30, Text(AppLocalizations.of(context)!.qte)),
      cadreAmmoValue(50, Text(AppLocalizations.of(context)!.recul)),
      cadreAmmoValue(105, Text(AppLocalizations.of(context)!.recharge)),
      Row(children: [
        logoMun(1, 'images/arme/mun/footstep.png', 15),
        logoMun(1, 'images/arme/mun/greenCircle.png', 15),
        logoMun(1, 'images/arme/mun/downBlue.png', 15),
        logoMun(1, 'images/arme/mun/upOrange.png', 15)
      ])
    ]),
    const Divider(color: Colors.black),
    if (w.normal1.isNotEmpty)
      rowAmmo(
          w.normal1,
          '${AppLocalizations.of(context)!.normal} I',
          getMaxMun13(maxMun),
          getReculNorm(context),
          getReloadNorm(w.rechargement, reloadB, context)),
    if (w.normal2.isNotEmpty)
      rowAmmo(
          w.normal2,
          '${AppLocalizations.of(context)!.normal} II',
          getMaxMun23(maxMun),
          getReculG1(w.recul, reculB, context),
          getReloadN2GHTq(w.rechargement, reloadB, context)),
    if (w.normal3.isNotEmpty)
      rowAmmo(
          w.normal3,
          '${AppLocalizations.of(context)!.normal} III',
          getMaxMun3(maxMun),
          getReculG1(w.recul, reculB, context),
          getReloadN3G2Elem(w.rechargement, reloadB, context)),
    if (w.perfo1.isNotEmpty)
      rowAmmo(
          w.perfo1,
          '${AppLocalizations.of(context)!.perfo} I',
          getMaxMun13(maxMun),
          getReculG1(w.recul, reculB, context),
          getReloadPerfoShrap2(w.rechargement, reloadB, context)),
    if (w.perfo2.isNotEmpty)
      rowAmmo(
          w.perfo2,
          '${AppLocalizations.of(context)!.perfo} II',
          getMaxMun2(maxMun),
          getReculG3(w.recul, reculB, context),
          getReloadP2P3Sh3StkH2PElem(w.rechargement, reloadB, context)),
    if (w.perfo3.isNotEmpty)
      rowAmmo(
          w.perfo3,
          '${AppLocalizations.of(context)!.perfo} III',
          getMaxMun3(maxMun),
          getReculG3(w.recul, reculB, context),
          getReloadP2P3Sh3StkH2PElem(w.rechargement, reloadB, context)),
    if (w.grenaille1.isNotEmpty)
      rowAmmo(
          w.grenaille1,
          '${AppLocalizations.of(context)!.gren} I',
          getMaxMun13(maxMun),
          getReculG1(w.recul, reculB, context),
          getReloadN2GHTq(w.rechargement, reloadB, context)),
    if (w.grenaille2.isNotEmpty)
      rowAmmo(
          w.grenaille2,
          '${AppLocalizations.of(context)!.gren} II',
          getMaxMun2(maxMun),
          getReculG2(w.recul, reculB, context),
          getReloadN3G2Elem(w.rechargement, reloadB, context)),
    if (w.grenaille3.isNotEmpty)
      rowAmmo(
          w.grenaille3,
          '${AppLocalizations.of(context)!.gren} III',
          getMaxMun3(maxMun),
          getReculG3(w.recul, reculB, context),
          getReloadGren3(w.rechargement, reloadB, context)),
    if (w.shrapnel1.isNotEmpty)
      rowAmmo(
          w.shrapnel1,
          '${AppLocalizations.of(context)!.shrap} I',
          getMaxMun13(maxMun),
          getReculG1(w.recul, reculB, context),
          getReloadShrap1(w.rechargement, reloadB, context)),
    if (w.shrapnel2.isNotEmpty)
      rowAmmo(
          w.shrapnel2,
          '${AppLocalizations.of(context)!.shrap} II',
          getMaxMun2(maxMun),
          getReculG2(w.recul, reculB, context),
          getReloadPerfoShrap2(w.rechargement, reloadB, context)),
    if (w.shrapnel3.isNotEmpty)
      rowAmmo(
          w.shrapnel3,
          '${AppLocalizations.of(context)!.shrap} III',
          getMaxMun3(maxMun),
          getReculG3(w.recul, reculB, context),
          getReloadP2P3Sh3StkH2PElem(w.rechargement, reloadB, context)),
    if (w.antib1.isNotEmpty)
      rowAmmo(
          w.antib1,
          '${AppLocalizations.of(context)!.antib} I',
          getMaxMun2(maxMun),
          getReculG3(w.recul, reculB, context),
          getReloadP2P3Sh3StkH2PElem(w.rechargement, reloadB, context)),
    if (w.antib2.isNotEmpty)
      rowAmmo(
          w.antib2,
          '${AppLocalizations.of(context)!.antib} II',
          getMaxMun3(maxMun),
          getReculG4(w.recul, reculB, context),
          getReloadStk2TrchLg2DemPier(w.rechargement, reloadB, context)),
    if (w.antib3.isNotEmpty)
      rowAmmo(
          w.antib3,
          '${AppLocalizations.of(context)!.antib} III',
          getMaxMun3(maxMun),
          getReculG4(w.recul, reculB, context),
          getReloadStk3FrgDragAffli2(w.rechargement, reloadB, context)),
    if (w.frag1.isNotEmpty)
      rowAmmo(
          w.frag1,
          '${AppLocalizations.of(context)!.frag} I',
          getMaxMun3(maxMun),
          getReculG4(w.recul, reculB, context),
          getReloadStk3FrgDragAffli2(w.rechargement, reloadB, context)),
    if (w.frag2.isNotEmpty)
      rowAmmo(
          w.frag2,
          '${AppLocalizations.of(context)!.frag} II',
          getMaxMun3(maxMun),
          getReculFrag2(w.recul, reculB, context),
          getReloadFrag2PDrag(w.rechargement, reloadB, context)),
    if (w is FusarbaleteLourd)
      if (w.frag3.isNotEmpty)
        rowAmmo(
            w.frag3,
            '${AppLocalizations.of(context)!.frag} III',
            getMaxMun3(maxMun),
            getReculFrag2(w.recul, reculB, context),
            getReloadFrag2PDrag(w.rechargement, reloadB, context)),
    if (w.poison1.isNotEmpty)
      rowAmmo(
          w.poison1,
          '${AppLocalizations.of(context)!.mPoison} I',
          getMaxMun2(maxMun),
          getReculG5(w.recul, reculB, context),
          getReloadToxiLetarg(w.rechargement, reloadB, context)),
    if (w.poison2.isNotEmpty)
      rowAmmo(
          w.poison2,
          '${AppLocalizations.of(context)!.mPoison} II',
          getMaxMun3(maxMun),
          getReculG6(w.recul, reculB, context),
          getReloadStk3FrgDragAffli2(w.rechargement, reloadB, context)),
    if (w.para1.isNotEmpty)
      rowAmmo(
          w.para1,
          '${AppLocalizations.of(context)!.mPara} I',
          getMaxMun3(maxMun),
          getReculG5(w.recul, reculB, context),
          getReloadParaSomm(w.rechargement, reloadB, context)),
    if (w.para2.isNotEmpty)
      rowAmmo(
          w.para2,
          '${AppLocalizations.of(context)!.mPara} II',
          getMaxMun3(maxMun),
          getReculG6(w.recul, reculB, context),
          getReloadStk3FrgDragAffli2(w.rechargement, reloadB, context)),
    if (w.sleep1.isNotEmpty)
      rowAmmo(
          w.sleep1,
          '${AppLocalizations.of(context)!.mSleep} I',
          getMaxMun3(maxMun),
          getReculG5(w.recul, reculB, context),
          getReloadParaSomm(w.rechargement, reloadB, context)),
    if (w.sleep2.isNotEmpty)
      rowAmmo(
          w.sleep2,
          '${AppLocalizations.of(context)!.mSleep} II',
          getMaxMun3(maxMun),
          getReculG6(w.recul, reculB, context),
          getReloadStk3FrgDragAffli2(w.rechargement, reloadB, context)),
    if (w.fatigue1.isNotEmpty)
      rowAmmo(
          w.fatigue1,
          '${AppLocalizations.of(context)!.fatigue} I',
          getMaxMun3(maxMun),
          getReculG3(w.recul, reculB, context),
          getReloadToxiLetarg(w.rechargement, reloadB, context)),
    if (w.fatigue2.isNotEmpty)
      rowAmmo(
          w.fatigue2,
          '${AppLocalizations.of(context)!.fatigue} II',
          getMaxMun3(maxMun),
          getReculG5(w.recul, reculB, context),
          getReloadStk2TrchLg2DemPier(w.rechargement, reloadB, context)),
    if (w.soin1.isNotEmpty)
      rowAmmo(
          w.soin1,
          '${AppLocalizations.of(context)!.soin} I',
          getMaxMun2(maxMun),
          getReculSoin(w.recul, reculB, context),
          getReloadN2GHTq(w.rechargement, reloadB, context)),
    if (w.soin2.isNotEmpty)
      rowAmmo(
          w.soin2,
          '${AppLocalizations.of(context)!.soin} II',
          getMaxMun3(maxMun),
          getReculG5(w.recul, reculB, context),
          getReloadP2P3Sh3StkH2PElem(w.rechargement, reloadB, context)),
    if (w.demon.isNotEmpty)
      rowAmmo(
          w.demon[0],
          AppLocalizations.of(context)!.demon,
          getMaxMun3(maxMun),
          getReculG2(w.recul, reculB, context),
          getReloadStk2TrchLg2DemPier(w.rechargement, reloadB, context)),
    if (w.pierre.isNotEmpty)
      rowAmmo(
          w.pierre[0],
          AppLocalizations.of(context)!.pierre,
          getMaxMun3(maxMun),
          getReculG2(w.recul, reculB, context),
          getReloadStk2TrchLg2DemPier(w.rechargement, reloadB, context)),
    if (w.feu.isNotEmpty)
      rowAmmo(
          w.feu[0],
          AppLocalizations.of(context)!.feu,
          getMaxMun2(maxMun),
          getReculG1(w.recul, reculB, context),
          getReloadN3G2Elem(w.rechargement, reloadB, context)),
    if (w.pFeu.isNotEmpty)
      rowAmmo(
          w.pFeu[0],
          AppLocalizations.of(context)!.pFeu,
          getMaxMun2(maxMun),
          getReculG2(w.recul, reculB, context),
          getReloadP2P3Sh3StkH2PElem(w.rechargement, reloadB, context)),
    if (w.eau.isNotEmpty)
      rowAmmo(
          w.eau[0],
          AppLocalizations.of(context)!.eau,
          getMaxMun2(maxMun),
          getReculG1(w.recul, reculB, context),
          getReloadN3G2Elem(w.rechargement, reloadB, context)),
    if (w.pEau.isNotEmpty)
      rowAmmo(
          w.pEau[0],
          AppLocalizations.of(context)!.pEau,
          getMaxMun2(maxMun),
          getReculG2(w.recul, reculB, context),
          getReloadP2P3Sh3StkH2PElem(w.rechargement, reloadB, context)),
    if (w.foudre.isNotEmpty)
      rowAmmo(
          w.foudre[0],
          AppLocalizations.of(context)!.foudre,
          getMaxMun2(maxMun),
          getReculG1(w.recul, reculB, context),
          getReloadN3G2Elem(w.rechargement, reloadB, context)),
    if (w.pFoudre.isNotEmpty)
      rowAmmo(
          w.pFoudre[0],
          AppLocalizations.of(context)!.pFoudre,
          getMaxMun2(maxMun),
          getReculG2(w.recul, reculB, context),
          getReloadP2P3Sh3StkH2PElem(w.rechargement, reloadB, context)),
    if (w.glace.isNotEmpty)
      rowAmmo(
          w.glace[0],
          AppLocalizations.of(context)!.glace,
          getMaxMun2(maxMun),
          getReculG1(w.recul, reculB, context),
          getReloadN3G2Elem(w.rechargement, reloadB, context)),
    if (w.pGlace.isNotEmpty)
      rowAmmo(
          w.pGlace[0],
          AppLocalizations.of(context)!.pGlace,
          getMaxMun2(maxMun),
          getReculG2(w.recul, reculB, context),
          getReloadP2P3Sh3StkH2PElem(w.rechargement, reloadB, context)),
    if (w.dragon.isNotEmpty)
      rowAmmo(
          w.dragon,
          AppLocalizations.of(context)!.dragon,
          getMaxMun3(maxMun),
          getReculG5(w.recul, reculB, context),
          getReloadStk3FrgDragAffli2(w.rechargement, reloadB, context)),
    if (w.pDragon.isNotEmpty)
      rowAmmo(
          w.pDragon,
          AppLocalizations.of(context)!.pDragon,
          getMaxMun3(maxMun),
          getReculG6(w.recul, reculB, context),
          getReloadFrag2PDrag(w.rechargement, reloadB, context)),
    if (w.tranch.isNotEmpty)
      rowAmmo(
          w.tranch,
          AppLocalizations.of(context)!.tranch,
          getMaxMun2(maxMun),
          getReculG4(w.recul, reculB, context),
          getReloadStk2TrchLg2DemPier(w.rechargement, reloadB, context)),
    if (w is FusarbaleteLourd)
      if (w.wyvern.isNotEmpty)
        rowAmmo(
            w.wyvern,
            AppLocalizations.of(context)!.wyvern,
            0,
            AppLocalizations.of(context)!.wyvern,
            getReloadStk2TrchLg2DemPier(w.rechargement, reloadB, context)),
    if (w.tranquil.isNotEmpty)
      rowAmmo(
          w.tranquil[0],
          AppLocalizations.of(context)!.tranquil,
          getMaxMun1(maxMun),
          getReculG2(w.recul, reculB, context),
          getReloadN2GHTq(w.rechargement, reloadB, context)),
  ]);
}

Widget rowAmmo(
    List<dynamic> a, String name, int maxMun, String recul, String reload) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    cadreAmmoValue(120, Text(name)),
    cadreAmmoValue(20, Text((a[0] + maxMun).toString())),
    cadreAmmoValue(75, Text(recul)),
    cadreAmmoValue(85, Text(reload)),
    Row(children: [
      logoMun(a[1], 'images/arme/mun/footstep.png', 15),
      logoMun(a[2], 'images/arme/mun/greenCircle.png', 15),
      logoMun(a[3], 'images/arme/mun/downBlue.png', 15),
      logoMun(a[4], 'images/arme/mun/upOrange.png', 15)
    ])
  ]);
}

Widget logoMun(int i, String img, double hw) {
  Widget vretour;
  if (i != 0) {
    vretour = Image.asset(img, height: hw, width: hw);
  } else {
    vretour = SizedBox(height: hw, width: hw);
  }
  return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black, // Couleur de la bordure
          width: 1.0, // Épaisseur de la bordure
        ),
      ),
      child: vretour);
}
