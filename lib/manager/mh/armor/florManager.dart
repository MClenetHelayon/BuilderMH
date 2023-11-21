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

Widget partFlor(int vie, int stam, int att, int def, String titre) {
  return Column(children: [
    Container(
        margin: const EdgeInsets.only(bottom: 10.0, top: 10.0),
        child: white(titre)),
    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      statFlor("images/elementaire/Vie.png", vie),
      statFlor("images/elementaire/Stam.png", stam),
      statFlor("images/elementaire/Attaque.webp", att),
      statFlor("images/elementaire/Defense.png", def),
    ])
  ]);
}
