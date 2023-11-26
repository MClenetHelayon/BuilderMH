import 'package:builder_mhrs/object/weapon/Arc.dart';
import 'package:builder_mhrs/object/weapon/Arme.dart';
import 'package:builder_mhrs/object/weapon/fusarbalete/FusarbaleteLeger.dart';
import 'package:builder_mhrs/object/weapon/fusarbalete/FusarbaleteLourd.dart';
import 'package:builder_mhrs/object/weapon/tranchant/GrandeEpee.dart';
import 'package:builder_mhrs/object/weapon/tranchant/LameDouble.dart';
import 'package:builder_mhrs/object/weapon/tranchant/Lance.dart';
import 'package:builder_mhrs/object/weapon/tranchant/Lancecanon.dart';
import 'package:builder_mhrs/object/weapon/tranchant/Marteau.dart';

void getAllValue(Arme w) {
  getValueAttActive(w);
  getValueElemActive(w);
  getValueSharpActive();
  getBoostCalam(w);
  getValueAffi();
  getValueAffli(w);
  getValueShell(w);
}

void getValueAttActive(Arme w) {
  int vretour = 0;
  if (Arme.augments) {
    if (w is Fusarbalete || w is Arc) {
      if (w is FusarbaleteLeger) vretour += 10;
      if (w is Arc) vretour += 15;
      if (w is FusarbaleteLourd) vretour += 20;
    } else if (w.idElement != 0 && w.idElement <= 5) {
      vretour += 25;
    } else {
      vretour += 40;
    }
  }
  Arme.transcendance.att = getAttChange() + vretour;
}

void getValueElemActive(Arme w) {
  int vretour = 0;
  if (Arme.augments) {
    vretour += 18;
    if (w is Lancecanon || w is Lance) {
      vretour += 21;
    }
    if (w is GrandeEpee || w is Marteau) {
      vretour += 30;
    }
  }
  Arme.transcendance.elem = getElemChange(w) + vretour;
}

void getValueSharpActive() {
  int vretour = 0;
  if (Arme.augments) {
    vretour += 20;
  }
  Arme.transcendance.sharp = getSharpChange() + vretour;
}

void getValueAffi() {
  int vretour = 0;
  if (Arme.augments) {
    if (Arme.transcendance.bAff[0]) vretour = 5;
    if (Arme.transcendance.bAff[1]) vretour = 10;
    if (Arme.transcendance.bAff[2]) vretour = 15;
  }
  Arme.transcendance.aff = vretour;
}

void getBoostCalam(Arme w) {
  if (Arme.augments) {
    Arme.transcendance.calam = w.slotCalamite + getRampChange();
  }
}

void getValueAffli(Arme w) {
  int vretour = 0;
  if (Arme.augments) {
    if (Arme.transcendance.bAffl[0]) {
      vretour = 4;
      if (w is Arc || w is LameDouble) vretour = 3;
      if (w is GrandeEpee) vretour = 6;
    }
    if (Arme.transcendance.bAffl[1]) {
      vretour = 8;
      if (w is Arc || w is LameDouble) vretour = 6;
      if (w is GrandeEpee) vretour = 12;
    }
    if (Arme.transcendance.bAffl[2]) {
      vretour = 12;
      if (w is Arc || w is LameDouble) vretour = 9;
      if (w is GrandeEpee) vretour = 18;
    }
    if (Arme.transcendance.bAffl[3]) {
      vretour = 16;
      if (w is Arc || w is LameDouble) vretour = 12;
      if (w is GrandeEpee) vretour = 24;
    }
  }
  Arme.transcendance.affl = vretour;
}

void getValueShell(Arme w) {
  int vretour = 0;
  if (Arme.augments) {
    if (Arme.transcendance.bShell[0]) vretour = 1;
    if (Arme.transcendance.bShell[1]) vretour = 2;
  }
  Arme.transcendance.shell = vretour;
}

int getAttChange() {
  int vretour = 0;
  if (Arme.augments) {
    if (Arme.transcendance.bAtt[0]) vretour = 5;
    if (Arme.transcendance.bAtt[1]) vretour = 10;
    if (Arme.transcendance.bAtt[2]) vretour = 15;
    if (Arme.transcendance.bAtt[3]) vretour = 20;
  }
  return vretour;
}

int getElemChange(Arme w) {
  int vretour = 0;
  if (Arme.augments) {
    if (Arme.transcendance.bElem[0]) {
      vretour = 3;
      if (w is GrandeEpee || w is Marteau) vretour = 5;
    }
    if (Arme.transcendance.bElem[1]) {
      vretour = 6;
      if (w is GrandeEpee || w is Marteau) vretour = 10;
    }
    if (Arme.transcendance.bElem[2]) {
      vretour = 9;
      if (w is Lancecanon || w is Lance) vretour = 10;
      if (w is GrandeEpee || w is Marteau) vretour = 15;
    }
    if (Arme.transcendance.bElem[3]) {
      vretour = 12;
      if (w is Lancecanon || w is Lance) vretour = 14;
      if (w is GrandeEpee || w is Marteau) vretour = 20;
    }
    if (Arme.transcendance.bElem[4]) {
      vretour = 15;
      if (w is Lancecanon || w is Lance) vretour = 18;
      if (w is GrandeEpee || w is Marteau) vretour = 25;
    }
    if (Arme.transcendance.bElem[5]) {
      vretour = 320;
      if (w is Lancecanon || w is Lance) vretour = 24;
      if (w is GrandeEpee || w is Marteau) vretour = 33;
    }
    if (Arme.transcendance.bElem[6]) {
      vretour = 27;
      if (w is Lancecanon || w is Lance) vretour = 32;
      if (w is GrandeEpee || w is Marteau) vretour = 43;
    }
    if (Arme.transcendance.bElem[7]) {
      vretour = 35;
      if (w is Lancecanon || w is Lance) vretour = 42;
      if (w is GrandeEpee || w is Marteau) vretour = 55;
    }
  }
  return vretour;
}

int getSharpChange() {
  int vretour = 0;
  if (Arme.augments) {
    if (Arme.transcendance.bSharp[0]) vretour = 10;
    if (Arme.transcendance.bSharp[1]) vretour = 20;
    if (Arme.transcendance.bSharp[2]) vretour = 30;
    if (Arme.transcendance.bSharp[3]) vretour = 40;
  }
  return vretour;
}

int getRampChange() {
  int vretour = 0;
  if (Arme.augments) {
    if (Arme.transcendance.bRamp[0]) vretour = 1;
    if (Arme.transcendance.bRamp[1]) vretour = 2;
  }
  return vretour;
}
