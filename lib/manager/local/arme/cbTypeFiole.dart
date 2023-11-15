import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String getCbFiole(int id, BuildContext context) {
  String vretour = '';
  switch (id) {
    case 0:
      vretour = AppLocalizations.of(context)!.fChoc;
      break;
    case 1:
      vretour = AppLocalizations.of(context)!.fElement;
      break;
  }
  return vretour;
}
