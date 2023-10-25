import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../object/Stuff.dart';
import '../object/ITranchant.dart';
import 'statManager.dart';
import 'textManager.dart';

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
            children: [
              superColoring(4, sharp),
            ],
          ),
          if (sharp.sharpBoost.length != 0)
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
            color: const Color.fromARGB(255, 45, 45, 45),
            child: IntrinsicWidth(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  superColoring(2, sharp),
                  if (sharp.sharpBoost.length != 0)
                    containerSimplyStat(
                        s.nbSavoirFaire >= 1 ? 15 : 7, 5, sharp.sharpBoost[0]),
                  if (sharp.sharpBoost.length != 0)
                    containerSimplyStat(
                        s.nbSavoirFaire >= 2 ? 15 : 7, 5, sharp.sharpBoost[1]),
                  if (sharp.sharpBoost.length != 0)
                    containerSimplyStat(
                        s.nbSavoirFaire >= 3 ? 15 : 7, 5, sharp.sharpBoost[2]),
                  if (sharp.sharpBoost.length != 0)
                    containerSimplyStat(
                        s.nbSavoirFaire >= 4 ? 15 : 7, 5, sharp.sharpBoost[3]),
                  if (sharp.sharpBoost.length != 0)
                    containerSimplyStat(
                        s.nbSavoirFaire >= 5 ? 15 : 7, 5, sharp.sharpBoost[4]),
                ],
              ),
            )),
        listTranchant(s),
        const Divider(
          color: Colors.black,
        ),
        blue("${AppLocalizations.of(context)!.sharpRaw} : x${s.sharpRaw}"),
        blue("${AppLocalizations.of(context)!.sharpElem} : x${s.sharpElem}"),
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

Color couleur(int i) {
  switch (i) {
    case 1:
      return const Color.fromARGB(
        255,
        190,
        56,
        67,
      );
    case 2:
      return const Color.fromARGB(
        255,
        211,
        103,
        61,
      );
    case 3:
      return const Color.fromARGB(
        255,
        201,
        178,
        50,
      );
    case 4:
      return const Color.fromARGB(
        255,
        129,
        176,
        52,
      );
    case 5:
      return const Color.fromARGB(
        255,
        58,
        88,
        215,
      );
    case 6:
      return const Color.fromARGB(
        255,
        226,
        226,
        226,
      );
    case 7:
      return const Color.fromARGB(
        255,
        136,
        90,
        236,
      );
    default:
      return const Color.fromARGB(255, 45, 45, 45);
  }
}

double getBoostRaw(Stuff s) {
  List<int> allSharp = allIntSharp(s);
  double vretour = 0;
  if (allSharp[0] != 0) vretour = 0.50;
  if (allSharp[1] != 0) vretour = 0.75;
  if (allSharp[2] != 0) vretour = 1.00;
  if (allSharp[3] != 0) vretour = 1.05;
  if (allSharp[4] != 0) vretour = 1.20;
  if (allSharp[5] != 0) vretour = 1.32;
  if (allSharp[6] != 0) vretour = 1.39;
  return vretour;
}

double getBoostElem(Stuff s) {
  List<int> allSharp = allIntSharp(s);
  double vretour = 0;
  if (allSharp[0] != 0) vretour = 0.25;
  if (allSharp[1] != 0) vretour = 0.50;
  if (allSharp[2] != 0) vretour = 0.75;
  if (allSharp[3] != 0) vretour = 1.00;
  if (allSharp[4] != 0) vretour = 1.0625;
  if (allSharp[5] != 0) vretour = 1.15;
  if (allSharp[6] != 0) vretour = 1.25;
  return vretour;
}
