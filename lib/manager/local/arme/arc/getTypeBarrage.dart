import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String getTypeBarrage(int id, BuildContext context) {
  String vretour = '';
  switch (id) {
    case 0:
      vretour = AppLocalizations.of(context)!.bRecup;
      break;
    case 1:
      vretour = AppLocalizations.of(context)!.bAff;
      break;
    case 2:
      vretour = AppLocalizations.of(context)!.bBrace;
      break;
  }
  return vretour;
}
