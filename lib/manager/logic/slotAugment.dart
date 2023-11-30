import 'package:builder_mhrs/manager/mh/weapon/augment/slotAManager.dart';
import 'package:builder_mhrs/object/Transcendance.dart';

int calculSlotAugment(Transcendance t) {
  int vretour = 10,
      vAtt = 0,
      vAff = 0,
      vAffl = 0,
      vRamp = 0,
      vElem = 0,
      vShell = 0,
      vSharp = 0;

  if (t.bAtt.contains(true)) {
    if (t.bAtt[0]) vAtt = getSlotAtt(0);
    if (t.bAtt[1]) vAtt = getSlotAtt(1);
    if (t.bAtt[2]) vAtt = getSlotAtt(2);
    if (t.bAtt[3]) vAtt = getSlotAtt(3);
  }
  vretour -= vAtt;

  if (t.bAff.contains(true)) {
    if (t.bAff[0]) vAff = getSlotAff(0);
    if (t.bAff[1]) vAff = getSlotAff(1);
    if (t.bAff[2]) vAff = getSlotAff(2);
  }
  vretour -= vAff;

  if (t.bAffl.contains(true)) {
    if (t.bAffl[0]) vAffl = getSlotAffl(0);
    if (t.bAffl[1]) vAffl = getSlotAffl(1);
    if (t.bAffl[2]) vAffl = getSlotAffl(2);
    if (t.bAffl[3]) vAffl = getSlotAffl(3);
  }
  vretour -= vAffl;

  if (t.bRamp.contains(true)) {
    if (t.bRamp[0]) vRamp = getSlotRamp(0);
    if (t.bRamp[1]) vRamp = getSlotRamp(1);
  }
  vretour -= vRamp;

  if (t.bShell.contains(true)) {
    if (t.bShell[0]) vShell = getSlotShelling(0);
    if (t.bShell[1]) vShell = getSlotShelling(1);
  }
  vretour -= vShell;

  if (t.bElem.contains(true)) {
    if (t.bElem[0]) vElem = getSlotElem(0);
    if (t.bElem[1]) vElem = getSlotElem(1);
    if (t.bElem[2]) vElem = getSlotElem(2);
    if (t.bElem[3]) vElem = getSlotElem(3);
    if (t.bElem[4]) vElem = getSlotElem(4);
    if (t.bElem[5]) vElem = getSlotElem(5);
    if (t.bElem[6]) vElem = getSlotElem(6);
    if (t.bElem[7]) vElem = getSlotElem(7);
  }
  vretour -= vElem;

  if (t.bSharp.contains(true)) {
    if (t.bSharp[0]) vSharp = getSlotSharp(0);
    if (t.bSharp[1]) vSharp = getSlotSharp(1);
    if (t.bSharp[2]) vSharp = getSlotSharp(2);
    if (t.bSharp[3]) vSharp = getSlotSharp(3);
  }
  vretour -= vSharp;

  return vretour;
}
