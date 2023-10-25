import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String getDeviation(int id, BuildContext context) {
  String vretour = '';
  switch (id) {
    case 0:
      vretour = AppLocalizations.of(context)!.none;
      break;
    case 1:
      vretour = AppLocalizations.of(context)!.gauche;
      break;
    case 2:
      vretour = AppLocalizations.of(context)!.droite;
      break;
    case 3:
      vretour = AppLocalizations.of(context)!.gaucheDroite;
      break;
  }
  return vretour;
}
String getValueDeviation(int id, BuildContext context) {
  String vretour = '';
  switch (id) {
    case 0:
      vretour = AppLocalizations.of(context)!.none;
      break;
    case 1:
      vretour = AppLocalizations.of(context)!.vDevia1;
      break;
    case 2:
      vretour = AppLocalizations.of(context)!.vDevia2;
      break;
  }
  return vretour;
}