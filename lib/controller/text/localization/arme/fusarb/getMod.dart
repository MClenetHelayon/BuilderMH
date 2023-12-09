import 'package:builder_mhrs/model/weapon/Arme.dart';
import 'package:builder_mhrs/model/weapon/fusarbalete/FusarbaleteLeger.dart';
import 'package:builder_mhrs/model/weapon/fusarbalete/FusarbaleteLourd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String getMod(int id, Fusarbalete w, BuildContext context) {
  String vretour = AppLocalizations.of(context)!.none;
  if (w is FusarbaleteLeger) {
    if (id == 1) {
      vretour = AppLocalizations.of(context)!.modSilencieux;
    }
    if (id == 2) {
      vretour = AppLocalizations.of(context)!.modCanonLong;
    }
  }
  if (w is FusarbaleteLourd) {
    if (id == 1) {
      vretour = AppLocalizations.of(context)!.modBouclier;
    }
    if (id == 2) {
      vretour = AppLocalizations.of(context)!.modCanonPower;
    }
  }

  return vretour;
}
