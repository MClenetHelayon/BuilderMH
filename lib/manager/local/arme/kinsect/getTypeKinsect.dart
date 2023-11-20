import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String getTypeKinsect(int i, BuildContext context) {
  String vretour = '';
  switch (i) {
    case 0:
      vretour = AppLocalizations.of(context)!.kNormal;
      break;
    case 1:
      vretour = AppLocalizations.of(context)!.kBaroudeur;
      break;
    case 2:
      vretour = AppLocalizations.of(context)!.kPowder;
      break;
    case 3:
      vretour = AppLocalizations.of(context)!.kVitesse;
      break;
  }
  return vretour;
}

String getTypeKinsectSecondaire(int i, BuildContext context) {
  String vretour = '';
  switch (i) {
    case 0:
      vretour = AppLocalizations.of(context)!.kPoison;
      break;
    case 1:
      vretour = AppLocalizations.of(context)!.kPara;
      break;
    case 2:
      vretour = AppLocalizations.of(context)!.kExplo;
      break;
    case 3:
      vretour = AppLocalizations.of(context)!.kSoin;
      break;
  }
  return vretour;
}
