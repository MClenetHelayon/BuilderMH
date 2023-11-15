import 'package:builder_mhrs/object/weapon/Arme.dart';
import 'package:builder_mhrs/object/weapon/fusarbalete/FusarbaleteLourd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../object/weapon/fusarbalete/FusarbaleteLeger.dart';

String getTirSpe(Fusarbalete w, BuildContext context) {
  String vretour = '';
  if (w is FusarbaleteLeger) {
    vretour = AppLocalizations.of(context)!.lbgTirSpe;
  }
  if (w is FusarbaleteLourd) {
    if (w.tirSpe == 0) {
      vretour = AppLocalizations.of(context)!.hbgTirSpe1;
    }
    if (w.tirSpe == 1) {
      vretour = AppLocalizations.of(context)!.hbgTirSpe2;
    }
  }
  return vretour;
}
