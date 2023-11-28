import 'package:builder_mhrs/manager/color/colorManager.dart';
import 'package:builder_mhrs/manager/img/imgManager.dart';
import 'package:builder_mhrs/manager/img/simplyAugment.dart';
import 'package:builder_mhrs/manager/logic/calculSlotAugment.dart';
import 'package:builder_mhrs/manager/mh/weapon/augment/AugmentManager.dart';
import 'package:builder_mhrs/manager/mh/weapon/augment/slotAManager.dart';
import 'package:builder_mhrs/manager/mh/weapon/sharpManager.dart';
import 'package:builder_mhrs/manager/text/color.dart';
import 'package:builder_mhrs/manager/widget/filter/getCheckbox.dart';
import 'package:builder_mhrs/manager/widget/printStatSimply.dart';
import 'package:builder_mhrs/object/Transcendance.dart';
import 'package:builder_mhrs/object/weapon/Arme.dart';
import 'package:builder_mhrs/object/weapon/tranchant/Lancecanon.dart';
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
  Arme w = Arme.getBase();
  Transcendance t = Transcendance.getBase();

  @override
  void initState() {
    super.initState();
    w = widget.w;
    t = Arme.transcendance;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: getSecondary(),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Column(children: [
              checkboxAugment(
                  Arme.augments
                      ? AppLocalizations.of(context)!.tActive
                      : AppLocalizations.of(context)!.tDesactive,
                  Arme.augments, () {
                setState(() {
                  Arme.augments = !Arme.augments;
                  t.reset();
                });
              })
            ]),
            Column(children: [
              Card(
                  color: getThird(),
                  child: SizedBox(
                      height: 30,
                      width: 120,
                      child: Center(
                          child: boldBlack(
                              '${AppLocalizations.of(context)!.slot} ${t.slotTotal}'))))
            ])
          ]),
          recapG(),
          if (Arme.augments) setAugment()
        ]));
  }

  Widget recapG() {
    getAllValue(w);
    return Card(
        color: getThird(),
        child: Column(children: [
          Center(child: boldBlack(AppLocalizations.of(context)!.recap)),
          const Divider(color: Colors.black),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            simplyRecap(statBlack(att, "+${t.att.toString()}")),
            if (w.idElement != 0 && w.idElement <= 5)
              simplyRecap(
                  statBlack(element(w.idElement), "+${t.elem.toString()}")),
            if (t.bAffl.contains(true))
              simplyRecap(
                  statBlack(element(w.idElement), "+${t.affl.toString()}")),
            if (t.bAff.contains(true))
              simplyRecap(statBlack(aff, "+${t.aff.toString()}")),
            if (w is Tranchant)
              simplyRecap(statComboSharp(
                  getLastSharp(w as Tranchant), "+${t.sharp.toString()}")),
            if ((t.bRamp.contains(true)) && w.slotCalamite != 3)
              simplyRecap(
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.asset(slotCalam(w.slotCalamite), height: 15, width: 15),
                black(" => "),
                Image.asset(slotCalam(t.calam), height: 15, width: 15),
              ])),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            if (w is Lancecanon && t.bShell.contains(true))
              simplyRecap(black(
                  "${AppLocalizations.of(context)!.abrNivCanon} + ${t.shell.toString()}")),
          ])
        ]));
  }

  Widget setAugment() {
    return Card(
        color: getPrimary(),
        child: Column(children: [
          simplyCheckAugment(
              t.bAtt, att, 0, AppLocalizations.of(context)!.tAttack),
          simplyCheckAugment(
              t.bAff, aff, 1, AppLocalizations.of(context)!.tAffinite),
          if (w.idElement != 0 && w.idElement <= 5)
            Card(
                color: getThird(),
                child: Column(children: [
                  Center(
                      child: boldBlack(AppLocalizations.of(context)!.tElement)),
                  const Divider(color: Colors.black),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(t.bElem.length - 4, (index) {
                        int value = getSlotElem(index);
                        return checkboxModAugment(
                            statBlack(elem, value.toString()),
                            t.bElem[index],
                            value,
                            t.slotTotal, () {
                          autoSelect(index, t.bElem, value);
                        });
                      })),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(t.bElem.length - 4, (index) {
                        int value = getSlotElem(index + 4);
                        return checkboxModAugment(
                            statBlack(elem, value.toString()),
                            t.bElem[index + 4],
                            value,
                            t.slotTotal, () {
                          autoSelect(index + 4, t.bElem, value);
                        });
                      }))
                ])),
          if (w.idElement != 0 && w.idElement >= 6)
            simplyCheckAugment(
                t.bAffl, affl, 3, AppLocalizations.of(context)!.tAffliction),
          if (w is Lancecanon)
            simplyCheckAugment(
                t.bShell, shell, 4, AppLocalizations.of(context)!.tShelling),
          if (w is Tranchant)
            simplyCheckAugment(
                t.bSharp, sharp, 5, AppLocalizations.of(context)!.tSharp),
          if (w.slotCalamite != 3)
            Card(
                color: getThird(),
                child: Column(children: [
                  Center(
                      child: boldBlack(AppLocalizations.of(context)!.tCalam)),
                  const Divider(color: Colors.black),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(t.bRamp.length, (index) {
                        if (w.slotCalamite != 1 && index == 1) {
                          return const SizedBox();
                        } else {
                          int value = getSlotRamp(index);
                          return checkboxModAugment(
                              statBlack(ramp, value.toString()),
                              t.bRamp[index],
                              value,
                              t.slotTotal, () {
                            autoSelect(index, t.bRamp, value);
                          });
                        }
                      }))
                ])),
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

  Card simplyCheckAugment(List<bool> b, String img, int i, String txt) {
    return Card(
        color: getThird(),
        child: Column(children: [
          Center(child: boldBlack(txt)),
          const Divider(color: Colors.black),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(b.length, (index) {
                int value = 0;
                switch (i) {
                  case 0:
                    value = getSlotAtt(index);
                    break;
                  case 1:
                    value = getSlotAff(index);
                    break;
                  case 2:
                    value = getSlotElem(index);
                    break;
                  case 3:
                    value = getSlotAffl(index);
                    break;
                  case 4:
                    value = getSlotShelling(index);
                    break;
                  case 5:
                    value = getSlotSharp(index);
                    break;
                }
                return checkboxModAugment(statBlack(img, value.toString()),
                    b[index], value, t.slotTotal, () {
                  autoSelect(index, b, value);
                });
              }))
        ]));
  }

  void autoSelect(int i, List<bool> b, int empla) {
    setState(() {
      if (!b[i]) {
        for (int j = 0; j <= i; j++) {
          b[j] = true;
        }
      } else {
        for (int j = 0; j < b.length; j++) {
          b[j] = false;
        }
      }
      t.slotTotal = calculSlotAugment(t);
      t.notOverflow();
    });
  }
}
