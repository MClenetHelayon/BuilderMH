import 'package:builder_mhrs/controller/color/colorManager.dart';
import 'package:builder_mhrs/controller/mh/skill/ammo/qteAmmoManager.dart';
import 'package:builder_mhrs/controller/mh/skill/ammo/reculAmmoManager.dart';
import 'package:builder_mhrs/controller/mh/skill/ammo/reloadAmmoManager.dart';
import 'package:builder_mhrs/controller/text/color.dart';
import 'package:builder_mhrs/controller/widget/cadreAmmoManager.dart';
import 'package:builder_mhrs/controller/widget/printStatSimply.dart';
import 'package:builder_mhrs/model/Stuff.dart';
import 'package:builder_mhrs/model/weapon/Arme.dart';
import 'package:builder_mhrs/model/weapon/fusarbalete/FusarbaleteLeger.dart';
import 'package:builder_mhrs/model/weapon/fusarbalete/FusarbaleteLourd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

getPrintImgAmmo(Stuff s, BuildContext context) {
  Fusarbalete w = s.weapon as Fusarbalete;
  int maxMun = s.getTalentValueById(91);
  int reculB = s.getTalentValueById(116);
  int reloadB = s.getTalentValueById(144);
  if (s.getTalentById(118) != 0 && w.mod == 0) reloadB += 1;
  if (w is FusarbaleteLeger && w.mod == 1) reculB += 1;
  return Column(children: [
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      cadreAmmoValueImg(90, Text(AppLocalizations.of(context)!.name)),
      cadreAmmoValueImg(30, Text(AppLocalizations.of(context)!.qte)),
      cadreAmmoValueImg(50, Text(AppLocalizations.of(context)!.recul)),
      cadreAmmoValueImg(105, Text(AppLocalizations.of(context)!.recharge)),
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
          getReloadNorm(w.rechargement, reloadB, context, true)),
    if (w.normal2.isNotEmpty)
      rowAmmo(
          w.normal2,
          '${AppLocalizations.of(context)!.normal} II',
          getMaxMun23(maxMun),
          getReculG1(w.recul, reculB, context),
          getReloadN2GHTq(w.rechargement, reloadB, context, true)),
    if (w.normal3.isNotEmpty)
      rowAmmo(
          w.normal3,
          '${AppLocalizations.of(context)!.normal} III',
          getMaxMun3(maxMun),
          getReculG1(w.recul, reculB, context),
          getReloadN3G2Elem(w.rechargement, reloadB, context, true)),
    if (w.perfo1.isNotEmpty)
      rowAmmo(
          w.perfo1,
          '${AppLocalizations.of(context)!.perfo} I',
          getMaxMun13(maxMun),
          getReculG1(w.recul, reculB, context),
          getReloadPerfoShrap2(w.rechargement, reloadB, context, true)),
    if (w.perfo2.isNotEmpty)
      rowAmmo(
          w.perfo2,
          '${AppLocalizations.of(context)!.perfo} II',
          getMaxMun2(maxMun),
          getReculG3(w.recul, reculB, context),
          getReloadP2P3Sh3StkH2PElem(w.rechargement, reloadB, context, true)),
    if (w.perfo3.isNotEmpty)
      rowAmmo(
          w.perfo3,
          '${AppLocalizations.of(context)!.perfo} III',
          getMaxMun3(maxMun),
          getReculG3(w.recul, reculB, context),
          getReloadP2P3Sh3StkH2PElem(w.rechargement, reloadB, context, true)),
    if (w.grenaille1.isNotEmpty)
      rowAmmo(
          w.grenaille1,
          '${AppLocalizations.of(context)!.gren} I',
          getMaxMun13(maxMun),
          getReculG1(w.recul, reculB, context),
          getReloadN2GHTq(w.rechargement, reloadB, context, true)),
    if (w.grenaille2.isNotEmpty)
      rowAmmo(
          w.grenaille2,
          '${AppLocalizations.of(context)!.gren} II',
          getMaxMun2(maxMun),
          getReculG2(w.recul, reculB, context),
          getReloadN3G2Elem(w.rechargement, reloadB, context, true)),
    if (w.grenaille3.isNotEmpty)
      rowAmmo(
          w.grenaille3,
          '${AppLocalizations.of(context)!.gren} III',
          getMaxMun3(maxMun),
          getReculG3(w.recul, reculB, context),
          getReloadGren3(w.rechargement, reloadB, context, true)),
    if (w.shrapnel1.isNotEmpty)
      rowAmmo(
          w.shrapnel1,
          '${AppLocalizations.of(context)!.shrap} I',
          getMaxMun13(maxMun),
          getReculG1(w.recul, reculB, context),
          getReloadShrap1(w.rechargement, reloadB, context, true)),
    if (w.shrapnel2.isNotEmpty)
      rowAmmo(
          w.shrapnel2,
          '${AppLocalizations.of(context)!.shrap} II',
          getMaxMun2(maxMun),
          getReculG2(w.recul, reculB, context),
          getReloadPerfoShrap2(w.rechargement, reloadB, context, true)),
    if (w.shrapnel3.isNotEmpty)
      rowAmmo(
          w.shrapnel3,
          '${AppLocalizations.of(context)!.shrap} III',
          getMaxMun3(maxMun),
          getReculG3(w.recul, reculB, context),
          getReloadP2P3Sh3StkH2PElem(w.rechargement, reloadB, context, true)),
    if (w.antib1.isNotEmpty)
      rowAmmo(
          w.antib1,
          '${AppLocalizations.of(context)!.antib} I',
          getMaxMun2(maxMun),
          getReculG3(w.recul, reculB, context),
          getReloadP2P3Sh3StkH2PElem(w.rechargement, reloadB, context, true)),
    if (w.antib2.isNotEmpty)
      rowAmmo(
          w.antib2,
          '${AppLocalizations.of(context)!.antib} II',
          getMaxMun3(maxMun),
          getReculG4(w.recul, reculB, context, true),
          getReloadStk2TrchLg2DemPier(w.rechargement, reloadB, context, true)),
    if (w.antib3.isNotEmpty)
      rowAmmo(
          w.antib3,
          '${AppLocalizations.of(context)!.antib} III',
          getMaxMun3(maxMun),
          getReculG4(w.recul, reculB, context, true),
          getReloadStk3FrgDragAffli2(w.rechargement, reloadB, context, true)),
    if (w.frag1.isNotEmpty)
      rowAmmo(
          w.frag1,
          '${AppLocalizations.of(context)!.frag} I',
          getMaxMun3(maxMun),
          getReculG4(w.recul, reculB, context, true),
          getReloadStk3FrgDragAffli2(w.rechargement, reloadB, context, true)),
    if (w.frag2.isNotEmpty)
      rowAmmo(
          w.frag2,
          '${AppLocalizations.of(context)!.frag} II',
          getMaxMun3(maxMun),
          getReculFrag2(w.recul, reculB, context, true),
          getReloadFrag2PDrag(w.rechargement, reloadB, context, true)),
    if (w is FusarbaleteLourd)
      if (w.frag3.isNotEmpty)
        rowAmmo(
            w.frag3,
            '${AppLocalizations.of(context)!.frag} III',
            getMaxMun3(maxMun),
            getReculFrag2(w.recul, reculB, context, true),
            getReloadFrag2PDrag(w.rechargement, reloadB, context, true)),
    if (w.poison1.isNotEmpty)
      rowAmmo(
          w.poison1,
          '${AppLocalizations.of(context)!.poison} I',
          getMaxMun2(maxMun),
          getReculG5(w.recul, reculB, context, true),
          getReloadToxiLetarg(w.rechargement, reloadB, context, true)),
    if (w.poison2.isNotEmpty)
      rowAmmo(
          w.poison2,
          '${AppLocalizations.of(context)!.poison} II',
          getMaxMun3(maxMun),
          getReculG6(w.recul, reculB, context, true),
          getReloadStk3FrgDragAffli2(w.rechargement, reloadB, context, true)),
    if (w.para1.isNotEmpty)
      rowAmmo(
          w.para1,
          '${AppLocalizations.of(context)!.para} I',
          getMaxMun3(maxMun),
          getReculG5(w.recul, reculB, context, true),
          getReloadParaSomm(w.rechargement, reloadB, context, true)),
    if (w.para2.isNotEmpty)
      rowAmmo(
          w.para2,
          '${AppLocalizations.of(context)!.para} II',
          getMaxMun3(maxMun),
          getReculG6(w.recul, reculB, context, true),
          getReloadStk3FrgDragAffli2(w.rechargement, reloadB, context, true)),
    if (w.sleep1.isNotEmpty)
      rowAmmo(
          w.sleep1,
          '${AppLocalizations.of(context)!.sleep} I',
          getMaxMun3(maxMun),
          getReculG5(w.recul, reculB, context, true),
          getReloadParaSomm(w.rechargement, reloadB, context, true)),
    if (w.sleep2.isNotEmpty)
      rowAmmo(
          w.sleep2,
          '${AppLocalizations.of(context)!.sleep} II',
          getMaxMun3(maxMun),
          getReculG6(w.recul, reculB, context, true),
          getReloadStk3FrgDragAffli2(w.rechargement, reloadB, context, true)),
    if (w.fatigue1.isNotEmpty)
      rowAmmo(
          w.fatigue1,
          '${AppLocalizations.of(context)!.fatigue} I',
          getMaxMun3(maxMun),
          getReculG3(w.recul, reculB, context),
          getReloadToxiLetarg(w.rechargement, reloadB, context, true)),
    if (w.fatigue2.isNotEmpty)
      rowAmmo(
          w.fatigue2,
          '${AppLocalizations.of(context)!.fatigue} II',
          getMaxMun3(maxMun),
          getReculG5(w.recul, reculB, context, true),
          getReloadStk2TrchLg2DemPier(w.rechargement, reloadB, context, true)),
    if (w.soin1.isNotEmpty)
      rowAmmo(
          w.soin1,
          '${AppLocalizations.of(context)!.soin} I',
          getMaxMun2(maxMun),
          getReculSoin(w.recul, reculB, context),
          getReloadN2GHTq(w.rechargement, reloadB, context, true)),
    if (w.soin2.isNotEmpty)
      rowAmmo(
          w.soin2,
          '${AppLocalizations.of(context)!.soin} II',
          getMaxMun3(maxMun),
          getReculG5(w.recul, reculB, context, true),
          getReloadP2P3Sh3StkH2PElem(w.rechargement, reloadB, context, true)),
    if (w.demon.isNotEmpty)
      rowAmmo(
          w.demon,
          AppLocalizations.of(context)!.demon,
          getMaxMun3(maxMun),
          getReculG2(w.recul, reculB, context),
          getReloadStk2TrchLg2DemPier(w.rechargement, reloadB, context, true)),
    if (w.pierre.isNotEmpty)
      rowAmmo(
          w.pierre,
          AppLocalizations.of(context)!.pierre,
          getMaxMun3(maxMun),
          getReculG2(w.recul, reculB, context),
          getReloadStk2TrchLg2DemPier(w.rechargement, reloadB, context, true)),
    if (w.feu.isNotEmpty)
      rowAmmo(
          w.feu,
          AppLocalizations.of(context)!.feu,
          getMaxMun2(maxMun),
          getReculG1(w.recul, reculB, context),
          getReloadN3G2Elem(w.rechargement, reloadB, context, true)),
    if (w.pFeu.isNotEmpty)
      rowAmmo(
          w.pFeu,
          AppLocalizations.of(context)!.pFeu,
          getMaxMun2(maxMun),
          getReculG2(w.recul, reculB, context),
          getReloadP2P3Sh3StkH2PElem(w.rechargement, reloadB, context, true)),
    if (w.eau.isNotEmpty)
      rowAmmo(
          w.eau,
          AppLocalizations.of(context)!.eau,
          getMaxMun2(maxMun),
          getReculG1(w.recul, reculB, context),
          getReloadN3G2Elem(w.rechargement, reloadB, context, true)),
    if (w.pEau.isNotEmpty)
      rowAmmo(
          w.pEau,
          AppLocalizations.of(context)!.pEau,
          getMaxMun2(maxMun),
          getReculG2(w.recul, reculB, context),
          getReloadP2P3Sh3StkH2PElem(w.rechargement, reloadB, context, true)),
    if (w.foudre.isNotEmpty)
      rowAmmo(
          w.foudre,
          AppLocalizations.of(context)!.foudre,
          getMaxMun2(maxMun),
          getReculG1(w.recul, reculB, context),
          getReloadN3G2Elem(w.rechargement, reloadB, context, true)),
    if (w.pFoudre.isNotEmpty)
      rowAmmo(
          w.pFoudre,
          AppLocalizations.of(context)!.pFoudre,
          getMaxMun2(maxMun),
          getReculG2(w.recul, reculB, context),
          getReloadP2P3Sh3StkH2PElem(w.rechargement, reloadB, context, true)),
    if (w.glace.isNotEmpty)
      rowAmmo(
          w.glace,
          AppLocalizations.of(context)!.glace,
          getMaxMun2(maxMun),
          getReculG1(w.recul, reculB, context),
          getReloadN3G2Elem(w.rechargement, reloadB, context, true)),
    if (w.pGlace.isNotEmpty)
      rowAmmo(
          w.pGlace,
          AppLocalizations.of(context)!.pGlace,
          getMaxMun2(maxMun),
          getReculG2(w.recul, reculB, context),
          getReloadP2P3Sh3StkH2PElem(w.rechargement, reloadB, context, true)),
    if (w.dragon.isNotEmpty)
      rowAmmo(
          w.dragon,
          AppLocalizations.of(context)!.dragon,
          getMaxMun3(maxMun),
          getReculG5(w.recul, reculB, context, true),
          getReloadStk3FrgDragAffli2(w.rechargement, reloadB, context, true)),
    if (w.pDragon.isNotEmpty)
      rowAmmo(
          w.pDragon,
          AppLocalizations.of(context)!.pDragon,
          getMaxMun3(maxMun),
          getReculG6(w.recul, reculB, context, true),
          getReloadFrag2PDrag(w.rechargement, reloadB, context, true)),
    if (w.tranch.isNotEmpty)
      rowAmmo(
          w.tranch,
          AppLocalizations.of(context)!.tranch,
          getMaxMun2(maxMun),
          getReculG4(w.recul, reculB, context, true),
          getReloadStk2TrchLg2DemPier(w.rechargement, reloadB, context, true)),
    if (w is FusarbaleteLourd)
      if (w.wyvern.isNotEmpty)
        rowAmmo(
            w.wyvern,
            AppLocalizations.of(context)!.wyvern,
            0,
            AppLocalizations.of(context)!.wyvern,
            getReloadStk2TrchLg2DemPier(
                w.rechargement, reloadB, context, true)),
    if (w.tranquil.isNotEmpty)
      rowAmmo(
          w.tranquil,
          AppLocalizations.of(context)!.tranquil,
          getMaxMun1(maxMun),
          getReculG2(w.recul, reculB, context),
          getReloadN2GHTq(w.rechargement, reloadB, context, true)),
  ]);
}

Widget rowAmmo(
    List<dynamic> a, String name, int maxMun, String recul, String reload) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    cadreAmmoValueImg(90, Text(name)),
    cadreAmmoValueImg(20, Text((a[0] + maxMun).toString())),
    cadreAmmoValueImg(75, Text(recul)),
    cadreAmmoValueImg(85, Text(reload)),
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

Widget blockMunListing(Fusarbalete w, BuildContext context) {
  int n1 = munExists(w.normal1),
      n2 = munExists(w.normal2),
      n3 = munExists(w.normal3),
      p1 = munExists(w.perfo1),
      p2 = munExists(w.perfo2),
      p3 = munExists(w.perfo3),
      g1 = munExists(w.grenaille1),
      g2 = munExists(w.grenaille2),
      g3 = munExists(w.grenaille3),
      sh1 = munExists(w.shrapnel1),
      sh2 = munExists(w.shrapnel2),
      sh3 = munExists(w.shrapnel3),
      ab1 = munExists(w.antib1),
      ab2 = munExists(w.antib2),
      ab3 = munExists(w.antib3),
      fg1 = munExists(w.frag1),
      fg2 = munExists(w.frag2),
      ps1 = munExists(w.poison1),
      ps2 = munExists(w.poison2),
      pr1 = munExists(w.para1),
      pr2 = munExists(w.para2),
      sl1 = munExists(w.sleep1),
      sl2 = munExists(w.sleep2),
      fat1 = munExists(w.fatigue1),
      fat2 = munExists(w.fatigue2),
      sn1 = munExists(w.soin1),
      sn2 = munExists(w.soin2),
      dem = munExists(w.demon),
      amr = munExists(w.pierre),
      feu = munExists(w.feu),
      pfeu = munExists(w.pFeu),
      eau = munExists(w.eau),
      peau = munExists(w.pEau),
      fdr = munExists(w.foudre),
      pfdr = munExists(w.pFoudre),
      gla = munExists(w.glace),
      pgla = munExists(w.pGlace),
      dra = munExists(w.dragon),
      pdra = munExists(w.pDragon),
      sli = munExists(w.tranch),
      trnq = munExists(w.tranquil),
      fg3 = 0,
      wyv = 0;
  if (w is FusarbaleteLourd) {
    fg3 = munExists(w.frag3);
    wyv = munExists(w.wyvern);
  }
  return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Column(children: [
          Text("${AppLocalizations.of(context)!.abrNrm} $n1 $n2 $n3"),
          Text("${AppLocalizations.of(context)!.abrPer} $p1 $p2 $p3"),
          Text("${AppLocalizations.of(context)!.abrSpr} $g1 $g2 $g3"),
          Text("${AppLocalizations.of(context)!.abrShr} $sh1 $sh2 $sh3"),
          Text("${AppLocalizations.of(context)!.abrSti} $ab1 $ab2 $ab3"),
          if (w is FusarbaleteLourd)
            Text("${AppLocalizations.of(context)!.abrClu} $fg1 $fg2 $fg3"),
        ]),
        Column(children: [
          Text("${AppLocalizations.of(context)!.abrFeu} $feu $pfeu"),
          Text("${AppLocalizations.of(context)!.abrEau} $eau $peau"),
          Text("${AppLocalizations.of(context)!.abrFoudre} $fdr $pfdr"),
          Text("${AppLocalizations.of(context)!.abrGlace} $gla $pgla"),
          Text("${AppLocalizations.of(context)!.abrDragon} $dra $pdra"),
        ]),
        Column(children: [
          if (w is FusarbaleteLeger)
            Text("${AppLocalizations.of(context)!.abrClu} $fg1 $fg2"),
          Text("${AppLocalizations.of(context)!.abrPoi} $ps1 $ps2"),
          Text("${AppLocalizations.of(context)!.abrPar} $pr1 $pr2"),
          Text("${AppLocalizations.of(context)!.abrSle} $sl1 $sl2"),
          Text("${AppLocalizations.of(context)!.abrExh} $fat1 $fat2"),
          if (w is FusarbaleteLourd)
            Text("${AppLocalizations.of(context)!.abrRec} $sn1 $sn2"),
        ]),
        Column(children: [
          if (w is FusarbaleteLeger)
            Text("${AppLocalizations.of(context)!.abrRec} $sn1 $sn2"),
          Text("${AppLocalizations.of(context)!.abrDem} $dem"),
          Text("${AppLocalizations.of(context)!.abrAmr} $amr"),
          Text("${AppLocalizations.of(context)!.abrSli} $sli"),
          if (w is FusarbaleteLourd)
            Text("${AppLocalizations.of(context)!.abrWyv} $wyv"),
          Text("${AppLocalizations.of(context)!.abrTra} $trnq"),
        ])
      ]));
}

int munExists(List<dynamic> a) {
  int vretour = 0;
  if (a.isNotEmpty) {
    vretour = a[0];
  }
  return vretour;
}

getPrintBarreAmmo(Stuff s, BuildContext context) {
  Fusarbalete w = s.weapon as Fusarbalete;
  int maxMun = s.getTalentValueById(91);
  int reculB = s.getTalentValueById(116);
  int reloadB = s.getTalentValueById(144);
  if (s.getTalentById(118) != 0 && w.mod == 0) reloadB += 1;
  if (w is FusarbaleteLeger && w.mod == 1) reculB += 1;
  return Card(
      margin: const EdgeInsets.all(5),
      color: primary,
      child: Container(
          padding: const EdgeInsets.all(5),
          child: Column(children: [
            title(AppLocalizations.of(context)!.mun),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              cadreAmmoValueStat(
                  50,
                  Text(AppLocalizations.of(context)!.name,
                      style: TextStyle(
                          color: fifth, fontWeight: FontWeight.bold))),
              cadreAmmoValueStat(
                  30,
                  Text(AppLocalizations.of(context)!.qte,
                      style: TextStyle(
                          color: fifth, fontWeight: FontWeight.bold))),
              cadreAmmoValueStat(
                  50,
                  Text(AppLocalizations.of(context)!.abrRecul,
                      style: TextStyle(
                          color: fifth, fontWeight: FontWeight.bold))),
              cadreAmmoValueStat(
                  60,
                  Text(AppLocalizations.of(context)!.abrRecharge,
                      style: TextStyle(
                          color: fifth, fontWeight: FontWeight.bold))),
              Row(children: [
                logoMunStat(1, 'images/arme/mun/footstep.png', 15),
                logoMunStat(1, 'images/arme/mun/greenCircle.png', 15),
                logoMunStat(1, 'images/arme/mun/downBlue.png', 15),
                logoMunStat(1, 'images/arme/mun/upOrange.png', 15)
              ])
            ]),
            const Divider(color: Colors.black),
            if (w.normal1.isNotEmpty)
              rowAmmoStat(
                  w.normal1,
                  '${AppLocalizations.of(context)!.abrNrm} I',
                  getMaxMun13(maxMun),
                  getReculNorm(context),
                  getReloadNorm(w.rechargement, reloadB, context, false)),
            if (w.normal2.isNotEmpty)
              rowAmmoStat(
                  w.normal2,
                  '${AppLocalizations.of(context)!.abrNrm} II',
                  getMaxMun23(maxMun),
                  getReculG1(w.recul, reculB, context),
                  getReloadN2GHTq(w.rechargement, reloadB, context, false)),
            if (w.normal3.isNotEmpty)
              rowAmmoStat(
                  w.normal3,
                  '${AppLocalizations.of(context)!.abrNrm} III',
                  getMaxMun3(maxMun),
                  getReculG1(w.recul, reculB, context),
                  getReloadN3G2Elem(w.rechargement, reloadB, context, false)),
            if (w.perfo1.isNotEmpty)
              rowAmmoStat(
                  w.perfo1,
                  '${AppLocalizations.of(context)!.abrPer} I',
                  getMaxMun13(maxMun),
                  getReculG1(w.recul, reculB, context),
                  getReloadPerfoShrap2(
                      w.rechargement, reloadB, context, false)),
            if (w.perfo2.isNotEmpty)
              rowAmmoStat(
                  w.perfo2,
                  '${AppLocalizations.of(context)!.abrPer} II',
                  getMaxMun2(maxMun),
                  getReculG3(w.recul, reculB, context),
                  getReloadP2P3Sh3StkH2PElem(
                      w.rechargement, reloadB, context, false)),
            if (w.perfo3.isNotEmpty)
              rowAmmoStat(
                  w.perfo3,
                  '${AppLocalizations.of(context)!.abrPer} III',
                  getMaxMun3(maxMun),
                  getReculG3(w.recul, reculB, context),
                  getReloadP2P3Sh3StkH2PElem(
                      w.rechargement, reloadB, context, false)),
            if (w.grenaille1.isNotEmpty)
              rowAmmoStat(
                  w.grenaille1,
                  '${AppLocalizations.of(context)!.abrSpr} I',
                  getMaxMun13(maxMun),
                  getReculG1(w.recul, reculB, context),
                  getReloadN2GHTq(w.rechargement, reloadB, context, false)),
            if (w.grenaille2.isNotEmpty)
              rowAmmoStat(
                  w.grenaille2,
                  '${AppLocalizations.of(context)!.abrSpr} II',
                  getMaxMun2(maxMun),
                  getReculG2(w.recul, reculB, context),
                  getReloadN3G2Elem(w.rechargement, reloadB, context, false)),
            if (w.grenaille3.isNotEmpty)
              rowAmmoStat(
                  w.grenaille3,
                  '${AppLocalizations.of(context)!.abrSpr} III',
                  getMaxMun3(maxMun),
                  getReculG3(w.recul, reculB, context),
                  getReloadGren3(w.rechargement, reloadB, context, false)),
            if (w.shrapnel1.isNotEmpty)
              rowAmmoStat(
                  w.shrapnel1,
                  '${AppLocalizations.of(context)!.abrShr} I',
                  getMaxMun13(maxMun),
                  getReculG1(w.recul, reculB, context),
                  getReloadShrap1(w.rechargement, reloadB, context, false)),
            if (w.shrapnel2.isNotEmpty)
              rowAmmoStat(
                  w.shrapnel2,
                  '${AppLocalizations.of(context)!.abrShr} II',
                  getMaxMun2(maxMun),
                  getReculG2(w.recul, reculB, context),
                  getReloadPerfoShrap2(
                      w.rechargement, reloadB, context, false)),
            if (w.shrapnel3.isNotEmpty)
              rowAmmoStat(
                  w.shrapnel3,
                  '${AppLocalizations.of(context)!.abrShr} III',
                  getMaxMun3(maxMun),
                  getReculG3(w.recul, reculB, context),
                  getReloadP2P3Sh3StkH2PElem(
                      w.rechargement, reloadB, context, false)),
            if (w.antib1.isNotEmpty)
              rowAmmoStat(
                  w.antib1,
                  '${AppLocalizations.of(context)!.abrSti} I',
                  getMaxMun2(maxMun),
                  getReculG3(w.recul, reculB, context),
                  getReloadP2P3Sh3StkH2PElem(
                      w.rechargement, reloadB, context, false)),
            if (w.antib2.isNotEmpty)
              rowAmmoStat(
                  w.antib2,
                  '${AppLocalizations.of(context)!.abrSti} II',
                  getMaxMun3(maxMun),
                  getReculG4(w.recul, reculB, context, false),
                  getReloadStk2TrchLg2DemPier(
                      w.rechargement, reloadB, context, false)),
            if (w.antib3.isNotEmpty)
              rowAmmoStat(
                  w.antib3,
                  '${AppLocalizations.of(context)!.abrSti} III',
                  getMaxMun3(maxMun),
                  getReculG4(w.recul, reculB, context, false),
                  getReloadStk3FrgDragAffli2(
                      w.rechargement, reloadB, context, false)),
            if (w.frag1.isNotEmpty)
              rowAmmoStat(
                  w.frag1,
                  '${AppLocalizations.of(context)!.abrClu} I',
                  getMaxMun3(maxMun),
                  getReculG4(w.recul, reculB, context, false),
                  getReloadStk3FrgDragAffli2(
                      w.rechargement, reloadB, context, false)),
            if (w.frag2.isNotEmpty)
              rowAmmoStat(
                  w.frag2,
                  '${AppLocalizations.of(context)!.abrClu} II',
                  getMaxMun3(maxMun),
                  getReculFrag2(w.recul, reculB, context, false),
                  getReloadFrag2PDrag(w.rechargement, reloadB, context, false)),
            if (w is FusarbaleteLourd)
              if (w.frag3.isNotEmpty)
                rowAmmoStat(
                    w.frag3,
                    '${AppLocalizations.of(context)!.abrClu} III',
                    getMaxMun3(maxMun),
                    getReculFrag2(w.recul, reculB, context, false),
                    getReloadFrag2PDrag(
                        w.rechargement, reloadB, context, false)),
            if (w.poison1.isNotEmpty)
              rowAmmoStat(
                  w.poison1,
                  '${AppLocalizations.of(context)!.abrPoi} I',
                  getMaxMun2(maxMun),
                  getReculG5(w.recul, reculB, context, false),
                  getReloadToxiLetarg(w.rechargement, reloadB, context, false)),
            if (w.poison2.isNotEmpty)
              rowAmmoStat(
                  w.poison2,
                  '${AppLocalizations.of(context)!.abrPoi} II',
                  getMaxMun3(maxMun),
                  getReculG6(w.recul, reculB, context, false),
                  getReloadStk3FrgDragAffli2(
                      w.rechargement, reloadB, context, false)),
            if (w.para1.isNotEmpty)
              rowAmmoStat(
                  w.para1,
                  '${AppLocalizations.of(context)!.abrPar} I',
                  getMaxMun3(maxMun),
                  getReculG5(w.recul, reculB, context, false),
                  getReloadParaSomm(w.rechargement, reloadB, context, false)),
            if (w.para2.isNotEmpty)
              rowAmmoStat(
                  w.para2,
                  '${AppLocalizations.of(context)!.abrPar} II',
                  getMaxMun3(maxMun),
                  getReculG6(w.recul, reculB, context, false),
                  getReloadStk3FrgDragAffli2(
                      w.rechargement, reloadB, context, false)),
            if (w.sleep1.isNotEmpty)
              rowAmmoStat(
                  w.sleep1,
                  '${AppLocalizations.of(context)!.abrSle} I',
                  getMaxMun3(maxMun),
                  getReculG5(w.recul, reculB, context, false),
                  getReloadParaSomm(w.rechargement, reloadB, context, false)),
            if (w.sleep2.isNotEmpty)
              rowAmmoStat(
                  w.sleep2,
                  '${AppLocalizations.of(context)!.abrSle} II',
                  getMaxMun3(maxMun),
                  getReculG6(w.recul, reculB, context, false),
                  getReloadStk3FrgDragAffli2(
                      w.rechargement, reloadB, context, false)),
            if (w.fatigue1.isNotEmpty)
              rowAmmoStat(
                  w.fatigue1,
                  '${AppLocalizations.of(context)!.abrExh} I',
                  getMaxMun3(maxMun),
                  getReculG3(w.recul, reculB, context),
                  getReloadToxiLetarg(w.rechargement, reloadB, context, false)),
            if (w.fatigue2.isNotEmpty)
              rowAmmoStat(
                  w.fatigue2,
                  '${AppLocalizations.of(context)!.abrExh} II',
                  getMaxMun3(maxMun),
                  getReculG5(w.recul, reculB, context, false),
                  getReloadStk2TrchLg2DemPier(
                      w.rechargement, reloadB, context, false)),
            if (w.soin1.isNotEmpty)
              rowAmmoStat(
                  w.soin1,
                  '${AppLocalizations.of(context)!.abrRec} I',
                  getMaxMun2(maxMun),
                  getReculSoin(w.recul, reculB, context),
                  getReloadN2GHTq(w.rechargement, reloadB, context, false)),
            if (w.soin2.isNotEmpty)
              rowAmmoStat(
                  w.soin2,
                  '${AppLocalizations.of(context)!.abrRec} II',
                  getMaxMun3(maxMun),
                  getReculG5(w.recul, reculB, context, false),
                  getReloadP2P3Sh3StkH2PElem(
                      w.rechargement, reloadB, context, false)),
            if (w.demon.isNotEmpty)
              rowAmmoStat(
                  w.demon,
                  AppLocalizations.of(context)!.abrDem,
                  getMaxMun3(maxMun),
                  getReculG2(w.recul, reculB, context),
                  getReloadStk2TrchLg2DemPier(
                      w.rechargement, reloadB, context, false)),
            if (w.pierre.isNotEmpty)
              rowAmmoStat(
                  w.pierre,
                  AppLocalizations.of(context)!.abrAmr,
                  getMaxMun3(maxMun),
                  getReculG2(w.recul, reculB, context),
                  getReloadStk2TrchLg2DemPier(
                      w.rechargement, reloadB, context, false)),
            if (w.feu.isNotEmpty)
              rowAmmoStat(
                  w.feu,
                  AppLocalizations.of(context)!.abrFeu2,
                  getMaxMun2(maxMun),
                  getReculG1(w.recul, reculB, context),
                  getReloadN3G2Elem(w.rechargement, reloadB, context, false)),
            if (w.pFeu.isNotEmpty)
              rowAmmoStat(
                  w.pFeu,
                  AppLocalizations.of(context)!.abrPFeu,
                  getMaxMun2(maxMun),
                  getReculG2(w.recul, reculB, context),
                  getReloadP2P3Sh3StkH2PElem(
                      w.rechargement, reloadB, context, false)),
            if (w.eau.isNotEmpty)
              rowAmmoStat(
                  w.eau,
                  AppLocalizations.of(context)!.abrEau2,
                  getMaxMun2(maxMun),
                  getReculG1(w.recul, reculB, context),
                  getReloadN3G2Elem(w.rechargement, reloadB, context, false)),
            if (w.pEau.isNotEmpty)
              rowAmmoStat(
                  w.pEau,
                  AppLocalizations.of(context)!.abrPEau,
                  getMaxMun2(maxMun),
                  getReculG2(w.recul, reculB, context),
                  getReloadP2P3Sh3StkH2PElem(
                      w.rechargement, reloadB, context, false)),
            if (w.foudre.isNotEmpty)
              rowAmmoStat(
                  w.foudre,
                  AppLocalizations.of(context)!.abrFoudre2,
                  getMaxMun2(maxMun),
                  getReculG1(w.recul, reculB, context),
                  getReloadN3G2Elem(w.rechargement, reloadB, context, false)),
            if (w.pFoudre.isNotEmpty)
              rowAmmoStat(
                  w.pFoudre,
                  AppLocalizations.of(context)!.abrPFoudre,
                  getMaxMun2(maxMun),
                  getReculG2(w.recul, reculB, context),
                  getReloadP2P3Sh3StkH2PElem(
                      w.rechargement, reloadB, context, false)),
            if (w.glace.isNotEmpty)
              rowAmmoStat(
                  w.glace,
                  AppLocalizations.of(context)!.abrGlace2,
                  getMaxMun2(maxMun),
                  getReculG1(w.recul, reculB, context),
                  getReloadN3G2Elem(w.rechargement, reloadB, context, false)),
            if (w.pGlace.isNotEmpty)
              rowAmmoStat(
                  w.pGlace,
                  AppLocalizations.of(context)!.abrPGlace,
                  getMaxMun2(maxMun),
                  getReculG2(w.recul, reculB, context),
                  getReloadP2P3Sh3StkH2PElem(
                      w.rechargement, reloadB, context, false)),
            if (w.dragon.isNotEmpty)
              rowAmmoStat(
                  w.dragon,
                  AppLocalizations.of(context)!.abrDragon2,
                  getMaxMun3(maxMun),
                  getReculG5(w.recul, reculB, context, false),
                  getReloadStk3FrgDragAffli2(
                      w.rechargement, reloadB, context, false)),
            if (w.pDragon.isNotEmpty)
              rowAmmoStat(
                  w.pDragon,
                  AppLocalizations.of(context)!.abrPDragon,
                  getMaxMun3(maxMun),
                  getReculG6(w.recul, reculB, context, false),
                  getReloadFrag2PDrag(w.rechargement, reloadB, context, false)),
            if (w.tranch.isNotEmpty)
              rowAmmoStat(
                  w.tranch,
                  AppLocalizations.of(context)!.abrSli,
                  getMaxMun2(maxMun),
                  getReculG4(w.recul, reculB, context, false),
                  getReloadStk2TrchLg2DemPier(
                      w.rechargement, reloadB, context, false)),
            if (w is FusarbaleteLourd)
              if (w.wyvern.isNotEmpty)
                rowAmmoStat(
                    w.wyvern,
                    AppLocalizations.of(context)!.abrWyv,
                    0,
                    AppLocalizations.of(context)!.abrReculWyvern,
                    getReloadStk2TrchLg2DemPier(
                        w.rechargement, reloadB, context, false)),
            if (w.tranquil.isNotEmpty)
              rowAmmoStat(
                  w.tranquil,
                  AppLocalizations.of(context)!.abrTra,
                  getMaxMun1(maxMun),
                  getReculG2(w.recul, reculB, context),
                  getReloadN2GHTq(w.rechargement, reloadB, context, false)),
          ])));
}

Widget rowAmmoStat(
    List<dynamic> a, String name, int maxMun, String recul, String reload) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    cadreAmmoValueStat(55, white(name)),
    cadreAmmoValueStat(20, white((a[0] + maxMun).toString())),
    cadreAmmoValueStat(55, white(recul)),
    cadreAmmoValueStat(60, white(reload)),
    Row(children: [
      logoMunStat(a[1], 'images/arme/mun/footstep.png', 15),
      logoMunStat(a[2], 'images/arme/mun/greenCircle.png', 15),
      logoMunStat(a[3], 'images/arme/mun/downBlue.png', 15),
      logoMunStat(a[4], 'images/arme/mun/upOrange.png', 15)
    ])
  ]);
}

Widget logoMunStat(int i, String img, double hw) {
  Widget vretour;
  if (i != 0) {
    vretour = Image.asset(img, height: hw, width: hw);
  } else {
    vretour = SizedBox(height: hw, width: hw);
  }
  return Container(
      decoration: BoxDecoration(
          border: Border.all(
        color: secondary, // Couleur de la bordure
        width: 1.0, // Épaisseur de la bordure
      )),
      child: vretour);
}
