import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String getBoostKinsect(int i, BuildContext context) {
  String vretour = '';
  switch (i) {
    case 0:
      vretour = AppLocalizations.of(context)!.kbRecup;
      break;
    case 1:
      vretour = AppLocalizations.of(context)!.kbDuoDef;
      break;
    case 2:
      vretour = AppLocalizations.of(context)!.kbDuoAtk;
      break;
    case 3:
      vretour = AppLocalizations.of(context)!.kbDuoSpd;
      break;
    case 4:
      vretour = AppLocalizations.of(context)!.kbSlowConsoEndu;
      break;
    case 5:
      vretour = AppLocalizations.of(context)!.kbTime3x;
      break;
    case 6:
      vretour = AppLocalizations.of(context)!.kbFreqAtt;
      break;
    case 7:
      vretour = AppLocalizations.of(context)!.kbRecupEnduOff;
      break;
    case 8:
      vretour = AppLocalizations.of(context)!.kbAttChainCharg;
      break;
    case 9:
      vretour = AppLocalizations.of(context)!.kbSpdCharg;
      break;
    case 10:
      vretour = AppLocalizations.of(context)!.kbPoudreUp;
      break;
    case 11:
      vretour = AppLocalizations.of(context)!.kbPoudreVortex;
      break;
    case 12:
      vretour = AppLocalizations.of(context)!.kbChargKinsect;
  }
  return vretour;
}
