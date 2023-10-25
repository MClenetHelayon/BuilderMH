import 'package:builder_mhrs/object/Arme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


String getTirSpe(Arme w, BuildContext context) {
  String vretour = '';
  if(w is FusarbaleteLeger){
    vretour = AppLocalizations.of(context)!.lbgTirSpe;
  }
  return vretour;
}