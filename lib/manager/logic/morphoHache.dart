import 'package:builder_mhrs/manager/logic/stat.dart';
import 'package:builder_mhrs/object/Stuff.dart';
import 'package:builder_mhrs/object/weapon/tranchant/MorphoHache.dart';
import 'package:flutter/material.dart';
import 'package:builder_mhrs/manager/mh/skill/elementManager.dart' as ele;
import 'package:builder_mhrs/manager/mh/skill/afflictionManager.dart' as affli;

String valueFiole(Stuff s, BuildContext context) {
  MorphoHache sa = s.weapon as MorphoHache;
  double vretour = sa.valueFiole.toDouble();
  //fiole draconique
  if (sa.typeFiole == 5) {
    if (s.getTalentValueById(128) != 0) {
      vretour += ele.getSoifDeSang(
          s.getTalentValueById(128), s.getTalentById(128).actif);
    }
    if (s.getTalentValueById(0) != 0) {
      vretour +=
          ele.getAbandon(s.getTalentValueById(0), s.getTalentById(0).actif);
    }
    if (s.getTalentValueById(142) != 0) {
      vretour += ele.getVendetta(
          s.getTalentValueById(142), s.getTalentById(142).actif, s.weapon);
    }
    if (s.getTalentValueById(57) != 0) {
      vretour += ele.getEveilDeSang(
          s.getTalentValueById(57), s.getTalentById(57).actif, s.weapon);
    }
    if (s.getTalentValueById(140) != 0) {
      vretour +=
          ele.getUnion(s.getTalentValueById(140), s.getTalentById(140).actif);
    }
    if (s.getTalentValueById(40) != 0) {
      vretour += ele.getConvDragonRed(
          s.getTalentValueById(40),
          (defFeu(s) + defEau(s) + defGlace(s) + defDragon(s)),
          s.getTalentById(40).actif,
          s.weapon);
    }
    if (s.getTalentValueById(110) != 0) {
      vretour += ele.getBoostElement(
          s.getTalentValueById(110), vretour, s.getTalentById(110).actif);
    }
    if (s.getTalentValueById(6) != 0) {
      vretour += ele.getStormsoul(
          s.getTalentValueById(6), vretour, s.getTalentById(6).actif);
    }
    if (s.getTalentValueById(77) != 0) {
      vretour += ele.getLutte(
          s.getTalentValueById(77), vretour, s.getTalentById(77).actif);
    }
    if (s.getTalentValueById(41) != 0) {
      vretour += ele.getMailOfHellFire(
          s.getTalentValueById(41), vretour, s.getTalentById(41).actif);
    }
  }
  //fiole de poison ou de para
  if (sa.typeFiole == 2 || sa.typeFiole == 3) {
    if (s.getTalentValueById(128) != 0) {
      vretour += affli.getSoifDeSang(
          s.getTalentValueById(128), s.getTalentById(128).actif);
    }
    switch (sa.typeFiole) {
      case 2:
        if (s.getTalentValueById(96) != 0) {
          vretour += affli.getBoostAffliction(
              s.getTalentValueById(96), s.getTalentById(96).actif);
        }
        break;
      case 3:
        if (s.getTalentValueById(99) != 0) {
          vretour += affli.getBoostAffliction(
              s.getTalentValueById(99), s.getTalentById(99).actif);
        }
        break;
    }
    if (s.getTalentValueById(0) != 0) {
      vretour += affli.getAbandon(
          s.getTalentValueById(0), vretour, s.getTalentById(0).actif);
    }
  }
  //fiole de faiblesse
  if (sa.typeFiole == 4) {
    if (s.getTalentValueById(145) != 0) {
      vretour += affli.getVolEndurance(
          s.getTalentValueById(145), vretour, s.getTalentById(145).actif);
    }
  }
  return vretour.toString();
}
