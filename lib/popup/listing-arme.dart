import 'dart:async';
import 'dart:convert';
import 'package:builder_mhrs/manager/imgManager.dart';
import 'package:builder_mhrs/manager/local/fusarb/getRechargement.dart';
import 'package:builder_mhrs/manager/local/fusarb/getRecul.dart';
import 'package:builder_mhrs/manager/weapon/ammoManager.dart';
import 'package:builder_mhrs/manager/weapon/bowManager.dart';
import 'package:builder_mhrs/object/weapon/fusarbalete/FusarbaleteLourd.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:builder_mhrs/object/weapon/Arme.dart';
import 'package:builder_mhrs/object/Stuff.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import '../manager/local/arc/getTypeBarrage.dart';
import '../manager/local/cbTypeFiole.dart';
import '../manager/local/fusarb/getDeviation.dart';
import '../manager/local/glTypeCanon.dart';
import '../manager/local/saTypeFiole.dart';
import '../manager/sharpManager.dart';
import '../object/Musique.dart';
import '../object/weapon/Arc.dart';
import '../object/weapon/fusarbalete/FusarbaleteLeger.dart';
import '../object/weapon/tranchant/CornedeChasse.dart';
import '../object/weapon/tranchant/EpeeBouclier.dart';
import '../object/weapon/tranchant/Insectoglaive.dart';
import '../object/weapon/tranchant/Katana.dart';
import '../object/weapon/tranchant/LameDouble.dart';
import '../object/weapon/tranchant/Lance.dart';
import '../object/weapon/tranchant/Lancecanon.dart';
import '../object/weapon/tranchant/Marteau.dart';
import '../object/weapon/tranchant/MorphoHache.dart';
import '../object/weapon/tranchant/VoltoHache.dart';
import '../object/weapon/tranchant/GrandeEpee.dart';

class ListViewScreen extends StatefulWidget {
  final Stuff s;
  final BuildContext context;
  const ListViewScreen(
    this.s,
    this.context, {
    Key? key,
  }) : super(key: key);

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<Arme> lweapons = [];
  List<Musique> lmusic = [];
  bool showExpertWeapons = true,
      showMaitreWeapons = true,
      gsCheck = false,
      lsCheck = false,
      snsCheck = false,
      dbCheck = false,
      mrtoCheck = false,
      hhCheck = false,
      lncCheck = false,
      glCheck = false,
      saCheck = false,
      cbCheck = false,
      igCheck = false,
      arcCheck = false,
      lbgCheck = false,
      hbgCheck = false;

  @override
  void initState() {
    super.initState();
    loadWeapons();
  }

  Future<String> loadGSData() async {
    return await rootBundle.loadString('database/mhrs/weapon/gs.json');
  }

  Future<String> loadLSData() async {
    return await rootBundle.loadString('database/mhrs/weapon/ls.json');
  }

  Future<String> loadSNSData() async {
    return await rootBundle.loadString('database/mhrs/weapon/sns.json');
  }

  Future<String> loadDBData() async {
    return await rootBundle.loadString('database/mhrs/weapon/db.json');
  }

  Future<String> loadMRTOData() async {
    return await rootBundle.loadString('database/mhrs/weapon/mrto.json');
  }

  Future<String> loadHHData() async {
    return await rootBundle.loadString('database/mhrs/weapon/hh.json');
  }

  Future<String> loadMusicData() async {
    return await rootBundle.loadString('database/mhrs/weapon/musique.json');
  }

  Future<String> loadLNCData() async {
    return await rootBundle.loadString('database/mhrs/weapon/lnc.json');
  }

  Future<String> loadGLData() async {
    return await rootBundle.loadString('database/mhrs/weapon/gl.json');
  }

  Future<String> loadSAData() async {
    return await rootBundle.loadString('database/mhrs/weapon/sa.json');
  }

  Future<String> loadCBData() async {
    return await rootBundle.loadString('database/mhrs/weapon/cb.json');
  }

  Future<String> loadIGData() async {
    return await rootBundle.loadString('database/mhrs/weapon/ig.json');
  }

  Future<String> loadARCData() async {
    return await rootBundle.loadString('database/mhrs/weapon/arc.json');
  }

  Future<String> loadLBGData() async {
    return await rootBundle.loadString('database/mhrs/weapon/lbg.json');
  }

  Future<String> loadHBGData() async {
    return await rootBundle.loadString('database/mhrs/weapon/hbg.json');
  }

  Future<String> loadSkillData() async {
    return await rootBundle.loadString('database/mhrs/skill.json');
  }

  Future<void> loadWeapons() async {
    String local = Localizations.localeOf(widget.context).languageCode;
    String skillJsonText = await loadSkillData();
    List<dynamic> skillList = json.decode(skillJsonText);
    String jsonTextGS = await loadGSData();
    List<dynamic> jsonResponseGS = json.decode(jsonTextGS);
    String jsonTextLS = await loadLSData();
    List<dynamic> jsonResponseLS = json.decode(jsonTextLS);
    String jsonTextSNS = await loadSNSData();
    List<dynamic> jsonResponseSNS = json.decode(jsonTextSNS);
    String jsonTextDB = await loadDBData();
    List<dynamic> jsonResponseDB = json.decode(jsonTextDB);
    String jsonTextMRTO = await loadMRTOData();
    List<dynamic> jsonResponseMRTO = json.decode(jsonTextMRTO);
    String jsonTextHH = await loadHHData();
    List<dynamic> jsonResponseHH = json.decode(jsonTextHH);
    String jsonTextMusic = await loadMusicData();
    List<dynamic> jsonResponseMusic = json.decode(jsonTextMusic);
    String jsonTextLNC = await loadLNCData();
    List<dynamic> jsonResponseLNC = json.decode(jsonTextLNC);
    String jsonTextGL = await loadGLData();
    List<dynamic> jsonResponseGL = json.decode(jsonTextGL);
    String jsonTextSA = await loadSAData();
    List<dynamic> jsonResponseSA = json.decode(jsonTextSA);
    String jsonTextCB = await loadCBData();
    List<dynamic> jsonResponseCB = json.decode(jsonTextCB);
    String jsonTextIG = await loadIGData();
    List<dynamic> jsonResponseIG = json.decode(jsonTextIG);
    String jsonTextARC = await loadARCData();
    List<dynamic> jsonResponseARC = json.decode(jsonTextARC);
    String jsonTextLBG = await loadLBGData();
    List<dynamic> jsonResponseLBG = json.decode(jsonTextLBG);
    String jsonTextHBG = await loadHBGData();
    List<dynamic> jsonResponseHBG = json.decode(jsonTextHBG);
    setState(() {
      lweapons += jsonResponseGS
          .map((weapons) => GrandeEpee.fromJson(weapons, skillList, local))
          .toList();
      lweapons += jsonResponseLS
          .map((weapons) => Katana.fromJson(weapons, skillList, local))
          .toList();
      lweapons += jsonResponseSNS
          .map((weapons) => EpeeBouclier.fromJson(weapons, skillList, local))
          .toList();
      lweapons += jsonResponseDB
          .map((weapons) => LameDouble.fromJson(weapons, skillList, local))
          .toList();
      lweapons += jsonResponseMRTO
          .map((weapons) => Marteau.fromJson(weapons, skillList, local))
          .toList();
      lmusic += jsonResponseMusic
          .map((music) => Musique.fromJson(music, local))
          .toList();
      lweapons += jsonResponseHH
          .map((weapons) =>
              CorneDeChasse.fromJson(weapons, skillList, lmusic, local))
          .toList();
      lweapons += jsonResponseLNC
          .map((weapons) => Lance.fromJson(weapons, skillList, local))
          .toList();
      lweapons += jsonResponseGL
          .map((weapons) => Lancecanon.fromJson(weapons, skillList, local))
          .toList();
      lweapons += jsonResponseSA
          .map((weapons) => MorphoHache.fromJson(weapons, skillList, local))
          .toList();
      lweapons += jsonResponseCB
          .map((weapons) => VoltoHache.fromJson(weapons, skillList, local))
          .toList();
      lweapons += jsonResponseIG
          .map((weapons) => Insectoglaive.fromJson(weapons, skillList, local))
          .toList();
      lweapons += jsonResponseARC
          .map((weapons) => Arc.fromJson(weapons, skillList, local))
          .toList();
      lweapons += jsonResponseLBG
          .map(
              (weapons) => FusarbaleteLeger.fromJson(weapons, skillList, local))
          .toList();
      lweapons += jsonResponseHBG
          .map(
              (weapons) => FusarbaleteLourd.fromJson(weapons, skillList, local))
          .toList();
    });
  }

  List<Arme> getFilteredWeapons() {
    List<Arme> filteredWeapons = [];
    List<Arme> filteredCategWeapons = [];
    filteredCategWeapons.add(Arme.getBase());
    if (showExpertWeapons) {
      filteredWeapons.addAll(
          lweapons.where((weapons) => weapons.niveau == 'expert').toList());
    }
    if (showMaitreWeapons) {
      filteredWeapons.addAll(
          lweapons.where((weapons) => weapons.niveau == 'maitre').toList());
    }
    // Filtrer les armes par type avant de les ajouter à filteredCategWeapons
    if (gsCheck) {
      filteredWeapons.whereType<GrandeEpee>().forEach(filteredCategWeapons.add);
    }
    if (lsCheck) {
      filteredWeapons.whereType<Katana>().forEach(filteredCategWeapons.add);
    }
    if (snsCheck) {
      filteredWeapons
          .whereType<EpeeBouclier>()
          .forEach(filteredCategWeapons.add);
    }
    if (dbCheck) {
      filteredWeapons.whereType<LameDouble>().forEach(filteredCategWeapons.add);
    }
    if (mrtoCheck) {
      filteredWeapons.whereType<Marteau>().forEach(filteredCategWeapons.add);
    }
    if (hhCheck) {
      filteredWeapons
          .whereType<CorneDeChasse>()
          .forEach(filteredCategWeapons.add);
    }
    if (lncCheck) {
      filteredWeapons.whereType<Lance>().forEach(filteredCategWeapons.add);
    }
    if (glCheck) {
      filteredWeapons.whereType<Lancecanon>().forEach(filteredCategWeapons.add);
    }
    if (saCheck) {
      filteredWeapons
          .whereType<MorphoHache>()
          .forEach(filteredCategWeapons.add);
    }
    if (cbCheck) {
      filteredWeapons.whereType<VoltoHache>().forEach(filteredCategWeapons.add);
    }
    if (igCheck) {
      filteredWeapons
          .whereType<Insectoglaive>()
          .forEach(filteredCategWeapons.add);
    }
    if (arcCheck) {
      filteredWeapons.whereType<Arc>().forEach(filteredCategWeapons.add);
    }
    if (lbgCheck) {
      filteredWeapons
          .whereType<FusarbaleteLeger>()
          .forEach(filteredCategWeapons.add);
    }
    if (hbgCheck) {
      filteredWeapons
          .whereType<FusarbaleteLourd>()
          .forEach(filteredCategWeapons.add);
    }
    return filteredCategWeapons;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.black,
        child: Column(children: [
          Card(
              color: Colors.grey,
              margin: const EdgeInsets.all(5),
              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                          child: SizedBox(
                        width: 100, // Définissez une largeur appropriée ici
                        child: CheckboxListTile(
                          title: const Text('RC'),
                          value: showExpertWeapons,
                          onChanged: (checked) {
                            setState(() {
                              showExpertWeapons = checked ?? false;
                            });
                          },
                        ),
                      )),
                      Card(
                        child: SizedBox(
                          width: 100, // Définissez une largeur appropriée ici
                          child: CheckboxListTile(
                            title: const Text('RM'),
                            value: showMaitreWeapons,
                            onChanged: (checked) {
                              setState(() {
                                showMaitreWeapons = checked ?? false;
                              });
                            },
                          ),
                        ),
                      )
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Card(
                                      color: Colors.grey,
                                      child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              resetBoolean();
                                              gsCheck = !gsCheck;
                                            });
                                          },
                                          child: checkboxArme(
                                              "images/arme/GreatSword.png",
                                              gsCheck))),
                                  Card(
                                      color: Colors.grey,
                                      child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              resetBoolean();
                                              lsCheck = !lsCheck;
                                            });
                                          },
                                          child: checkboxArme(
                                              "images/arme/LongSword.png",
                                              lsCheck))),
                                  Card(
                                      color: Colors.grey,
                                      child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              resetBoolean();
                                              snsCheck = !snsCheck;
                                            });
                                          },
                                          child: checkboxArme(
                                              "images/arme/SwordNShield.png",
                                              snsCheck))),
                                  Card(
                                      color: Colors.grey,
                                      child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              resetBoolean();
                                              dbCheck = !dbCheck;
                                            });
                                          },
                                          child: checkboxArme(
                                              "images/arme/DualBlades.png",
                                              dbCheck))),
                                  Card(
                                      color: Colors.grey,
                                      child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              resetBoolean();
                                              mrtoCheck = !mrtoCheck;
                                            });
                                          },
                                          child: checkboxArme(
                                              "images/arme/Hammer.png",
                                              mrtoCheck))),
                                  Card(
                                      color: Colors.grey,
                                      child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              resetBoolean();
                                              hhCheck = !hhCheck;
                                            });
                                          },
                                          child: checkboxArme(
                                              "images/arme/HuntingHorn.png",
                                              hhCheck))),
                                  Card(
                                      color: Colors.grey,
                                      child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              resetBoolean();
                                              lncCheck = !lncCheck;
                                            });
                                          },
                                          child: checkboxArme(
                                              "images/arme/Lance.png",
                                              lncCheck))),
                                ]),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Card(
                                      color: Colors.grey,
                                      child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              resetBoolean();
                                              glCheck = !glCheck;
                                            });
                                          },
                                          child: checkboxArme(
                                              "images/arme/Gunlance.png",
                                              glCheck))),
                                  Card(
                                      color: Colors.grey,
                                      child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              resetBoolean();
                                              saCheck = !saCheck;
                                            });
                                          },
                                          child: checkboxArme(
                                              "images/arme/SwitchAxe.png",
                                              saCheck))),
                                  Card(
                                      color: Colors.grey,
                                      child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              resetBoolean();
                                              cbCheck = !cbCheck;
                                            });
                                          },
                                          child: checkboxArme(
                                              "images/arme/ChargeBlade.png",
                                              cbCheck))),
                                  Card(
                                      color: Colors.grey,
                                      child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              resetBoolean();
                                              igCheck = !igCheck;
                                            });
                                          },
                                          child: checkboxArme(
                                              "images/arme/InsectGlaive.png",
                                              igCheck))),
                                  Card(
                                      color: Colors.grey,
                                      child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              resetBoolean();
                                              arcCheck = !arcCheck;
                                            });
                                          },
                                          child: checkboxArme(
                                              "images/arme/Bow.png",
                                              arcCheck))),
                                  Card(
                                      color: Colors.grey,
                                      child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              resetBoolean();
                                              lbgCheck = !lbgCheck;
                                            });
                                          },
                                          child: checkboxArme(
                                              "images/arme/LightBowGun.png",
                                              lbgCheck))),
                                  Card(
                                      color: Colors.grey,
                                      child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              resetBoolean();
                                              hbgCheck = !hbgCheck;
                                            });
                                          },
                                          child: checkboxArme(
                                              "images/arme/HeavyBowGun.png",
                                              hbgCheck))),
                                ])
                          ])
                    ])
              ])),
          Expanded(
              child: ListView.builder(
                  itemCount: getFilteredWeapons().length,
                  itemBuilder: (context, index) {
                    Arme weapon = getFilteredWeapons()[index];
                    if (index != 0) {
                      return Card(
                          margin: const EdgeInsets.only(
                              top: 5, left: 10, right: 10),
                          child: TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<
                                        Color>(
                                    const Color.fromARGB(255, 255, 255, 255)),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop(weapon);
                              },
                              child: ListTile(
                                  title: Center(
                                      child: Text(
                                    weapon.name,
                                  )),
                                  leading: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            height: 22,
                                            width: 22,
                                            margin: const EdgeInsets.only(
                                                right: 8, bottom: 2),
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(arme(
                                                        weapon.categorie))))),
                                        Text('R${weapon.rarete}'),
                                      ]),
                                  subtitle: Column(children: [
                                    Center(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                          statOff(
                                              "images/elementaire/Attaque.webp",
                                              weapon.attaque),
                                          statOff(
                                              "images/elementaire/Affinite.webp",
                                              weapon.affinite),
                                          if (weapon is LameDouble &&
                                              weapon.idElement2 != 0)
                                            statDoubleElem(
                                                element(weapon.idElement),
                                                weapon.element,
                                                element(weapon.idElement2),
                                                weapon.element2)
                                          else if (weapon.idElement != 0)
                                            statElem(element(weapon.idElement),
                                                weapon.element),
                                          statOff(
                                              "images/elementaire/Defense.png",
                                              weapon.defense)
                                        ])),
                                    Center(
                                        child: Column(children: [
                                      Text(
                                          AppLocalizations.of(context)!.joyaux),
                                      printSlotJowel(weapon)
                                    ])),
                                    Center(
                                        child: Column(children: [
                                      if (weapon.slotCalamite != 0)
                                        Text(
                                            "${AppLocalizations.of(context)!.calam} : ${weapon.slotCalamite}")
                                    ])),
                                    if (weapon is Tranchant)
                                      Center(
                                        child: sharpStat(weapon),
                                      ),
                                    if (weapon is CorneDeChasse)
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(children: [
                                              Text(
                                                  "${AppLocalizations.of(context)!.music} :"),
                                              Text(weapon.musique[0].name),
                                              Text('${weapon.musique[1].name}'),
                                              Text('${weapon.musique[2].name}'),
                                            ])
                                          ]),
                                    if (weapon is Lancecanon)
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(children: [
                                              Text(
                                                  '${getTypeCanon(weapon.typeCanon, context)} ${weapon.niveauCanon}'),
                                            ])
                                          ]),
                                    if (weapon is MorphoHache)
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(children: [
                                              weapon.valueFiole != 0
                                                  ? Text(
                                                      '${getSaFiole(weapon.typeFiole, context)} ${weapon.valueFiole}')
                                                  : Text(getSaFiole(
                                                      weapon.typeFiole,
                                                      context))
                                            ])
                                          ]),
                                    if (weapon is VoltoHache)
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(children: [
                                              Text(getCbFiole(
                                                  weapon.typeFiole, context))
                                            ])
                                          ]),
                                    if (weapon is Insectoglaive)
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(children: [
                                              Text(
                                                  '${AppLocalizations.of(context)!.kinsectLvl} : ${weapon.niveauKinsect}'),
                                            ])
                                          ]),
                                    if (weapon is Fusarbalete)
                                      Column(
                                          children: [
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                children: [
                                                  Column(children: [
                                                    Text(
                                                        "${AppLocalizations.of(context)!.recul} : ${getRecul(
                                                        weapon.recul, context)}"),
                                                   /* Text(getRecul(
                                                        weapon.recul, context))*/
                                                  ]),
                                                  Column(children: [
                                                    Text(
                                                        "${AppLocalizations.of(context)!.devia} :"),
                                                    Text(weapon.puissanceDeviation !=
                                                            0
                                                        ? '${getDeviation(weapon.sensDeviation, context)} ${getValueDeviation(weapon.puissanceDeviation, context)}'
                                                        : getDeviation(
                                                            weapon
                                                                .sensDeviation,
                                                            context))
                                                  ]),
                                                  Column(children: [
                                                    /*Text(
                                                    "${AppLocalizations.of(context)!.recharge} :"),*/
                                                    Text(getRechargement(
                                                        weapon.rechargement,
                                                        context))
                                                  ])
                                                ]),
                                            Text(AppLocalizations.of(context)!
                                                .mun),
                                            blockMunListing(weapon, context)
                                          ]),
                                    if (weapon is Arc)
                                      Column(
                                        children: [
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Column(children: [
                                                  Text(
                                                      "${AppLocalizations.of(context)!.barrage} : ${getTypeBarrage(weapon.barrage, context)} "),
                                                ])
                                              ]),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              typeShootListing(weapon, context),
                                              coatingListing(weapon, context)
                                            ],
                                          )
                                        ],
                                      ),
                                    /*if (weapon.talent.id != -1)
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        if (weapon.talent.id != 9999)
                                          Column(children: [
                                            const Text("Talent"),
                                            Text(
                                                "${weapon.talent.name} +${weapon.talent.level}"),
                                          ])
                                      ],
                                    )*/
                                  ]))));
                    } else {
                      return Card(
                          margin: const EdgeInsets.only(
                              top: 5, left: 10, right: 10),
                          child: TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<
                                        Color>(
                                    const Color.fromARGB(255, 255, 255, 255)),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop(weapon);
                              },
                              child: ListTile(
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      weapon.name,
                                    ),
                                  ],
                                ),
                              )));
                    }
                  }))
        ]));
  }

  Widget checkboxArme(String img, bool check) {
    return Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(img),
          ),
          borderRadius: BorderRadius.circular(5),
          color: check
              ? const Color.fromARGB(148, 207, 25, 25)
              : Colors.transparent
        ));
  }

  Widget printSlotJowel(Arme weapon) {
    Widget vretour = const Text('- / - / -');
    if (weapon.slots.isNotEmpty) {
      Row(children: [
        for (int i = 0; i < 3; i++)
          Container(
            margin: const EdgeInsets.only(right: 8),
            child: Text(
              weapon.slots.length > i
                  ? i != 2 || weapon.slots.length > i + 1
                      ? '${weapon.slots[i].toString()} /'
                      : weapon.slots[i].toString()
                  : i != 2
                      ? '- /'
                      : '-',
            ),
          ),
      ]);
    }
    return vretour;
  }

  Widget statOff(String image, int value) {
    return Row(
      children: [
        Image.asset(image, height: 16, width: 16),
        const SizedBox(width: 5),
        Text(value.toString()),
      ],
    );
  }

  Widget statElem(String image, int value) {
    return Row(
      children: [
        Image.asset(image, height: 16, width: 16),
        const SizedBox(width: 5),
        Text("$value"),
      ],
    );
  }

  Widget statDoubleElem(String image, int value, String image2, int value2) {
    return Row(
      children: [
        Image.asset(image, height: 16, width: 16),
        const SizedBox(width: 5),
        Text(value.toString()),
        const Text("/"),
        Image.asset(image2, height: 16, width: 16),
        const SizedBox(width: 5),
        Text(value2.toString()),
      ],
    );
  }

  resetBoolean() {
    gsCheck = false;
    lsCheck = false;
    snsCheck = false;
    dbCheck = false;
    mrtoCheck = false;
    hhCheck = false;
    lncCheck = false;
    glCheck = false;
    saCheck = false;
    cbCheck = false;
    igCheck = false;
    arcCheck = false;
    lbgCheck = false;
    hbgCheck = false;
  }
}
