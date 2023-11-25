import 'package:builder_mhrs/manager/color/colorManager.dart';
import 'package:builder_mhrs/manager/img/imgManager.dart';
import 'package:builder_mhrs/manager/img/simplyAugment.dart';
import 'package:builder_mhrs/manager/img/simplyRaw.dart';
import 'package:builder_mhrs/manager/text/color.dart';
import 'package:builder_mhrs/manager/widget/filter/getCheckbox.dart';
import 'package:builder_mhrs/manager/widget/printStatSimply.dart';
import 'package:builder_mhrs/object/weapon/Arc.dart';
import 'package:builder_mhrs/object/weapon/Arme.dart';
import 'package:builder_mhrs/object/weapon/fusarbalete/FusarbaleteLeger.dart';
import 'package:builder_mhrs/object/weapon/fusarbalete/FusarbaleteLourd.dart';
import 'package:builder_mhrs/object/weapon/tranchant/GrandeEpee.dart';
import 'package:builder_mhrs/object/weapon/tranchant/Lance.dart';
import 'package:builder_mhrs/object/weapon/tranchant/Lancecanon.dart';
import 'package:builder_mhrs/object/weapon/tranchant/Marteau.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ListViewScreen extends StatefulWidget {
  final Arme w;
  const ListViewScreen(
    this.w, {
    Key? key,
  }) : super(key: key);

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  @override
  Widget build(BuildContext context) {
    Arme w = widget.w;

    return Card(
        color: getSecondary(),
        child: Column(children: [
          checkboxAugment(
              Arme.augments
                  ? AppLocalizations.of(context)!.tActive
                  : AppLocalizations.of(context)!.tDesactive,
              Arme.augments, () {
            setState(() {
              Arme.augments = !Arme.augments;
            });
          }),
          Card(
              color: getThird(),
              child: Column(children: [
                Center(child: boldBlack(AppLocalizations.of(context)!.recap)),
                const Divider(color: Colors.black),
                if (w is Fusarbalete || w is Arc)
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    simplyRecap(
                        statBlack(getAttaque(), getValueAttActive().toString()))
                  ]),
                if ((w.idElement != 0 && w.idElement <= 5) && w is Tranchant)
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        simplyRecap(statBlack(
                            getAttaque(), getValueAttActive().toString())),
                        simplyRecap(statBlack(element(w.idElement),
                            getValueElemActive().toString()))
                      ]),
                if ((w.idElement == 0 || w.idElement > 5) && w is Tranchant)
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        simplyRecap(statBlack(
                            getAttaque(), getValueAttActive().toString())),
                      ])
              ])),
          Card(
              color: getThird(),
              child: Column(children: [
                Center(child: boldBlack(AppLocalizations.of(context)!.slot)),
                const Divider(color: Colors.black),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      for (int i = 0; i < 11; i++)
                        Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            padding: const EdgeInsets.all(3),
                            child: Image.asset(getNone(),
                                fit: BoxFit.fill, width: 20, height: 20))
                    ])
              ])),
          if (Arme.augments)
            Card(
                color: getPrimary(),
                child: Column(children: [
                  Card(
                      color: getThird(),
                      child: Column(children: [
                        Center(
                            child: boldBlack(
                                AppLocalizations.of(context)!.tAttack)),
                        const Divider(color: Colors.black),
                      ])),
                  Card(
                      color: getThird(),
                      child: Column(children: [
                        Center(
                            child: boldBlack(
                                AppLocalizations.of(context)!.tAffinite)),
                        const Divider(color: Colors.black),
                      ])),
                  if (w.element != 0 && w.element >= 5)
                    Card(
                        color: getThird(),
                        child: Column(children: [
                          Center(
                              child: boldBlack(
                                  AppLocalizations.of(context)!.tElement)),
                          const Divider(color: Colors.black),
                        ])),
                  if (w.element != 0 && w.element <= 6)
                    Card(
                        color: getThird(),
                        child: Column(children: [
                          Center(
                              child: boldBlack(
                                  AppLocalizations.of(context)!.tAffliction)),
                          const Divider(color: Colors.black),
                        ])),
                  if (w is Lancecanon)
                    Card(
                        color: getThird(),
                        child: Column(children: [
                          Center(
                              child: boldBlack(
                                  AppLocalizations.of(context)!.tShelling)),
                          const Divider(color: Colors.black),
                        ])),
                  if (w is Tranchant)
                    Card(
                        color: getThird(),
                        child: Column(children: [
                          Center(
                              child: boldBlack(
                                  AppLocalizations.of(context)!.tSharp)),
                          const Divider(color: Colors.black),
                        ])),
                  if (w.slotCalamite != 3)
                    Card(
                        color: getThird(),
                        child: Column(children: [
                          Center(
                              child: boldBlack(
                                  AppLocalizations.of(context)!.tCalam)),
                          const Divider(color: Colors.black),
                        ])),
                ]))
        ]));
  }

  Container simplyRecap(Widget child) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: getFourth()),
        margin: const EdgeInsets.only(bottom: 5),
        padding: const EdgeInsets.all(3),
        child: child);
  }

  int getValueAttActive() {
    Arme w = widget.w;
    int vretour = 0;
    if (Arme.augments) {
      if (w is Fusarbalete || w is Arc) {
        if (w is FusarbaleteLeger) vretour += 10;
        if (w is Arc) vretour += 15;
        if (w is FusarbaleteLourd) vretour += 20;
      } else if (w.idElement != 0 && w.idElement <= 5) {
        vretour += 25;
      } else {
        vretour += 40;
      }
    }
    return vretour;
  }

  int getValueElemActive() {
    Arme w = widget.w;
    int vretour = 0;
    if (Arme.augments) {
      vretour += 18;
      if (w is Lancecanon || w is Lance) {
        vretour += 21;
      }
      if (w is GrandeEpee || w is Marteau) {
        vretour += 30;
      }
    }
    return vretour;
  }
}
