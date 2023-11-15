import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../imgManager.dart';
import '../textManager.dart';
import '../filter/getCombobox.dart';

String getElemName(String id, BuildContext context) {
  String vretour = '';
  switch (id) {
    case 'all':
      vretour = AppLocalizations.of(context)!.all;
      break;
    case 'none':
      vretour = AppLocalizations.of(context)!.none;
      break;
    case 'fire':
      vretour = AppLocalizations.of(context)!.feu;
      break;
    case 'water':
      vretour = AppLocalizations.of(context)!.eau;
      break;
    case 'thunder':
      vretour = AppLocalizations.of(context)!.foudre;
      break;
    case 'ice':
      vretour = AppLocalizations.of(context)!.glace;
      break;
    case 'dragon':
      vretour = AppLocalizations.of(context)!.dragon;
      break;
    case 'poison':
      vretour = AppLocalizations.of(context)!.poison;
      break;
    case 'para':
      vretour = AppLocalizations.of(context)!.para;
      break;
    case 'sleep':
      vretour = AppLocalizations.of(context)!.sleep;
      break;
    case 'explo':
      vretour = AppLocalizations.of(context)!.explo;
      break;
  }
  return vretour;
}

int convertStringElemToIdElem(String id) {
  int vretour = 0;
  switch (id) {
    case 'none':
      vretour = 0;
      break;
    case 'fire':
      vretour = 1;
      break;
    case 'water':
      vretour = 2;
      break;
    case 'thunder':
      vretour = 3;
      break;
    case 'ice':
      vretour = 4;
      break;
    case 'dragon':
      vretour = 5;
      break;
    case 'poison':
      vretour = 6;
      break;
    case 'para':
      vretour = 7;
      break;
    case 'sleep':
      vretour = 8;
      break;
    case 'explo':
      vretour = 9;
      break;
  }
  return vretour;
}

Widget getElemForCombo(String id, BuildContext context) {
  Widget vretour = const Text('');
  if (id == "all") {
    vretour = black(AppLocalizations.of(context)!.all);
  }
  if (id == "none") {
    vretour = black(AppLocalizations.of(context)!.none);
  }
  if (id != "all" && id != "none") {
    vretour = statComboElem(elementWtName(id), getElemName(id, context));
  }
  return vretour;
}
