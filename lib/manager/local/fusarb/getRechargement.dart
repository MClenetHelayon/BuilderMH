import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String getRechargement(int id, BuildContext context) {
  String vretour = '';
  switch (id) {
    case 1:
      vretour = AppLocalizations.of(context)!.stRecharge;
      break;
    case 2:
      vretour = AppLocalizations.of(context)!.vsRecharge;
      break;
    case 3:
      vretour = AppLocalizations.of(context)!.sRecharge;
      break;
    case 4:
      vretour = AppLocalizations.of(context)!.baRecharge;
      break;
    case 5:
      vretour = AppLocalizations.of(context)!.aRecharge;
      break;
    case 6:
      vretour = AppLocalizations.of(context)!.aaRecharge;
      break;
    case 7:
      vretour = AppLocalizations.of(context)!.fRecharge;
      break;
    case 8:
      vretour = AppLocalizations.of(context)!.vfRecharge;
      break;
    case 9:
      vretour = AppLocalizations.of(context)!.ftRecharge;
      break;
  }
  return vretour;
}
