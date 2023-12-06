import 'package:builder_mhrs/manager/color/colorManager.dart';
import 'package:builder_mhrs/manager/color/colorScroll.dart';
import 'package:builder_mhrs/manager/color/colorStat.dart';
import 'package:builder_mhrs/manager/img/consommable.dart';
import 'package:builder_mhrs/manager/text/color.dart';
import 'package:builder_mhrs/manager/widget/cardListManager.dart';
import 'package:builder_mhrs/object/Consommable.dart';
import 'package:builder_mhrs/object/Stuff.dart';
import 'package:builder_mhrs/object/Talent.dart';
import 'package:builder_mhrs/provider/stuff_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class BoostPage extends StatefulWidget {
  const BoostPage({Key? key}) : super(key: key);

  @override
  State<BoostPage> createState() => _BoostPageState();
}

class _BoostPageState extends State<BoostPage> {
  bool skillOpen = true, consoOpen = false, attackOrDef = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final stuffProvider = Provider.of<StuffProvider>(context, listen: false);
    Stuff s = stuffProvider.stuff!;
    Consommable c = Stuff.consommable;
    return Scaffold(
        backgroundColor: secondary,
        body: Column(children: [
          GestureDetector(
              onTap: () {
                setState(() {
                  skillOpen = !skillOpen;
                });
              },
              child: Card(
                  margin: const EdgeInsets.all(5),
                  color: primary,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: const EdgeInsets.all(5),
                            child: boldOrange(
                                AppLocalizations.of(context)!.boost)),
                        Container(
                            height: 30,
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: third),
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    Stuff.scroll = !Stuff.scroll;
                                  });
                                },
                                child: Row(children: [
                                  boldBlack(
                                      AppLocalizations.of(context)!.scroll),
                                  const SizedBox(width: 3),
                                  Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              width: 1, color: sixth),
                                          color:
                                              Stuff.scroll ? scrollO : scrollB))
                                ])))
                      ]))),
          GestureDetector(
              onTap: () {
                setState(() {
                  consoOpen = !consoOpen;
                });
              },
              child: Card(
                  margin: const EdgeInsets.all(5),
                  color: primary,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(
                                left: 5, top: 10, bottom: 10),
                            child: boldOrange(
                                AppLocalizations.of(context)!.conso)),
                        Container(
                            height: 30,
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: third),
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    attackOrDef = !attackOrDef;
                                  });
                                },
                                child: Row(children: [
                                  boldBlack(attackOrDef
                                      ? AppLocalizations.of(context)!.att
                                      : AppLocalizations.of(context)!.def),
                                  const SizedBox(width: 3),
                                  Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              width: 1, color: sixth),
                                          color:
                                              attackOrDef ? attack : defense))
                                ])))
                      ]))),
          Expanded(
              child: SingleChildScrollView(
                  child: Column(children: [
            if (skillOpen)
              Card(
                  color: primary,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(s.getAllTalents().entries.length,
                          (index) {
                        Talent t =
                            s.getAllTalents().entries.elementAt(index).key;
                        return Card(
                            color: third,
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    t.actif = !t.actif;
                                  });
                                },
                                child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: third),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              margin: const EdgeInsets.all(5),
                                              child: black(t.name)),
                                          Card(
                                              color: fifth,
                                              margin: const EdgeInsets.all(5),
                                              child: Container(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: boldBlack(
                                                      t.actif ? "On" : "Off")))
                                        ]))));
                      }))),
            if (consoOpen)
              Card(
                  color: primary,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (attackOrDef)
                          getCardConsommable(
                              AppLocalizations.of(context)!.consoGriffeAtt,
                              c.griffeA,
                              griffeA, () {
                            setState(() {
                              c.griffeA = !c.griffeA;
                            });
                          }),
                        if (!attackOrDef)
                          getCardConsommable(
                              AppLocalizations.of(context)!.consoGriffeDef,
                              c.griffeD,
                              griffeD, () {
                            setState(() {
                              c.griffeD = !c.griffeD;
                            });
                          }),
                        if (attackOrDef)
                          getCardConsommable(
                              AppLocalizations.of(context)!.consoCharmAtt,
                              c.charmA,
                              charmA, () {
                            setState(() {
                              c.charmA = !c.charmA;
                            });
                          }),
                        if (!attackOrDef)
                          getCardConsommable(
                              AppLocalizations.of(context)!.consoCharmDef,
                              c.charmD,
                              charmD, () {
                            setState(() {
                              c.charmD = !c.charmD;
                            });
                          }),
                        if (attackOrDef)
                          getCardConsommable(
                              AppLocalizations.of(context)!.consoPopoAtt,
                              c.popoA,
                              popoA, () {
                            setState(() {
                              c.popoA = !c.popoA;
                            });
                          }),
                        if (!attackOrDef)
                          getCardConsommable(
                              AppLocalizations.of(context)!.consoPopoDef,
                              c.popoD,
                              popoD, () {
                            setState(() {
                              c.popoD = !c.popoD;
                            });
                          }),
                        if (attackOrDef)
                          getCardConsommable(
                              AppLocalizations.of(context)!.consoGraineAtt,
                              c.graineA,
                              graineA, () {
                            setState(() {
                              c.graineA = !c.graineA;
                            });
                          }),
                        if (!attackOrDef)
                          getCardConsommable(
                              AppLocalizations.of(context)!.consoGraineDef,
                              c.graineD,
                              graineD, () {
                            setState(() {
                              c.graineD = !c.graineD;
                            });
                          }),
                        if (attackOrDef)
                          getCardConsommable(
                              AppLocalizations.of(context)!.consoPoudreAtt,
                              c.poudreA,
                              poudreA, () {
                            setState(() {
                              c.poudreA = !c.poudreA;
                            });
                          }),
                        if (!attackOrDef)
                          getCardConsommable(
                              AppLocalizations.of(context)!.consoPoudreDef,
                              c.poudreD,
                              poudreD, () {
                            setState(() {
                              c.poudreD = !c.poudreD;
                            });
                          })
                      ]))
          ])))
        ]));
  }
}
