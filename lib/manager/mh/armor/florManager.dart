import 'package:builder_mhrs/manager/img/raw.dart';
import 'package:builder_mhrs/manager/text/color.dart';
import 'package:builder_mhrs/manager/widget/printStatSimply.dart';
import 'package:builder_mhrs/object/Florelet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget flor(Florelet florelet, BuildContext context) {
  return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: Column(children: [
        partFlor(florelet.uVie, florelet.uStam, florelet.uAtt, florelet.uDef,
            AppLocalizations.of(context)!.up),
        partFlor(florelet.gVie, florelet.gStam, florelet.gAtt, florelet.gDef,
            AppLocalizations.of(context)!.gain)
      ]));
}

Widget partFlor(int vVie, int vStam, int vAtt, int vDef, String titre) {
  return Column(children: [
    Container(
        margin: const EdgeInsets.only(bottom: 10.0, top: 10.0),
        child: white(titre)),
   rowFlor(vVie, vStam, vAtt, vDef,false)
  ]);
}

Widget rowFlor(int vVie, int vStam, int vAtt, int vDef,bool img) {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    statFlor(vie, vVie,img),
    statFlor(stam, vStam,img),
    statFlor(attaque, vAtt,img),
    statFlor(def, vDef,img),
  ]);
}
