import 'package:builder_mhrs/manager/img/armor.dart';
import 'package:builder_mhrs/manager/img/deco.dart';
import 'package:builder_mhrs/manager/img/element.dart';
import 'package:builder_mhrs/manager/img/music.dart';
import 'package:builder_mhrs/manager/img/rampage.dart';
import 'package:builder_mhrs/manager/img/raw.dart';
import 'package:builder_mhrs/manager/img/weapon.dart';

String element(int id) {
  String vretour = basic;
  switch (id) {
    case 1:
      vretour = feu;
      break;
    case 2:
      vretour = eau;
      break;
    case 3:
      vretour = foudre;
      break;
    case 4:
      vretour = glace;
      break;
    case 5:
      vretour = dragon;
      break;
    case 6:
      vretour = poison;
      break;
    case 7:
      vretour = para;
      break;
    case 8:
      vretour = sleep;
      break;
    case 9:
      vretour = explo;
  }
  return vretour;
}

String elementWtName(String id) {
  String vretour = basic;
  switch (id) {
    case 'fire':
      vretour = feu;
      break;
    case 'water':
      vretour = eau;
      break;
    case 'thunder':
      vretour = foudre;
      break;
    case 'ice':
      vretour = glace;
      break;
    case 'dragon':
      vretour = dragon;
      break;
    case 'poison':
      vretour = poison;
      break;
    case 'para':
      vretour = para;
      break;
    case 'sleep':
      vretour = sleep;
      break;
    case 'explo':
      vretour = explo;
  }
  return vretour;
}

String slot(int slot) {
  String vretour = basic;
  switch (slot) {
    case 1:
      vretour = slot1;
      break;
    case 2:
      vretour = slot2;
      break;
    case 3:
      vretour = slot3;
      break;
    case 4:
      vretour = slot4;
      break;
  }
  return vretour;
}

String slotCalam(int slot) {
  String vretour = basic;
  switch (slot) {
    case 1:
      vretour = ramp1;
      break;
    case 2:
      vretour = ramp2;
      break;
    case 3:
      vretour = ramp3;
      break;
  }
  return vretour;
}

String arme(String categorie) {
  String vretour = gs;
  switch (categorie) {
    case 'GS':
      vretour = gs;
      break;
    case 'LS':
      vretour = ls;
      break;
    case 'SNS':
      vretour = sns;
      break;
    case 'DB':
      vretour = db;
      break;
    case 'MRTO':
      vretour = mrto;
      break;
    case 'HH':
      vretour = hh;
      break;
    case 'LNC':
      vretour = lnc;
      break;
    case 'GL':
      vretour = gl;
      break;
    case 'SA':
      vretour = sa;
      break;
    case 'CB':
      vretour = cb;
      break;
    case 'IG':
      vretour = ig;
      break;
    case 'ARC':
      vretour = arc;
      break;
    case 'LBG':
      vretour = lbg;
      break;
    case 'HBG':
      vretour = hbg;
      break;
  }
  return vretour;
}

String armure(int id) {
  String vretour = casque;
  switch (id) {
    case 1:
      vretour = casque;
      break;
    case 2:
      vretour = torse;
      break;
    case 3:
      vretour = bras;
      break;
    case 4:
      vretour = ceinture;
      break;
    case 5:
      vretour = jambe;
      break;
    case 6:
      vretour = petalas;
      break;
    case 7:
      vretour = talisman;
      break;
  }
  return vretour;
}

String musique(int id) {
  String vretour = basic;
  switch (id) {
    case 0:
      vretour = note1;
      break;
    case 1:
      vretour = note2;
      break;
    case 2:
      vretour = note3;
      break;
  }
  return vretour;
}
