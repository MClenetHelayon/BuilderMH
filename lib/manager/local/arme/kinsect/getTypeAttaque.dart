import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String getTypeAttack(int i, BuildContext context) {
  String vretour = '';
  if (i == 0) {
    vretour = AppLocalizations.of(context)!.severe;
  } else {
    vretour = AppLocalizations.of(context)!.blunt;
  }
  return vretour;
}
