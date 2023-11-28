import 'package:builder_mhrs/manager/img/simplyArmor.dart';
import 'package:builder_mhrs/manager/img/simplyDeco.dart';
import 'package:builder_mhrs/manager/img/simplyElement.dart';
import 'package:builder_mhrs/manager/img/simplyMusic.dart';
import 'package:builder_mhrs/manager/img/simplyRampage.dart';
import 'package:builder_mhrs/manager/img/simplyRaw.dart';
import 'package:builder_mhrs/manager/img/simplyWeapon.dart';

String element(int id) {
  String vretour = 'images/logoBuildCard.png';
  switch (id) {
    case 1:
      vretour = getFeu();
      break;
    case 2:
      vretour = getEau();
      break;
    case 3:
      vretour = getFoudre();
      break;
    case 4:
      vretour = getGlace();
      break;
    case 5:
      vretour = getDragon();
      break;
    case 6:
      vretour = getPoison();
      break;
    case 7:
      vretour = getPara();
      break;
    case 8:
      vretour = getSleep();
      break;
    case 9:
      vretour = getExplo();
  }
  return vretour;
}

String elementWtName(String id) {
  String vretour = getBasique();
  switch (id) {
    case 'fire':
      vretour = getFeu();
      break;
    case 'water':
      vretour = getEau();
      break;
    case 'thunder':
      vretour = getFoudre();
      break;
    case 'ice':
      vretour = getGlace();
      break;
    case 'dragon':
      vretour = getDragon();
      break;
    case 'poison':
      vretour = getPoison();
      break;
    case 'para':
      vretour = getPara();
      break;
    case 'sleep':
      vretour = getSleep();
      break;
    case 'explo':
      vretour = getExplo();
  }
  return vretour;
}

String slot(int slot) {
  String vretour = getBasique();
  switch (slot) {
    case 1:
      vretour = getSlot1();
      break;
    case 2:
      vretour = getSlot2();
      break;
    case 3:
      vretour = getSlot3();
      break;
    case 4:
      vretour = getSlot4();
      break;
  }
  return vretour;
}

String slotCalam(int slot) {
  String vretour = getBasique();
  switch (slot) {
    case 1:
      vretour = getRampage1();
      break;
    case 2:
      vretour = getRampage2();
      break;
    case 3:
      vretour = getRampage3();
      break;
  }
  return vretour;
}

String arme(String categorie) {
  String vretour = getGS();
  switch (categorie) {
    case 'GS':
      vretour = getGS();
      break;
    case 'LS':
      vretour = getLS();
      break;
    case 'SNS':
      vretour = getSNS();
      break;
    case 'DB':
      vretour = getDB();
      break;
    case 'MRTO':
      vretour = getMRTO();
      break;
    case 'HH':
      vretour = getHH();
      break;
    case 'LNC':
      vretour = getLNC();
      break;
    case 'GL':
      vretour = getGL();
      break;
    case 'SA':
      vretour = getSA();
      break;
    case 'CB':
      vretour = getCB();
      break;
    case 'IG':
      vretour = getIG();
      break;
    case 'ARC':
      vretour = getARC();
      break;
    case 'LBG':
      vretour = getLBG();
      break;
    case 'HBG':
      vretour = getHBG();
      break;
  }
  return vretour;
}

String armure(int id) {
  String vretour = getCasque();
  switch (id) {
    case 1:
      vretour = getCasque();
      break;
    case 2:
      vretour = getTorse();
      break;
    case 3:
      vretour = getBras();
      break;
    case 4:
      vretour = getCeinture();
      break;
    case 5:
      vretour = getJambe();
      break;
    case 6:
      vretour = getPetalas();
      break;
    case 7:
      vretour = getTalisman();
      break;
  }
  return vretour;
}

String musique(int id) {
  String vretour = getBasique();
  switch (id) {
    case 0:
      vretour = getNote1();
      break;
    case 1:
      vretour = getNote2();
      break;
    case 2:
      vretour = getNote3();
      break;
  }
  return vretour;
}
