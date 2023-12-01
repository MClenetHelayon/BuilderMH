import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//retourne le nom de la fiole de la volto hache en fonction de son id
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
