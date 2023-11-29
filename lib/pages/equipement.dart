import 'package:builder_mhrs/manager/mh/armor/armorManager.dart';
import 'package:builder_mhrs/manager/color/colorManager.dart';
import 'package:builder_mhrs/manager/mh/armor/florManager.dart';
import 'package:builder_mhrs/manager/img/imgManager.dart';
import 'package:builder_mhrs/manager/logic/calculSharp.dart';
import 'package:builder_mhrs/manager/text/color.dart';
import 'package:builder_mhrs/manager/mh/weapon/weaponManager.dart';
import 'package:builder_mhrs/manager/popupManager.dart' as pop;
import 'package:builder_mhrs/manager/text/slotAugment.dart';
import 'package:builder_mhrs/manager/util/convertIconInInt.dart';
import 'package:builder_mhrs/manager/widget/filter/getCombobox.dart';
import 'package:builder_mhrs/object/Florelet.dart';
import 'package:builder_mhrs/object/Joyau.dart';
import 'package:builder_mhrs/object/JoyauCalam.dart';
import 'package:builder_mhrs/object/Kinsect.dart';
import 'package:builder_mhrs/object/Stuff.dart';
import 'package:builder_mhrs/object/Talisman.dart';
import 'package:builder_mhrs/object/armor/Armure.dart';
import 'package:builder_mhrs/object/armor/Bras.dart';
import 'package:builder_mhrs/object/armor/Casque.dart';
import 'package:builder_mhrs/object/armor/Ceinture.dart';
import 'package:builder_mhrs/object/armor/Jambe.dart';
import 'package:builder_mhrs/object/armor/Plastron.dart';
import 'package:builder_mhrs/object/weapon/Arme.dart';
import 'package:builder_mhrs/object/weapon/tranchant/Insectoglaive.dart';
import 'package:builder_mhrs/provider/app_state.dart';
import 'package:builder_mhrs/provider/stuff_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:async';
import 'dart:convert';

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
  String txtAugment = "";
  @override
  void initState() {
    super.initState();
    loadJowel();
  }

  Future<void> loadJowel() async {
    String jsonTextJoyau =
        await rootBundle.loadString('database/mhrs/jowel.json');
    List<dynamic> jsonResponseJoyau = json.decode(jsonTextJoyau);
    String skillJsonText =
        await rootBundle.loadString('database/mhrs/skill.json');
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
      backgroundColor: secondary,
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
        color: primary,
        child: Column(children: [
          TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(primary)),
              onPressed: () async {
                var value = await pop.arme(context, s);
                if (value == null || value == s.weapon) return;
                setState(() {
                  s.weapon = value;
                  s.joyauxCalam = JoyauxCalam.getBase();
                  Arme.listJoyaux.clear();
                  Arme.augments = false;
                  Arme.transcendance.fullReset();
                  txtAugment = txtListAugment(s.weapon);
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
                                white(
                                    "${AppLocalizations.of(context)!.rarete}${s.weapon.rarete}")
                            ])),
                    valueWeapon(s.weapon, context)
                  ])
                ]),
                if (openWeapon)
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Column(children: [
                      if (s.weapon.niveau == "maitre")
                        Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              white(AppLocalizations.of(context)!.trans),
                              Card(
                                  child: TextButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  primary)),
                                      onPressed: () async {
                                        await pop.transcendance(
                                            context, s.weapon);
                                        setState(() {
                                          txtAugment = txtListAugment(s.weapon);
                                        });
                                      },
                                      child: white(txtAugment)))
                            ]),
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
                      if (s.weapon is Fusarbalete)
                        comboModFusar(s.weapon as Fusarbalete, context,
                            (int? newValue) {
                          setState(() {
                            (s.weapon as Fusarbalete).mod = newValue!;
                          });
                        })
                    ])
                  ])
              ]))
        ]));
  }

  Widget Insect(BuildContext context) {
    return Card(
        child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(primary),
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
              1: FlexColumnWidth()
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
                        icon: Image.asset('images/arme/kinsect.png',
                            height: 100, width: 100))),
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
              backgroundColor: MaterialStateProperty.all<Color>(primary),
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
                      boldOrange(s.florelet.name),
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
              backgroundColor: MaterialStateProperty.all<Color>(primary),
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
                        child: boldOrange(AppLocalizations.of(context)!.tali))
                  ])
                ])
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
    if (Arme.augments) {
      if (Arme.transcendance.calam != 0) slot = Arme.transcendance.calam;
    }
    return Card(
        color: primary,
        child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(primary),
            ),
            onPressed: () async {
              var value = await pop.calamJoyau(context, slot, categ);
              if (value == null || value == s.joyauxCalam) return;
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
            ])));
  }

  Widget Helmet(BuildContext context) {
    return simplyArmor(context, s.helmet, openHelmet,
        armorSlotCasque(s.helmet, s, _reloadMainPage, context), () async {
      var value = await pop.armor(context, 0);
      if (value == null || value as Casque == s.helmet) return;
      setState(() {
        s.helmet = value;
        Casque.listJoyaux.clear();
      });
    });
  }

  Widget Torso(BuildContext context) {
    return simplyArmor(context, s.torso, openChest,
        armorSlotPlastron(s.torso, s, _reloadMainPage, context), () async {
      var value = await pop.armor(context, 1);
      if (value == null || value as Plastron == s.torso) return;
      setState(() {
        s.torso = value;
        Plastron.listJoyaux.clear();
      });
    });
  }

  Widget Gant(BuildContext context) {
    return simplyArmor(context, s.gant, openGant,
        armorSlotBras(s.gant, s, _reloadMainPage, context), () async {
      var value = await pop.armor(context, 2);
      if (value == null || value as Bras == s.gant) return;
      setState(() {
        s.gant = value;
        Bras.listJoyaux.clear();
      });
    });
  }

  Widget Boucle(BuildContext context) {
    return simplyArmor(context, s.boucle, openBoucle,
        armorSlotCeinture(s.boucle, s, _reloadMainPage, context), () async {
      var value = await pop.armor(context, 3);
      if (value == null || value as Ceinture == s.boucle) return;
      setState(() {
        s.boucle = value;
        Ceinture.listJoyaux.clear();
      });
    });
  }

  Widget Pied(BuildContext context) {
    return simplyArmor(context, s.pied, openLeg,
        armorSlotJambiere(s.pied, s, _reloadMainPage, context), () async {
      var value = await pop.armor(context, 4);
      if (value == null || value as Jambiere == s.pied) return;
      setState(() {
        s.pied = value;
        Jambiere.listJoyaux.clear();
      });
    });
  }

  Card simplyArmor(BuildContext context, Armure a, bool open, Widget slot,
      void Function() reload) {
    return Card(
        child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(primary),
            ),
            onPressed: reload,
            child: Column(children: [
              Table(columnWidths: const <int, TableColumnWidth>{
                0: FixedColumnWidth(60),
                1: FlexColumnWidth(),
              }, children: [
                TableRow(children: [
                  Column(children: [
                    icon(convertIconInt(a), true),
                    if (open)
                      white(
                          "${AppLocalizations.of(context)!.rarete}${a.rarete}"),
                  ]),
                  armorTopInfo(a)
                ])
              ]),
              if (open) armorTalent(a, context),
              if (open)
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [armorSlot(a, context, slot)])
            ])));
  }

  Widget icon(int i, bool isArmor) {
    return IconButton(
        onPressed: () {
          changeOpen(i);
        },
        iconSize: 60,
        icon: Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: Image.asset(isArmor ? armure(i) : arme(s.weapon.categorie),
                fit: BoxFit.fill)));
  }

  void _reloadMainPage() {
    setState(() {
      reload = true;
    });
  }

  void changeOpen(int i) async {
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
