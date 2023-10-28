import 'package:builder_mhrs/manager/weapon/bowManager.dart';
import 'package:builder_mhrs/provider/stuff_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:async';
import 'dart:convert';

import '../manager/armorManager.dart';
import '../manager/florManager.dart';
import '../manager/imgManager.dart';
import '../manager/popupManager.dart' as pop;
import '../manager/sharpManager.dart';
import '../manager/statManager.dart';
import '../manager/textManager.dart';
import '../manager/weaponManager.dart';
import '../object/weapon/Arc.dart';
import '../object/weapon/tranchant/CornedeChasse.dart';
import '../object/weapon/tranchant/Insectoglaive.dart';
import '../provider/app_state.dart';

import '../object/Stuff.dart';
import '../object/weapon/Arme.dart';
import '../object/Armure.dart';
import '../object/Florelet.dart';
import '../object/Joyau.dart';
import '../object/JoyauCalam.dart';
import '../object/Talisman.dart';
import '../object/Kinsect.dart';

class BuilderPage extends StatefulWidget {
  const BuilderPage({super.key});

  @override
  State<BuilderPage> createState() => _BuilderPageState();
}

class _BuilderPageState extends State<BuilderPage> {
  Stuff s = Stuff(
      Casque.getBase(),
      Plastron.getBase(),
      Bras.getBase(),
      Ceinture.getBase(),
      Jambiere.getBase(),
      Talisman.getBase(),
      Arme.getBase(),
      JoyauxCalam.getBase(),
      Florelet.getBase(),
      Kinsect.getBase());

  bool openGStat = true,
      openWeapon = true,
      openHelmet = true,
      openChest = true,
      openGant = true,
      openBoucle = true,
      openLeg = true,
      openPetalas = true,
      openCharm = true,
      openKinsect = true,
      openSkill = false,
      reload = false;

  @override
  void initState() {
    super.initState();
    loadJowel();
  }

  Future<String> loadJowelData() async {
    return await rootBundle.loadString('database/mhrs/jowel.json');
  }

  Future<String> loadSkillData() async {
    return await rootBundle.loadString('database/mhrs/skill.json');
  }

  Future<void> loadJowel() async {
    String jsonTextJoyau = await loadJowelData();
    List<dynamic> jsonResponseJoyau = json.decode(jsonTextJoyau);
    String skillJsonText = await loadSkillData();
    List<dynamic> skillList = json.decode(skillJsonText);
    setState(() {
      Stuff.ljowel = jsonResponseJoyau
          .map((jowel) => Joyaux.fromJson(jowel, skillList, Stuff.local))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    Stuff.local = Provider.of<AppState>(context).currentLocale.languageCode;
    final stuffProvider = Provider.of<StuffProvider>(context);
    s = stuffProvider.stuff!;
    s.getListTalents();
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Column(children: [
        RecapStat(context),
        Expanded(
            //flex: 2,
            child: SingleChildScrollView(
                child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Weapon(context),
                if (s.weapon is Insectoglaive) Insect(context),
                Helmet(context),
                Torso(context),
                Gant(context),
                Boucle(context),
                Pied(context),
                Charm(context),
                Flor(context),
              ],
            ),
          )
        ])))
      ]),
    );
  }

  Widget RecapStat(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
            color: Colors.deepOrange,
            child: Column(children: [
              Card(
                  color: Colors.black,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(left: 8.0),
                            child: title(AppLocalizations.of(context)!.stat)),
                        IconButton(
                            icon: const Icon(Icons.close, color: Colors.white),
                            onPressed: () {
                              setState(() {
                                openGStat = !openGStat;
                                openSkill = !openGStat;
                              });
                            })
                      ])),
              if (openGStat) g(s, context),
              Card(
                  color: Colors.black,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(left: 8.0),
                            child:
                                title(AppLocalizations.of(context)!.talents)),
                        IconButton(
                            icon: const Icon(Icons.close, color: Colors.white),
                            onPressed: () {
                              setState(() {
                                openSkill = !openSkill;
                              });
                            })
                      ])),
              if (openSkill && s.weapon.niveau == "maitre")
                calamJowel(s, context),
              if (openSkill) recapTalent(s, context),
            ])));
  }

  Widget Weapon(BuildContext context) {
    return Card(
        color: Colors.black,
        child: Column(children: [
          TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              onPressed: () async {
                var value = await pop.arme(context, s);
                if (value == null || value == s.weapon) return;
                setState(() {
                  s.weapon = value;
                  s.joyauxCalam = JoyauxCalam.getBase();
                  Arme.listJoyaux.clear();
                  if (s.weapon is Tranchant) {
                    s.sharpRaw = getBoostRaw(s);
                    s.sharpElem = getBoostElem(s);
                  } else {
                    s.sharpRaw = 1;
                    s.sharpElem = 1;
                  }
                });
              },
              child: Table(columnWidths: const <int, TableColumnWidth>{
                0: FixedColumnWidth(70),
                1: FlexColumnWidth(),
              }, children: [
                TableRow(children: [
                  Container(
                      margin: const EdgeInsets.only(right: 10.0, top: 5.0),
                      width: 60,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            icon(0, false),
                            if (openWeapon)
                              Text(
                                  "${AppLocalizations.of(context)!.rarete} ${s.weapon.rarete}"),
                          ])),
                  valueWeapon(s.weapon, context)
                ]),
                if (openWeapon)
                  TableRow(children: [
                    Container(),
                    Column(children: [
                      if (s.weapon.niveau == "maitre")
                        Container(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text("Transcendance"),
                            Card(
                                child: TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                              ),
                              onPressed:
                                  () {} /*async {
          var value = await popupTranscendance(context);
          if (value == null || value == this.weapon) return;
          setState(() => this.weapon = value);
        }*/
                              ,
                              child: const Text("-/-/-/-/-/-"),
                            ))
                          ],
                        )),
                      if (s.weapon.niveau == "maitre")
                        Container(
                            margin: const EdgeInsets.all(10.0),
                            child: s.weapon.slotCalamite != 0
                                ? Column(children: [
                                    Text(AppLocalizations.of(context)!
                                        .calamJowel),
                                    CalamJowel(s.weapon.slotCalamite,
                                        s.weapon.categorie, context)
                                  ])
                                : Container()),
                      joyau(s.weapon, s, _reloadMainPage, context),
                      if (s.weapon is CorneDeChasse)
                        corne(s.weapon as CorneDeChasse, context),
                      if (s.weapon is Arc) arc((s.weapon as Arc), s, context),
                    ]),
                  ]),
              ])),
        ]));
  }

  Widget Insect(BuildContext context) {
    return Card(
        color: Colors.black,
        margin: const EdgeInsets.only(bottom: 10.0, top: 10.0),
        child: Column(children: [
          title(AppLocalizations.of(context)!.insect),
          Card(
              child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                  onPressed: () async {
                    var value = await pop.kinsect(
                        context, (s.weapon as Insectoglaive).niveauKinsect);
                    if (value == null || value == s.kinsect) return;
                    setState(() {
                      s.kinsect = value;
                    });
                  },
                  child: Table(columnWidths: const <int, TableColumnWidth>{
                    0: FixedColumnWidth(50),
                    1: FlexColumnWidth(),
                  }, children: [
                    TableRow(children: [
                      Container(
                          margin: const EdgeInsets.only(right: 10.0, top: 5.0),
                          height: 40,
                          width: 40,
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  openKinsect = !openKinsect;
                                });
                              },
                              icon: Image.asset(
                                'images/arme/kinsect.png',
                                height: 100,
                                width: 100,
                              ))),
                      StatKinsect(s)
                    ]),
                    TableRow(children: [
                      Container(),
                      Container(
                          child: Column(
                              children: [Row(children: []), Row(children: [])]))
                    ])
                  ])))
        ]));
  }

  Widget Flor(BuildContext context) {
    return Card(
        child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
            onPressed: () async {
              var value = await pop.flor(context);
              if (value == null || value == s.florelet) return;
              setState(() {
                s.florelet = value;
              });
            },
            child: Table(columnWidths: const <int, TableColumnWidth>{
              0: FixedColumnWidth(60),
              1: FlexColumnWidth(),
            }, children: [
              TableRow(children: [
                icon(6, true),
                Container(
                    margin: const EdgeInsets.all(10.0),
                    child: Column(children: [
                      Container(
                        child: Text(s.florelet.name),
                      ),
                      if (openPetalas) flor(s.florelet, context)
                    ]))
              ])
            ])));
  }

  Widget Charm(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        color: Colors.black,
        child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
            onPressed: () async {
              var value = await pop.charm(context);
              if (value == null || value == s.charm) return;
              setState(() {
                s.charm = value;
                Talisman.listJoyaux.clear();
              });
            },
            child: Table(columnWidths: const <int, TableColumnWidth>{
              0: FixedColumnWidth(60),
              1: FlexColumnWidth(),
            }, children: [
              TableRow(children: [
                icon(7, true),
                Container(
                    margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Column(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(bottom: 20.0),
                            child: Text(AppLocalizations.of(context)!.tali)),
                        if (openCharm)
                          Table(columnWidths: const <int, TableColumnWidth>{
                            0: FlexColumnWidth(),
                            1: FlexColumnWidth(),
                          }, children: [
                            TableRow(children: [
                              TalisTalent(s.charm, context),
                              TalisJoyau(s.charm, s, _reloadMainPage, context),
                            ])
                          ])
                      ],
                    )),
              ]),
            ])));
  }

  Widget CalamJowel(int slot, String categ, BuildContext context) {
    return Card(
      child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
          ),
          onPressed: () async {
            var value = await pop.calamJoyau(context, slot, categ);
            if (value == null || value == s.joyauxCalam) {
              return;
            }
            setState(() {
              s.joyauxCalam = value;
            });
          },
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(slotCalam(slot), height: 22, width: 22),
            const SizedBox(width: 5),
            Text(s.joyauxCalam.id != 0 && s.joyauxCalam.id != 9999
                ? "${s.joyauxCalam.name} [${s.joyauxCalam.slot}]"
                : s.joyauxCalam.name),
          ])),
    );
  }

  Widget Helmet(BuildContext context) {
    return Card(
        child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
            onPressed: () async {
              var value = await pop.armor(context, 0);
              if (value == null || value as Casque == s.helmet) return;
              setState(() {
                s.helmet = value;
                Casque.listJoyaux.clear();
              });
            },
            child: Table(columnWidths: const <int, TableColumnWidth>{
              0: FixedColumnWidth(60),
              1: FlexColumnWidth(),
            }, children: [
              TableRow(children: [icon(1, true), armorTopInfo(s.helmet)]),
              if (openHelmet) armorRarityTalent(s.helmet, context),
              if (openHelmet)
                armorSlot(s.helmet, context,
                    armorSlotCasque(s.helmet, s, _reloadMainPage, context))
            ])));
  }

  Widget Torso(BuildContext context) {
    return Card(
        child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
            onPressed: () async {
              var value = await pop.armor(context, 1);
              if (value == null || value as Plastron == s.torso) return;
              setState(() {
                s.torso = value;
                Plastron.listJoyaux.clear();
              });
            },
            child: Table(columnWidths: const <int, TableColumnWidth>{
              0: FixedColumnWidth(60),
              1: FlexColumnWidth(),
            }, children: [
              TableRow(children: [icon(2, true), armorTopInfo(s.torso)]),
              if (openChest) armorRarityTalent(s.torso, context),
              if (openChest)
                armorSlot(s.torso, context,
                    armorSlotPlastron(s.torso, s, _reloadMainPage, context))
            ])));
  }

  Widget Gant(BuildContext context) {
    return Card(
        child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
            onPressed: () async {
              var value = await pop.armor(context, 2);
              if (value == null || value as Bras == s.gant) return;

              setState(() {
                s.gant = value;
                Bras.listJoyaux.clear();
              });
            },
            child: Table(columnWidths: const <int, TableColumnWidth>{
              0: FixedColumnWidth(60),
              1: FlexColumnWidth(),
            }, children: [
              TableRow(children: [icon(3, true), armorTopInfo(s.gant)]),
              if (openGant) armorRarityTalent(s.gant, context),
              if (openGant)
                armorSlot(s.gant, context,
                    armorSlotBras(s.gant, s, _reloadMainPage, context))
            ])));
  }

  Widget Boucle(BuildContext context) {
    return Card(
        child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
            onPressed: () async {
              var value = await pop.armor(context, 3);
              if (value == null || value as Ceinture == s.boucle) return;
              setState(() {
                s.boucle = value;
                Ceinture.listJoyaux.clear();
              });
            },
            child: Table(columnWidths: const <int, TableColumnWidth>{
              0: FixedColumnWidth(60),
              1: FlexColumnWidth(),
            }, children: [
              TableRow(children: [icon(4, true), armorTopInfo(s.boucle)]),
              if (openBoucle) armorRarityTalent(s.boucle, context),
              if (openBoucle)
                armorSlot(s.boucle, context,
                    armorSlotCeinture(s.boucle, s, _reloadMainPage, context))
            ])));
  }

  Widget Pied(BuildContext context) {
    return Card(
        child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
            onPressed: () async {
              var value = await pop.armor(context, 4);
              if (value == null || value as Jambiere == s.pied) return;
              setState(() {
                s.pied = value;
                Jambiere.listJoyaux.clear();
              });
            },
            child: Table(columnWidths: const <int, TableColumnWidth>{
              0: FixedColumnWidth(60),
              1: FlexColumnWidth(),
            }, children: [
              TableRow(children: [icon(5, true), armorTopInfo(s.pied)]),
              if (openLeg) armorRarityTalent(s.pied, context),
              if (openLeg)
                armorSlot(s.pied, context,
                    armorSlotJambiere(s.pied, s, _reloadMainPage, context))
            ])));
  }

  Widget icon(int i, bool isArmor) {
    return IconButton(
        onPressed: () {
          changeOpen(i);
        },
        iconSize: 60,
        icon: Container(
            margin: const EdgeInsets.only(
              right: 10.0,
            ),
            child: Image.asset(
              isArmor ? armure(i) : arme(s.weapon.categorie),
              fit: BoxFit.fill,
            )));
  }

  void _reloadMainPage() {
    setState(() {
      reload = true;
    });
  }

  changeOpen(int i) async {
    switch (i) {
      case 0:
        setState(() {
          openWeapon = !openWeapon;
        });
      case 1:
        setState(() {
          openHelmet = !openHelmet;
        });
      case 2:
        setState(() {
          openChest = !openChest;
        });
      case 3:
        setState(() {
          openGant = !openGant;
        });
      case 4:
        setState(() {
          openBoucle = !openBoucle;
        });
      case 5:
        setState(() {
          openLeg = !openLeg;
        });
      case 6:
        setState(() {
          openPetalas = !openPetalas;
        });
      case 7:
        setState(() {
          openCharm = !openCharm;
        });
    }
  }
}
