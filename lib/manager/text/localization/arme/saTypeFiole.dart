import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


//retourne le nom de la fiole de la morpho hache en fonction de son id
String getSaFiole(int id, BuildContext context) {
  String vretour = '';
  switch (id) {
    case 0:
      vretour = AppLocalizations.of(context)!.fForce;
      break;
    case 1:
      vretour = AppLocalizations.of(context)!.fElement;
      break;
    case 2:
      vretour = AppLocalizations.of(context)!.fPoison;
      break;
    case 3:
      vretour = AppLocalizations.of(context)!.fPara;
      break;
    case 4:
      vretour = AppLocalizations.of(context)!.fFaiblesse;
      break;
    case 5:
      vretour = AppLocalizations.of(context)!.fDraco;
      break;
  }
  return vretour;
}
