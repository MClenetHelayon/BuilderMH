import 'package:builder_mhrs/manager/color/colorManager.dart';
import 'package:builder_mhrs/manager/color/colorSharp.dart';
import 'package:builder_mhrs/manager/logic/calculSharp.dart';
import 'package:builder_mhrs/manager/text/color.dart';
import 'package:builder_mhrs/manager/text/tranchant.dart';
import 'package:builder_mhrs/object/Stuff.dart';
import 'package:builder_mhrs/object/weapon/Arme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget sharpStat(Tranchant sharp) {
  return Container(
      padding: const EdgeInsets.all(2),
      color: const Color.fromARGB(255, 45, 45, 45),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [superColoring(4, sharp)]),
          if (sharp.sharpBoost.isNotEmpty)
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  containerSimplyStat(7, 3, sharp.sharpBoost[0]),
                  containerSimplyStat(7, 3, sharp.sharpBoost[1]),
                  containerSimplyStat(7, 3, sharp.sharpBoost[2]),
                  containerSimplyStat(7, 3, sharp.sharpBoost[3]),
                  containerSimplyStat(7, 3, sharp.sharpBoost[4]),
                ])
        ],
      ));
}

Widget sharpG(Stuff s, BuildContext context) {
  Tranchant sharp = s.weapon as Tranchant;
  s.setSharpRaw(getBoostRaw(s));
  s.setSharpElem(getBoostElem(s));
  return Container(
      margin: const EdgeInsets.all(5),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            color: getSecondary(),
            child: IntrinsicWidth(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  superColoring(2, sharp),
                  if (sharp.sharpBoost.isNotEmpty)
                    containerSimplyStat(
                        s.nbSavoirFaire >= 1 ? 15 : 7, 5, sharp.sharpBoost[0]),
                  if (sharp.sharpBoost.isNotEmpty)
                    containerSimplyStat(
                        s.nbSavoirFaire >= 2 ? 15 : 7, 5, sharp.sharpBoost[1]),
                  if (sharp.sharpBoost.isNotEmpty)
                    containerSimplyStat(
                        s.nbSavoirFaire >= 3 ? 15 : 7, 5, sharp.sharpBoost[2]),
                  if (sharp.sharpBoost.isNotEmpty)
                    containerSimplyStat(
                        s.nbSavoirFaire >= 4 ? 15 : 7, 5, sharp.sharpBoost[3]),
                  if (sharp.sharpBoost.isNotEmpty)
                    containerSimplyStat(
                        s.nbSavoirFaire >= 5 ? 15 : 7, 5, sharp.sharpBoost[4]),
                ],
              ),
            )),
        white(listTranchant(s)),
        white("${AppLocalizations.of(context)!.sharpRaw} : x${s.sharpRaw}"),
        white("${AppLocalizations.of(context)!.sharpElem} : x${s.sharpElem}"),
      ]));
}

Widget superColoring(int i, Tranchant sharp) {
  return Row(children: [
    coloring(sharp.rouge, i, 1),
    coloring(sharp.orange, i, 2),
    coloring(sharp.jaune, i, 3),
    coloring(sharp.vert, i, 4),
    coloring(sharp.bleu, i, 5),
    coloring(sharp.blanc, i, 6),
    coloring(sharp.violet, i, 7),
  ]);
}

Widget coloring(int sharp, int divide, int i) {
  return Container(
    height: 15,
    width: sharp.toDouble() / divide,
    color: couleur(i),
  );
}

Widget containerSimplyStat(double h, double w, int i) {
  return Container(
    margin: const EdgeInsets.only(left: 0.5),
    height: h,
    width: w,
    color: couleur(i),
  );
}