import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String getTypeTir(int id, BuildContext context) {
  String vretour = '';
  switch (id) {
    case 0:
      vretour = AppLocalizations.of(context)!.tPerf;
      break;
    case 1:
      vretour = AppLocalizations.of(context)!.tFrag;
      break;
    case 2:
      vretour = AppLocalizations.of(context)!.tRapide;
      break;
  }
  return vretour;
}
