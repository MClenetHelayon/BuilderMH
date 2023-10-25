import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String getTypeCanon(int id, BuildContext context) {
  String vretour = "";
  switch (id) {
    case 0:
      vretour = AppLocalizations.of(context)!.canonLong;
      break;
    case 1:
      vretour = AppLocalizations.of(context)!.canonNormal;
      break;
    case 2:
      vretour = AppLocalizations.of(context)!.canonLarge;
      break;
  }
  return vretour;
}
