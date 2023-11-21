import 'package:builder_mhrs/manager/color/colorManager.dart';
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
import '../manager/textManager.dart';
import '../manager/weaponManager.dart';
import '../object/armor/Bras.dart';
import '../object/armor/Casque.dart';
import '../object/armor/Ceinture.dart';
import '../object/armor/Jambe.dart';
import '../object/armor/Plastron.dart';
import '../object/weapon/tranchant/CornedeChasse.dart';
import '../object/weapon/tranchant/Insectoglaive.dart';
import '../provider/app_state.dart';

import '../object/Stuff.dart';
import '../object/weapon/Arme.dart';
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
      backgroundColor: getSecondary(),
      body: Column(children: [
        Expanded(
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

  Widget Weapon(BuildContext context) {
    return Card(
        color: getPrimary(),
        child: Column(children: [
          TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(getPrimary())),
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
              child: Column(children: [
                Table(columnWidths: const <int, TableColumnWidth>{
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
                                  "${AppLocalizations.of(context)!.rarete}${s.weapon.rarete}",
                                  style: TextStyle(color: getFourth()),
                                ),
                            ])),
                    valueWeapon(s.weapon, context)
                  ]),
                ]),
                if (openWeapon)
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Column(children: [
                      if (s.weapon.niveau == "maitre")
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            white("Transcendance"),
                            Card(
                                child: TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        getPrimary()),
                              ),
                              onPressed:
                                  () {} /*async {
          var value = await popupTranscendance(context);
          if (value == null || value == this.weapon) return;
          setState(() => this.weapon = value);
        }*/
                              ,
                              child: white("-/-/-/-/-/-"),
                            ))
                          ],
                        ),
                      if (s.weapon.niveau == "maitre")
                        Container(
                            margin: const EdgeInsets.all(10.0),
                            child: s.weapon.slotCalamite != 0
                                ? Column(children: [
                                    white(AppLocalizations.of(context)!
                                        .calamJowel),
                                    CalamJowel(s.weapon.slotCalamite,
                                        s.weapon.categorie, context)
                                  ])
                                : Container()),
                      joyau(s.weapon, s, _reloadMainPage, context),
                      if (s.weapon is CorneDeChasse)
                        corne(s.weapon as CorneDeChasse, context),
                    ]),
                  ]),
              ])),
        ]));
  }

  Widget Insect(BuildContext context) {
    return Card(
        child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(getPrimary()),
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
            ])));
  }

  Widget Flor(BuildContext context) {
    return Card(
        child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(getPrimary()),
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
                      Text(s.florelet.name,
                          style: TextStyle(
                              color: getFifth(), fontWeight: FontWeight.bold)),
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
        child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(getPrimary()),
            ),
            onPressed: () async {
              var value = await pop.charm(context);
              if (value == null || value == s.charm) return;
              setState(() {
                s.charm = value;
                Talisman.listJoyaux.clear();
              });
            },
            child: Column(children: [
              Table(columnWidths: const <int, TableColumnWidth>{
                0: FixedColumnWidth(60),
                1: FlexColumnWidth(),
              }, children: [
                TableRow(children: [
                  icon(7, true),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(
                        margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Text(AppLocalizations.of(context)!.tali,
                            style: TextStyle(
                                color: getFifth(),
                                fontWeight: FontWeight.bold)))
                  ])
                ]),
              ]),
              if (openCharm)
                Column(children: [
                  Container(
                      margin: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TalisTalent(s.charm, context),
                          ])),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    TalisJoyau(s.charm, s, _reloadMainPage, context),
                  ])
                ])
            ])));
  }

  Widget CalamJowel(int slot, String categ, BuildContext context) {
    return Card(
      color: getPrimary(),
      child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(getPrimary()),
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
            white(s.joyauxCalam.id != 0 && s.joyauxCalam.id != 9999
                ? "${s.joyauxCalam.name} [${s.joyauxCalam.slot}]"
                : s.joyauxCalam.name),
          ])),
    );
  }

  Widget Helmet(BuildContext context) {
    return Card(
        child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(getPrimary()),
            ),
            onPressed: () async {
              var value = await pop.armor(context, 0);
              if (value == null || value as Casque == s.helmet) return;
              setState(() {
                s.helmet = value;
                Casque.listJoyaux.clear();
              });
            },
            child: Column(children: [
              Table(columnWidths: const <int, TableColumnWidth>{
                0: FixedColumnWidth(60),
                1: FlexColumnWidth(),
              }, children: [
                TableRow(children: [
                  Column(children: [
                    icon(1, true),
                    white(
                        "${AppLocalizations.of(context)!.rarete}${s.helmet.rarete}"),
                  ]),
                  armorTopInfo(s.helmet)
                ]),
              ]),
              if (openHelmet) armorTalent(s.helmet, context),
              if (openHelmet)
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  armorSlot(s.helmet, context,
                      armorSlotCasque(s.helmet, s, _reloadMainPage, context))
                ])
            ])));
  }

  Widget Torso(BuildContext context) {
    return Card(
        child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(getPrimary()),
            ),
            onPressed: () async {
              var value = await pop.armor(context, 1);
              if (value == null || value as Plastron == s.torso) return;
              setState(() {
                s.torso = value;
                Plastron.listJoyaux.clear();
              });
            },
            child: Column(children: [
              Table(columnWidths: const <int, TableColumnWidth>{
                0: FixedColumnWidth(60),
                1: FlexColumnWidth(),
              }, children: [
                TableRow(children: [
                  Column(children: [
                    icon(2, true),
                    white(
                        "${AppLocalizations.of(context)!.rarete}${s.torso.rarete}"),
                  ]),
                  armorTopInfo(s.torso)
                ]),
              ]),
              if (openChest) armorTalent(s.torso, context),
              if (openChest)
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  armorSlot(s.torso, context,
                      armorSlotCasque(s.torso, s, _reloadMainPage, context))
                ])
            ])));
  }

  Widget Gant(BuildContext context) {
    return Card(
        child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(getPrimary()),
            ),
            onPressed: () async {
              var value = await pop.armor(context, 2);
              if (value == null || value as Bras == s.gant) return;

              setState(() {
                s.gant = value;
                Bras.listJoyaux.clear();
              });
            },
            child: Column(children: [
              Table(columnWidths: const <int, TableColumnWidth>{
                0: FixedColumnWidth(60),
                1: FlexColumnWidth(),
              }, children: [
                TableRow(children: [
                  Column(children: [
                    icon(3, true),
                    white(
                        "${AppLocalizations.of(context)!.rarete}${s.gant.rarete}"),
                  ]),
                  armorTopInfo(s.gant)
                ]),
              ]),
              if (openGant) armorTalent(s.gant, context),
              if (openGant)
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  armorSlot(s.gant, context,
                      armorSlotCasque(s.gant, s, _reloadMainPage, context))
                ])
            ])));
  }

  Widget Boucle(BuildContext context) {
    return Card(
        child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(getPrimary()),
            ),
            onPressed: () async {
              var value = await pop.armor(context, 3);
              if (value == null || value as Ceinture == s.boucle) return;
              setState(() {
                s.boucle = value;
                Ceinture.listJoyaux.clear();
              });
            },
            child: Column(children: [
              Table(columnWidths: const <int, TableColumnWidth>{
                0: FixedColumnWidth(60),
                1: FlexColumnWidth(),
              }, children: [
                TableRow(children: [
                  Column(children: [
                    icon(4, true),
                    white(
                        "${AppLocalizations.of(context)!.rarete}${s.boucle.rarete}"),
                  ]),
                  armorTopInfo(s.boucle)
                ]),
              ]),
              if (openBoucle) armorTalent(s.boucle, context),
              if (openBoucle)
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  armorSlot(s.boucle, context,
                      armorSlotCasque(s.boucle, s, _reloadMainPage, context))
                ])
            ])));
  }

  Widget Pied(BuildContext context) {
    return Card(
        child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(getPrimary()),
            ),
            onPressed: () async {
              var value = await pop.armor(context, 4);
              if (value == null || value as Jambiere == s.pied) return;
              setState(() {
                s.pied = value;
                Jambiere.listJoyaux.clear();
              });
            },
            child: Column(children: [
              Table(columnWidths: const <int, TableColumnWidth>{
                0: FixedColumnWidth(60),
                1: FlexColumnWidth(),
              }, children: [
                TableRow(children: [
                  Column(children: [
                    icon(5, true),
                    white(
                        "${AppLocalizations.of(context)!.rarete}${s.pied.rarete}"),
                  ]),
                  armorTopInfo(s.pied)
                ]),
              ]),
              if (openLeg) armorTalent(s.pied, context),
              if (openLeg)
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  armorSlot(s.pied, context,
                      armorSlotCasque(s.pied, s, _reloadMainPage, context))
                ])
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
