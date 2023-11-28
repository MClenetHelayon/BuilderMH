// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:builder_mhrs/object/Transcendance.dart';
import 'package:builder_mhrs/object/weapon/Arme.dart';
import 'package:builder_mhrs/object/weapon/tranchant/Lancecanon.dart';

String txtListAugment(Arme w) {
  String vretour = '',
      vAtt = '',
      vAff = '',
      vAffl = '',
      vRamp = '',
      vElem = '',
      vShell = '',
      vSharp = '';
  Transcendance t = Arme.transcendance;
  if (Arme.augments) {
    if (t.bAtt.contains(true)) {
      if (t.bAtt[0]) vAtt = "1";
      if (t.bAtt[1]) vAtt = "2";
      if (t.bAtt[2]) vAtt = "3";
      if (t.bAtt[3]) vAtt = "4";
    } else
      vAtt = "0";
  } else
    vAtt = "-";

  vretour += vAtt;
  if (Arme.augments) {
    if (t.bAff.contains(true)) {
      if (t.bAff[0]) vAff = "/1";
      if (t.bAff[1]) vAff = "/2";
      if (t.bAff[2]) vAff = "/3";
    } else
      vAff = "/0";
  } else
    vAff = "/-";

  vretour += vAff;
  if (w.idElement != 0 && w.idElement <= 5) {
    if (Arme.augments) {
      if (t.bElem.contains(true)) {
        if (t.bElem[0]) vElem = "/1";
        if (t.bElem[1]) vElem = "/2";
        if (t.bElem[2]) vElem = "/3";
        if (t.bElem[3]) vElem = "/4";
        if (t.bElem[4]) vElem = "/5";
        if (t.bElem[5]) vElem = "/6";
        if (t.bElem[6]) vElem = "/7";
        if (t.bElem[7]) vElem = "/8";
      } else
        vElem = "/0";
    } else
      vElem = "/-";
  }
  vretour += vElem;
  if (w.idElement != 0 && w.idElement >= 6) {
    if (Arme.augments) {
      if (t.bAffl.contains(true)) {
        if (t.bAffl[0]) vAffl += "/1";
        if (t.bAffl[1]) vAffl += "/2";
        if (t.bAffl[2]) vAffl += "/3";
        if (t.bAffl[3]) vAffl += "/4";
      } else
        vAffl += "/0";
    } else
      vAffl += "/-";
  }
  vretour += vAffl;
  if (w is Tranchant) {
    if (Arme.augments) {
      if (t.bSharp.contains(true)) {
        if (t.bSharp[0]) vSharp = "/1";
        if (t.bSharp[1]) vSharp = "/2";
        if (t.bSharp[2]) vSharp = "/3";
        if (t.bSharp[3]) vSharp = "/4";
      } else
        vSharp = "/0";
    } else
      vSharp = "/-";
  }
  vretour += vSharp;
  if (w is Lancecanon) {
    if (Arme.augments) {
      if (t.bShell.contains(true)) {
        if (t.bShell[0]) vShell = "/1";
        if (t.bShell[1]) vShell = "/2";
      } else
        vShell = "/0";
    } else
      vShell = "/-";
  }
  vretour += vShell;
  if (w.slotCalamite != 3) {
    if (Arme.augments) {
      if (t.bRamp.contains(true)) {
        if (t.bRamp[0]) vRamp = "/1";
        if (t.bRamp[1]) vRamp = "/2";
      } else
        vRamp = "/0";
    } else
      vRamp = "/-";
  }
  vretour += vRamp;
  return vretour;
}
