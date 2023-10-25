import 'dart:async';
import 'dart:convert';
import 'package:builder_mhrs/manager/local/fusard/getRechargement.dart';
import 'package:builder_mhrs/manager/local/fusard/getRecul.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:builder_mhrs/object/Arme.dart';
import 'package:builder_mhrs/object/ITranchant.dart';
import 'package:builder_mhrs/object/Stuff.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import '../manager/local/arc/typeTir.dart';
import '../manager/local/cbTypeFiole.dart';
import '../manager/local/fusard/getDeviation.dart';
import '../manager/local/glTypeCanon.dart';
import '../manager/local/saTypeFiole.dart';
import '../manager/sharpManager.dart';
import '../object/Musique.dart';

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
      lbgCheck = false;

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
    return filteredCategWeapons;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: Column(
        children: [
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
                                              gsCheck = !gsCheck;
                                            });
                                          },
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              image: const DecorationImage(
                                                image: AssetImage(
                                                    "images/arme/GreatSword.png"),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: gsCheck
                                                  ? const Color.fromARGB(
                                                      148, 207, 25, 25)
                                                  : Colors.transparent,
                                            ),
                                          ))),
                                  Card(
                                      color: Colors.grey,
                                      child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              lsCheck = !lsCheck;
                                            });
                                          },
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              image: const DecorationImage(
                                                image: AssetImage(
                                                    "images/arme/LongSword.png"),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: lsCheck
                                                  ? const Color.fromARGB(
                                                      148, 207, 25, 25)
                                                  : Colors.transparent,
                                            ),
                                          ))),
                                  Card(
                                      color: Colors.grey,
                                      child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              snsCheck = !snsCheck;
                                            });
                                          },
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              image: const DecorationImage(
                                                image: AssetImage(
                                                    "images/arme/SwordNShield.png"),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                              color: snsCheck
                                                  ? const Color.fromARGB(
                                                      148, 207, 25, 25)
                                                  : Colors.transparent,
                                            ),
                                          ))),
                                  Card(
                                      color: Colors.grey,
                                      child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              dbCheck = !dbCheck;
                                            });
                                          },
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              image: const DecorationImage(
                                                image: AssetImage(
                                                    "images/arme/DualBlades.png"),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: dbCheck
                                                  ? const Color.fromARGB(
                                                      148, 207, 25, 25)
                                                  : Colors.transparent,
                                            ),
                                          ))),
                                  Card(
                                      color: Colors.grey,
                                      child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              mrtoCheck = !mrtoCheck;
                                            });
                                          },
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              image: const DecorationImage(
                                                image: AssetImage(
                                                    "images/arme/Hammer.png"),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: mrtoCheck
                                                  ? const Color.fromARGB(
                                                      148, 207, 25, 25)
                                                  : Colors.transparent,
                                            ),
                                          ))),
                                  Card(
                                      color: Colors.grey,
                                      child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              hhCheck = !hhCheck;
                                            });
                                          },
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              image: const DecorationImage(
                                                image: AssetImage(
                                                    "images/arme/HuntingHorn.png"),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: hhCheck
                                                  ? const Color.fromARGB(
                                                      148, 207, 25, 25)
                                                  : Colors.transparent,
                                            ),
                                          ))),
                                  Card(
                                      color: Colors.grey,
                                      child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              lbgCheck = !lbgCheck;
                                            });
                                          },
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              image: const DecorationImage(
                                                image: AssetImage(
                                                    "images/arme/LightBowGun.png"),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: lbgCheck
                                                  ? const Color.fromARGB(
                                                      148, 207, 25, 25)
                                                  : Colors.transparent,
                                            ),
                                          ))),
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
                                              lncCheck = !lncCheck;
                                            });
                                          },
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              image: const DecorationImage(
                                                image: AssetImage(
                                                    "images/arme/Lance.png"),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: lncCheck
                                                  ? const Color.fromARGB(
                                                      148, 207, 25, 25)
                                                  : Colors.transparent,
                                            ),
                                          ))),
                                  Card(
                                      color: Colors.grey,
                                      child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              glCheck = !glCheck;
                                            });
                                          },
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              image: const DecorationImage(
                                                image: AssetImage(
                                                    "images/arme/Gunlance.png"),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: glCheck
                                                  ? const Color.fromARGB(
                                                      148, 207, 25, 25)
                                                  : Colors.transparent,
                                            ),
                                          ))),
                                  Card(
                                      color: Colors.grey,
                                      child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              saCheck = !saCheck;
                                            });
                                          },
                                          child: Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                image: const DecorationImage(
                                                  image: AssetImage(
                                                      "images/arme/SwitchAxe.png"),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: saCheck
                                                    ? const Color.fromARGB(
                                                        148, 207, 25, 25)
                                                    : Colors.transparent,
                                              )))),
                                  Card(
                                      color: Colors.grey,
                                      child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              cbCheck = !cbCheck;
                                            });
                                          },
                                          child: Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                image: const DecorationImage(
                                                  image: AssetImage(
                                                      "images/arme/ChargeBlade.png"),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: cbCheck
                                                    ? const Color.fromARGB(
                                                        148, 207, 25, 25)
                                                    : Colors.transparent,
                                              )))),
                                  Card(
                                      color: Colors.grey,
                                      child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              igCheck = !igCheck;
                                            });
                                          },
                                          child: Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                image: const DecorationImage(
                                                  image: AssetImage(
                                                      "images/arme/InsectGlaive.png"),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: igCheck
                                                    ? const Color.fromARGB(
                                                        148, 207, 25, 25)
                                                    : Colors.transparent,
                                              )))),
                                  Card(
                                      color: Colors.grey,
                                      child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              arcCheck = !arcCheck;
                                            });
                                          },
                                          child: Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                image: const DecorationImage(
                                                  image: AssetImage(
                                                      "images/arme/Bow.png"),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: arcCheck
                                                    ? const Color.fromARGB(
                                                        148, 207, 25, 25)
                                                    : Colors.transparent,
                                              )))),
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
                              backgroundColor: MaterialStateProperty.all<Color>(
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
                              leading: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        height: 22,
                                        width: 22,
                                        margin: const EdgeInsets.only(
                                            right: 8, bottom: 2),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                          image: imgArme(weapon.categorie),
                                        ))),
                                    Text('R${weapon.rarete}'),
                                  ]),
                              subtitle: Column(
                                children: [
                                  weapon is LameDouble
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                              statOff(
                                                  "images/elementaire/Attaque.webp",
                                                  weapon.attaque),
                                              statOff(
                                                  "images/elementaire/Affinite.webp",
                                                  weapon.affinite),
                                              weapon.idElement2 != 0
                                                  ? statDoubleElem(
                                                      imgElement(
                                                          weapon.idElement),
                                                      weapon.element,
                                                      imgElement(
                                                          weapon.idElement2),
                                                      weapon.element2)
                                                  : weapon.idElement != 0
                                                      ? statElem(
                                                          imgElement(
                                                              weapon.idElement),
                                                          weapon.element)
                                                      : Container(),
                                              statOff(
                                                  "images/elementaire/Defense.png",
                                                  weapon.defense),
                                            ])
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                              statOff(
                                                  "images/elementaire/Attaque.webp",
                                                  weapon.attaque),
                                              statOff(
                                                  "images/elementaire/Affinite.webp",
                                                  weapon.affinite),
                                              if (weapon.idElement != 0)
                                                statElem(
                                                    imgElement(
                                                        weapon.idElement),
                                                    weapon.element),
                                              statOff(
                                                  "images/elementaire/Defense.png",
                                                  weapon.defense),
                                            ]),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(children: [
                                        const Text("Joyau"),
                                        weapon.slots.isEmpty
                                            ? const Text('- / - / -')
                                            : Row(
                                                children: [
                                                  for (int i = 0; i < 3; i++)
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              right: 8),
                                                      child: Text(
                                                        weapon.slots.length > i
                                                            ? i != 2 ||
                                                                    weapon.slots
                                                                            .length >
                                                                        i + 1
                                                                ? '${weapon.slots[i].toString()} /'
                                                                : weapon
                                                                    .slots[i]
                                                                    .toString()
                                                            : i != 2
                                                                ? '- /'
                                                                : '-',
                                                      ),
                                                    ),
                                                ],
                                              ),
                                      ]),
                                    ],
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(children: [
                                          if (weapon.slotCalamite != 0)
                                            Text(
                                                "Calamité : ${weapon.slotCalamite}")
                                        ])
                                      ]),
                                  if (weapon is Tranchant)
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          sharpStat(weapon as Tranchant),
                                        ]),
                                  if (weapon is CorneDeChasse)
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(children: [
                                            const Text("Musique :"),
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
                                                    weapon.typeFiole, context))
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
                                  if (weapon is FusarbaleteLeger)
                                    Column(children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(getRecul(
                                                weapon.recul, context)),
                                            Text(weapon.puissanceDeviation != 0
                                                ? '${getDeviation(weapon.sensDeviation, context)} ${getValueDeviation(weapon.puissanceDeviation, context)}'
                                                : getDeviation(
                                                    weapon.sensDeviation,
                                                    context)),
                                            Text(getRechargement(
                                                weapon.rechargement, context))
                                          ]),
                                      if (weapon.normal1.isNotEmpty)
                                        Text("normal"),
                                      if (weapon.normal2.isNotEmpty)
                                        Text("normal 2"),
                                      if (weapon.normal3.isNotEmpty)
                                        Text("normal 3"),
                                      if (weapon.perfo1.isNotEmpty)
                                        Text("perforant"),
                                      if (weapon.perfo2.isNotEmpty)
                                        Text("perforant 2"),
                                      if (weapon.perfo3.isNotEmpty)
                                        Text("perforant 3"),
                                      if (weapon.grenaille1.isNotEmpty)
                                        Text("grenaille"),
                                      if (weapon.grenaille2.isNotEmpty)
                                        Text("grenaille 2"),
                                      if (weapon.grenaille3.isNotEmpty)
                                        Text("grenaille 3"),
                                      if (weapon.shrapnel1.isNotEmpty)
                                        Text("shrapnel"),
                                      if (weapon.shrapnel2.isNotEmpty)
                                        Text("shrapnel 2"),
                                      if (weapon.shrapnel3.isNotEmpty)
                                        Text("shrapnel 3"),
                                      if (weapon.antib1.isNotEmpty)
                                        Text("antib"),
                                      if (weapon.antib2.isNotEmpty)
                                        Text("antib 2"),
                                      if (weapon.antib3.isNotEmpty)
                                        Text("antib 3"),
                                      if (weapon.frag1.isNotEmpty) Text("frag"),
                                      if (weapon.frag2.isNotEmpty)
                                        Text("frag 2"),
                                      if (weapon.poison1.isNotEmpty)
                                        Text("poison"),
                                      if (weapon.poison2.isNotEmpty)
                                        Text("poison 2"),
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
                                                    "${AppLocalizations.of(context)!.barrage} : ${weapon.barrage} "),
                                              ])
                                            ]),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(children: [
                                              Text(
                                                  '${getTypeTir(weapon.typeMun1, context)} ${weapon.lvlTypeMun1}'),
                                              Text(
                                                  '${getTypeTir(weapon.typeMun2, context)} ${weapon.lvlTypeMun2}'),
                                              Text(
                                                  '${getTypeTir(weapon.typeMun3, context)} ${weapon.lvlTypeMun3}'),
                                              Text(
                                                  '${getTypeTir(weapon.typeMun4, context)} ${weapon.lvlTypeMun4}')
                                            ]),
                                            Column(children: [
                                              if (weapon.combat == 1)
                                                Text("Combat"),
                                              if (weapon.force == 1)
                                                Text("Force"),
                                              if (weapon.poison == 1)
                                                Text("Poison"),
                                              if (weapon.poison == 2)
                                                Text("Poison+"),
                                              if (weapon.para == 1)
                                                Text("Paralysie"),
                                              if (weapon.para == 2)
                                                Text("Paralysie+"),
                                              if (weapon.sleep == 1)
                                                Text("Sommeil"),
                                              if (weapon.sleep == 2)
                                                Text("Sommeil+"),
                                              if (weapon.explo == 1)
                                                Text("Explosion"),
                                              if (weapon.explo == 2)
                                                Text("Explosion+"),
                                              if (weapon.fatigue == 1)
                                                Text("Faiblesse"),
                                              if (weapon.fatigue == 2)
                                                Text("Faiblesse+"),
                                            ])
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
                                ],
                              ),
                            ),
                          ));
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
        ],
      ),
    );
  }

  String imgElement(int id) {
    String img = '---';
    switch (id) {
      case 1:
        img = 'images/elementaire/Feu.webp';
        break;
      case 2:
        img = 'images/elementaire/Eau.webp';
        break;
      case 3:
        img = 'images/elementaire/Foudre.webp';
        break;
      case 4:
        img = 'images/elementaire/Glace.webp';
        break;
      case 5:
        img = 'images/elementaire/Dragon.webp';
        break;
      case 6:
        img = 'images/elementaire/Poison.png';
        break;
      case 7:
        img = 'images/elementaire/Para.png';
        break;
      case 8:
        img = 'images/elementaire/Sleep.png';
        break;
      case 9:
        img = 'images/elementaire/Explo.png';
    }
    return img;
  }

  AssetImage imgArme(String categorie) {
    String img = 'images/logoBuildCard.png';
    switch (categorie) {
      case 'GS':
        img = 'images/arme/GreatSword.png';
        break;
      case 'LS':
        img = 'images/arme/LongSword.png';
        break;
      case 'SNS':
        img = 'images/arme/SwordNShield.png';
        break;
      case 'DB':
        img = 'images/arme/DualBlades.png';
        break;
      case 'MRTO':
        img = 'images/arme/Hammer.png';
        break;
      case 'HH':
        img = 'images/arme/HuntingHorn.png';
        break;
      case 'LNC':
        img = 'images/arme/Lance.png';
        break;
      case 'GL':
        img = 'images/arme/Gunlance.png';
        break;
      case 'SA':
        img = 'images/arme/SwitchAxe.png';
        break;
      case 'CB':
        img = 'images/arme/ChargeBlade.png';
        break;
      case 'IG':
        img = 'images/arme/InsectGlaive.png';
        break;
      case 'ARC':
        img = 'images/arme/Bow.png';
        break;
      case 'LBG':
        img = 'images/arme/LightBowGun.png';
        break;
    }
    return AssetImage(img);
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
}
