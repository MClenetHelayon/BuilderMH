import 'package:builder_mhrs/manager/color/colorManager.dart';
import 'package:builder_mhrs/manager/color/colorSharp.dart';
import 'package:builder_mhrs/manager/logic/sharp.dart';
import 'package:builder_mhrs/manager/logic/stat.dart';
import 'package:builder_mhrs/manager/text/color.dart';
import 'package:builder_mhrs/manager/text/tranchant.dart';
import 'package:builder_mhrs/object/Stuff.dart';
import 'package:builder_mhrs/object/weapon/Arme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget sharpStat(Tranchant sharp) {
  return Container(
      padding: const EdgeInsets.all(2),
      color: secondary,
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
                    for (int i = 0; i <= 4; i++)
                      containerSimplyStat(7, 3, sharp.sharpBoost[i])
                  ])
          ]));
}

Widget sharpG(Stuff s, BuildContext context, bool img) {
  Tranchant sharp = s.weapon as Tranchant;
  s.setSharpRaw(getBoostRaw(s));
  s.setSharpElem(getBoostElem(s));
  return Container(
      margin: const EdgeInsets.all(5),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            color: secondary,
            child: IntrinsicWidth(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                  superColoring(2, sharp),
                  for (int i = 1; i <= 5; i++)
                    if (sharp.sharpBoost.isNotEmpty)
                      containerSimplyStat(s.nbSavoirFaire >= i ? 15 : 7, 5,
                          sharp.sharpBoost[(i - 1)]),
                ]))),
        img ? black(listTranchant(s)) : white(listTranchant(s)),
        img
            ? black(
                "${AppLocalizations.of(context)!.sharpRaw} : x${s.sharpRaw}")
            : white(
                "${AppLocalizations.of(context)!.sharpRaw} : x${s.sharpRaw}"),
        img
            ? black(
                "${AppLocalizations.of(context)!.sharpElem} : x${s.sharpElem}")
            : white(
                "${AppLocalizations.of(context)!.sharpElem} : x${s.sharpElem}"),
      ]));
}

Widget superColoring(int i, Tranchant sharp) {
  return Row(children: [
    coloring(sharp.rouge, i, 1),
    coloring(sharp.orange, i, 2),
    coloring(sharp.jaune, i, 3),
    coloring(sharp.vert, i, 4),
    sharp.bleu != 0 && sharp.blanc == 0 && Arme.augments
        ? coloring(sharp.bleu + Arme.transcendance.sharp, i, 5)
        : coloring(sharp.bleu, i, 5),
    sharp.blanc != 0 && sharp.violet == 0 && Arme.augments
        ? coloring(sharp.blanc + Arme.transcendance.sharp, i, 6)
        : coloring(sharp.blanc, i, 6),
    sharp.violet != 0 && Arme.augments
        ? coloring(sharp.violet + Arme.transcendance.sharp, i, 7)
        : coloring(sharp.violet, i, 7)
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

int getLastSharp(Tranchant t) {
  int vretour = 0;
  if (t.rouge != 0) vretour = 1;
  if (t.orange != 0) vretour = 2;
  if (t.jaune != 0) vretour = 3;
  if (t.vert != 0) vretour = 4;
  if (t.bleu != 0) vretour = 5;
  if (t.blanc != 0) vretour = 6;
  if (t.violet != 0) vretour = 7;
  return vretour;
}

int getValueLastSharp(Tranchant t) {
  int vretour = 0, sharp = getLastSharp(t);
  switch (sharp) {
    case 1:
      vretour = t.rouge;
      break;
    case 2:
      vretour = t.orange;
      break;
    case 3:
      vretour = t.jaune;
      break;
    case 4:
      vretour = t.vert;
      break;
    case 5:
      vretour = t.bleu;
      break;
    case 6:
      vretour = t.blanc;
      break;
    case 7:
      vretour = t.violet;
      break;
  }
  return vretour;
}

List<int> allIntSharp(Stuff s) {
  Tranchant tranch = s.weapon as Tranchant;
  int rouge = tranch.rouge,
      orange = tranch.orange,
      jaune = tranch.jaune,
      vert = tranch.vert,
      bleu = tranch.bleu,
      blanc = tranch.blanc,
      violet = tranch.violet;
  if (tranch.sharpBoost.isNotEmpty) {
    rouge += sharp(s, 1);
    orange += sharp(s, 2);
    jaune += sharp(s, 3);
    vert += sharp(s, 4);
    bleu += sharp(s, 5);
    blanc += sharp(s, 6);
    violet += sharp(s, 7);
  }
  return [rouge, orange, jaune, vert, bleu, blanc, violet];
}
