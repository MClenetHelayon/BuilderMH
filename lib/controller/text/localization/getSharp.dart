import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String getSharpName(String id, BuildContext context) {
  String vretour = '';
  switch (id) {
    case 'r':
      vretour = AppLocalizations.of(context)!.sharpR;
      break;
    case 'o':
      vretour = AppLocalizations.of(context)!.sharpO;
      break;
    case 'j':
      vretour = AppLocalizations.of(context)!.sharpJ;
      break;
    case 'v':
      vretour = AppLocalizations.of(context)!.sharpV;
      break;
    case 'b':
      vretour = AppLocalizations.of(context)!.sharpB;
      break;
    case 'bc':
      vretour = AppLocalizations.of(context)!.sharpBc;
      break;
    case 'vl':
      vretour = AppLocalizations.of(context)!.sharpVl;
      break;
  }
  return vretour;
}

int convertStringSharpToIdSharp(String id) {
  int vretour = 0;
  switch (id) {
    case 'r':
      vretour = 1;
      break;
    case 'o':
      vretour = 2;
      break;
    case 'j':
      vretour = 3;
      break;
    case 'v':
      vretour = 4;
      break;
    case 'b':
      vretour = 5;
      break;
    case 'bc':
      vretour = 6;
      break;
    case 'vl':
      vretour = 7;
      break;
  }
  return vretour;
}
