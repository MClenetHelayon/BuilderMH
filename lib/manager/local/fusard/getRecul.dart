import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String getRecul(int id, BuildContext context) {
  String vretour = '';
  switch (id) {
    case 1:
      vretour = AppLocalizations.of(context)!.vhRecul;
      break;
    case 2:
      vretour = AppLocalizations.of(context)!.hRecul;
      break;
    case 3:
      vretour = AppLocalizations.of(context)!.aRecul;
      break;
    case 4:
      vretour = AppLocalizations.of(context)!.sRecul;
      break;
    case 5:
      vretour = AppLocalizations.of(context)!.lRecul;
      break;
    case 6:
      vretour = AppLocalizations.of(context)!.vlRecul;
      break;
    case 7:
      vretour = AppLocalizations.of(context)!.stRecul;
  }
  return vretour;
}
