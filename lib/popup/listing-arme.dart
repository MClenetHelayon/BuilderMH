import 'dart:async';
import 'dart:convert';
import 'package:builder_mhrs/manager/imgManager.dart';
import 'package:builder_mhrs/manager/local/arme/fusarb/getRechargement.dart';
import 'package:builder_mhrs/manager/local/arme/fusarb/getRecul.dart';
import 'package:builder_mhrs/manager/local/getElem.dart';
import 'package:builder_mhrs/manager/textManager.dart';
import 'package:builder_mhrs/manager/weapon/ammoManager.dart';
import 'package:builder_mhrs/manager/weapon/bowManager.dart';
import 'package:builder_mhrs/object/weapon/fusarbalete/FusarbaleteLourd.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:builder_mhrs/object/weapon/Arme.dart';
import 'package:builder_mhrs/object/Stuff.dart';
import 'package:flutter/services.dart'
    show FilteringTextInputFormatter, TextInputFormatter, rootBundle;
import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import '../manager/local/arme/arc/getTypeBarrage.dart';
import '../manager/local/arme/cbTypeFiole.dart';
import '../manager/local/arme/fusarb/getDeviation.dart';
import '../manager/local/arme/glTypeCanon.dart';
import '../manager/local/arme/saTypeFiole.dart';
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
  List<Arme> lFilteredWeapons = [];
  List<Musique> lmusic = [];
  bool rcCheck = false,
      rmCheck = false,
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
      hbgCheck = false,
      isExpanded = false,
      filterElemEnabled = false;
  String cbxElem = "all";
  TextEditingController tc = TextEditingController(),
      tcElem = TextEditingController(),
      tcAtt = TextEditingController(),
      tcAffi = TextEditingController(),
      tcDef = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadWeapons();
    loadPreChoice();
    lFilteredWeapons = lweapons;
    tcElem.text = 0.toString();
    tcAtt.text = 0.toString();
    tcAffi.text = 0.toString();
    tcDef.text = 0.toString();
  }

  Future<void> loadWeapons() async {
    String local = Localizations.localeOf(widget.context).languageCode;
    String skillJsonText =
        await rootBundle.loadString('database/mhrs/skill.json');
    List<dynamic> skillList = json.decode(skillJsonText);
    String jsonTextGS =
        await rootBundle.loadString('database/mhrs/weapon/gs.json');
    List<dynamic> jsonResponseGS = json.decode(jsonTextGS);
    String jsonTextLS =
        await rootBundle.loadString('database/mhrs/weapon/ls.json');
    List<dynamic> jsonResponseLS = json.decode(jsonTextLS);
    String jsonTextSNS =
        await rootBundle.loadString('database/mhrs/weapon/sns.json');
    List<dynamic> jsonResponseSNS = json.decode(jsonTextSNS);
    String jsonTextDB =
        await rootBundle.loadString('database/mhrs/weapon/db.json');
    List<dynamic> jsonResponseDB = json.decode(jsonTextDB);
    String jsonTextMRTO =
        await rootBundle.loadString('database/mhrs/weapon/mrto.json');
    List<dynamic> jsonResponseMRTO = json.decode(jsonTextMRTO);
    String jsonTextHH =
        await rootBundle.loadString('database/mhrs/weapon/hh.json');
    List<dynamic> jsonResponseHH = json.decode(jsonTextHH);
    String jsonTextMusic =
        await rootBundle.loadString('database/mhrs/weapon/musique.json');
    List<dynamic> jsonResponseMusic = json.decode(jsonTextMusic);
    String jsonTextLNC =
        await rootBundle.loadString('database/mhrs/weapon/lnc.json');
    List<dynamic> jsonResponseLNC = json.decode(jsonTextLNC);
    String jsonTextGL =
        await rootBundle.loadString('database/mhrs/weapon/gl.json');
    List<dynamic> jsonResponseGL = json.decode(jsonTextGL);
    String jsonTextSA =
        await rootBundle.loadString('database/mhrs/weapon/sa.json');
    List<dynamic> jsonResponseSA = json.decode(jsonTextSA);
    String jsonTextCB =
        await rootBundle.loadString('database/mhrs/weapon/cb.json');
    List<dynamic> jsonResponseCB = json.decode(jsonTextCB);
    String jsonTextIG =
        await rootBundle.loadString('database/mhrs/weapon/ig.json');
    List<dynamic> jsonResponseIG = json.decode(jsonTextIG);
    String jsonTextARC =
        await rootBundle.loadString('database/mhrs/weapon/arc.json');
    List<dynamic> jsonResponseARC = json.decode(jsonTextARC);
    String jsonTextLBG =
        await rootBundle.loadString('database/mhrs/weapon/lbg.json');
    List<dynamic> jsonResponseLBG = json.decode(jsonTextLBG);
    String jsonTextHBG =
        await rootBundle.loadString('database/mhrs/weapon/hbg.json');
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
      getFilteredWeapons();
    });
  }

  Future<void> loadPreChoice() async {
    switch (widget.s.weapon.categorie) {
      case 'GS':
        gsCheck = true;
        break;
      case 'LS':
        lsCheck = true;
        break;
      case 'SNS':
        snsCheck = true;
        break;
      case 'DB':
        dbCheck = true;
        break;
      case 'MRTO':
        mrtoCheck = true;
        break;
      case 'HH':
        hhCheck = true;
        break;
      case 'LNC':
        lncCheck = true;
        break;
      case 'GL':
        glCheck = true;
        break;
      case 'SA':
        saCheck = true;
        break;
      case 'CB':
        cbCheck = true;
        break;
      case 'IG':
        igCheck = true;
        break;
      case 'ARC':
        arcCheck = true;
        break;
      case 'LBG':
        lbgCheck = true;
        break;
      case 'HBG':
        hbgCheck = true;
        break;
    }
    switch (widget.s.weapon.niveau) {
      case 'expert':
        rcCheck = true;
        break;
      case 'maitre':
        rmCheck = true;
        break;
    }
  }

  void getFilteredWeapons() {
    List<Arme> filteredWeapons = [];
    List<Arme> filteredCategWeapons = [];
    filteredCategWeapons.add(Arme.getBase());
    if (rcCheck) {
      filteredWeapons.addAll(
          lweapons.where((weapons) => weapons.niveau == 'expert').toList());
    }
    if (rmCheck) {
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
    lFilteredWeapons = filteredCategWeapons;
  }

  void searchFilter(String keyword) {
    getFilteredWeapons();
    List<Arme> filteredWeapons = [];
    if (keyword.isEmpty || keyword == '') {
      filteredWeapons = lFilteredWeapons;
    } else {
      filteredWeapons = lFilteredWeapons
          .where((weapons) =>
              weapons.name.toLowerCase().contains(keyword.toLowerCase()) ||
              weapons.niveau == "none")
          .toList();
    }
    setState(() {
      lFilteredWeapons = filteredWeapons;
    });
  }

  void vElemFilter(String i) {
    int v = int.parse(i);
    getFilteredWeapons();
    List<Arme> filteredWeapons = [];

    filteredWeapons = lFilteredWeapons
        .where((weapons) =>
            (weapons.element >= v && cbxElem != "all") ||
            weapons.niveau == "none")
        .toList();

    setState(() {
      lFilteredWeapons = filteredWeapons;
    });
  }

  void attFilter(int i) {
    getFilteredWeapons();
    List<Arme> filteredWeapons = [];

    filteredWeapons = lFilteredWeapons
        .where((weapons) => weapons.attaque >= i || weapons.niveau == "none")
        .toList();

    setState(() {
      lFilteredWeapons = filteredWeapons;
    });
  }

  void affiFilter(double i) {
    getFilteredWeapons();
    List<Arme> filteredWeapons = [];

    filteredWeapons = lFilteredWeapons
        .where((weapons) => weapons.affinite >= i || weapons.niveau == "none")
        .toList();

    setState(() {
      lFilteredWeapons = filteredWeapons;
    });
  }

  void defFilter(int i) {
    getFilteredWeapons();
    List<Arme> filteredWeapons = [];

    filteredWeapons = lFilteredWeapons
        .where((weapons) => weapons.defense >= i || weapons.niveau == "none")
        .toList();

    setState(() {
      lFilteredWeapons = filteredWeapons;
    });
  }

  void elemFilter(String id) {
    getFilteredWeapons();
    List<Arme> filteredWeapons = [];
    if (id == "all") {
      filteredWeapons = lFilteredWeapons;
      filterElemEnabled = false;
      tcElem.text = 0.toString();
    } else {
      filteredWeapons = lFilteredWeapons
          .where((weapons) =>
              weapons.idElement == convertStringElemToIdElem(id) ||
              weapons.niveau == "none")
          .toList();
      filterElemEnabled = true;
    }
    setState(() {
      lFilteredWeapons = filteredWeapons;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.black,
        child: Column(children: [
          filterRankWeapon(),
          filterAccordeon(),
          Card(
              color: Colors.grey,
              margin: const EdgeInsets.all(2),
              child: TextField(
                  controller: tc,
                  decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.search,
                      prefixIcon: const Icon(Icons.search)),
                  onChanged: (query) => searchFilter(query))),
          Expanded(
              child: ListView.builder(
                  itemCount: lFilteredWeapons.length,
                  itemBuilder: (context, index) {
                    Arme weapon = lFilteredWeapons[index];
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
                                  minLeadingWidth: 30,
                                  horizontalTitleGap: 5,
                                  title: Center(child: Text(weapon.name)),
                                  subtitle: Column(children: [
                                    Center(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                          Text('R${weapon.rarete}'),
                                          printStat(
                                              "images/elementaire/Attaque.webp",
                                              weapon.attaque.toString()),
                                          printStat(
                                              "images/elementaire/Affinite.webp",
                                              weapon.affinite.toString()),
                                          if (weapon is LameDouble &&
                                              weapon.idElement2 != 0)
                                            printDoubleElem(
                                                element(weapon.idElement),
                                                weapon.element,
                                                element(weapon.idElement2),
                                                weapon.element2)
                                          else if (weapon.idElement != 0)
                                            printStat(element(weapon.idElement),
                                                weapon.element.toString()),
                                          printStat(
                                              "images/elementaire/Defense.png",
                                              weapon.defense.toString())
                                        ])),
                                    Center(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(children: [
                                              Text(AppLocalizations.of(context)!
                                                  .joyaux),
                                              printSlotJowel(weapon)
                                            ]),
                                            if (weapon is Tranchant)
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                        margin: const EdgeInsets
                                                            .only(top: 5),
                                                        child:
                                                            sharpStat(weapon)),
                                                  ]),
                                            if (weapon is Fusarbalete ||
                                                weapon is Arc)
                                              Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 5),
                                                  child: Column(children: [
                                                    if (weapon.slotCalamite !=
                                                        0)
                                                      Text(
                                                          "${AppLocalizations.of(context)!.calam} : ${weapon.slotCalamite}")
                                                  ])),
                                          ]),
                                    ),
                                    if (!(weapon is Fusarbalete ||
                                        weapon is Arc))
                                      Container(
                                          margin: const EdgeInsets.only(top: 5),
                                          child: Column(children: [
                                            if (weapon.slotCalamite != 0)
                                              Text(
                                                  "${AppLocalizations.of(context)!.calam} : ${weapon.slotCalamite}")
                                          ])),
                                    if (weapon is CorneDeChasse)
                                      Container(
                                          margin: const EdgeInsets.only(top: 5),
                                          child: Column(children: [
                                            Text(
                                                "${AppLocalizations.of(context)!.music} :"),
                                            Text(weapon.musique[0].name),
                                            Text(weapon.musique[1].name),
                                            Text(weapon.musique[2].name),
                                          ])),
                                    if (weapon is Lancecanon)
                                      Container(
                                          margin: const EdgeInsets.only(top: 5),
                                          child: Column(children: [
                                            Text(
                                                '${getTypeCanon(weapon.typeCanon, context)} ${weapon.niveauCanon}'),
                                          ])),
                                    if (weapon is MorphoHache)
                                      Container(
                                          margin: const EdgeInsets.only(top: 5),
                                          child: weapon.valueFiole != 0
                                              ? Text(
                                                  '${getSaFiole(weapon.typeFiole, context)} ${weapon.valueFiole}')
                                              : Text(getSaFiole(
                                                  weapon.typeFiole, context))),
                                    if (weapon is VoltoHache)
                                      Container(
                                          margin: const EdgeInsets.only(top: 5),
                                          child: Text(getCbFiole(
                                              weapon.typeFiole, context))),
                                    if (weapon is Insectoglaive)
                                      Container(
                                          margin: const EdgeInsets.only(top: 5),
                                          child: Text(
                                              '${AppLocalizations.of(context)!.kinsectLvl} : ${weapon.niveauKinsect}')),
                                    if (weapon is Fusarbalete)
                                      Container(
                                          margin: const EdgeInsets.only(top: 5),
                                          child: Column(children: [
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Column(children: [
                                                    Text(
                                                        "${AppLocalizations.of(context)!.recul} :"),
                                                    Text(getRecul(
                                                        weapon.recul, context))
                                                  ]),
                                                  Column(children: [
                                                    Text(
                                                        "${AppLocalizations.of(context)!.recharge} :"),
                                                    Text(getRechargement(
                                                        weapon.rechargement,
                                                        context))
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
                                                  ])
                                                ]),
                                            Container(
                                                margin: const EdgeInsets.only(
                                                    top: 5),
                                                child: Text(AppLocalizations.of(
                                                        context)!
                                                    .mun)),
                                            blockMunListing(weapon, context)
                                          ])),
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
                          child: SizedBox(
                              height: 35,
                              child: TextButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<
                                          Color>(
                                      const Color.fromARGB(255, 255, 255, 255)),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop(weapon);
                                },
                                child: Center(child: black(weapon.name)),
                              )));
                    }
                  }))
        ]));
  }

  Widget filterAccordeon() {
    return Card(
        margin: const EdgeInsets.all(2),
        color: Colors.grey,
        child: Accordion(
            paddingListTop: 0,
            paddingListBottom: 0,
            paddingListHorizontal: 0,
            headerBackgroundColor: Colors.grey,
            headerBorderWidth: 0,
            headerBorderColorOpened: Colors.grey,
            headerBackgroundColorOpened: Colors.grey,
            contentBackgroundColor: Colors.grey,
            contentBorderColor: Colors.grey,
            contentBorderWidth: 0,
            scaleWhenAnimating: true,
            openAndCloseAnimation: true,
            headerPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            children: [
              AccordionSection(
                  isOpen: isExpanded,
                  onOpenSection: () => setState(() => isExpanded = true),
                  contentVerticalPadding: 10,
                  contentBackgroundColor: Colors.grey,
                  contentBorderColor: Colors.grey,
                  /*leftIcon:
                    const Icon(Icons.text_fields_rounded, color: Colors.white),*/
                  header: Text(AppLocalizations.of(context)!.moreFilters,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  content: Column(children: [
                    Row(children: [
                      const Text('att'),
                      const Text('affi'),
                      const Text('def'),
                    ]),
                    Row(children: [
                      Text(AppLocalizations.of(context)!.catElem),
                      SizedBox(width: 10),
                      filterComboElem(),
                    ]),
                    Row(children: [
                      Text(AppLocalizations.of(context)!.elem),
                      SizedBox(width: 10),
                      filterStats(tcElem),
                    ])
                  ]))
            ]));
  }

  Widget filterStats(TextEditingController tc) {
    return SizedBox(
        width: 30,
        child: TextField(
            controller: tc,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            enabled: filterElemEnabled,
            onChanged: (i) => vElemFilter(i)));
  }

  Widget filterComboElem() {
    return DropdownButton<String>(
      value: cbxElem,
      onChanged: (String? newValue) {
        setState(() {
          cbxElem = newValue!;
          elemFilter(cbxElem);
        });
      },
      items: <String>[
        'all',
        'none',
        'fire',
        'water',
        'thunder',
        'ice',
        'dragon',
        'poison',
        'para',
        'sleep',
        'explo'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
            value: value, child: getElemForCombo(value, context));
      }).toList(),
    );
  }

  //Widget gérant l'affichage des filtres
  Widget filterRankWeapon() {
    return Card(
        color: Colors.grey,
        margin: const EdgeInsets.all(2),
        child: Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                checkboxRank("RC", rcCheck, () {
                  setState(() {
                    resetRankChoice();
                    rcCheck = !rcCheck;
                    getFilteredWeapons();
                  });
                }),
                checkboxRank("RM", rmCheck, () {
                  setState(() {
                    resetRankChoice();
                    rmCheck = !rmCheck;
                    getFilteredWeapons();
                  });
                })
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        checkboxArme(
                            "images/arme/GreatSword.png",
                            gsCheck,
                            updateCheckbox(
                                gsCheck, (bool check) => gsCheck = check)),
                        checkboxArme(
                            "images/arme/LongSword.png",
                            lsCheck,
                            updateCheckbox(
                                lsCheck, (bool check) => lsCheck = check)),
                        checkboxArme(
                            "images/arme/SwordNShield.png",
                            snsCheck,
                            updateCheckbox(
                                snsCheck, (bool check) => snsCheck = check)),
                        checkboxArme(
                            "images/arme/DualBlades.png",
                            dbCheck,
                            updateCheckbox(
                                dbCheck, (bool check) => dbCheck = check)),
                        checkboxArme(
                            "images/arme/Hammer.png",
                            mrtoCheck,
                            updateCheckbox(
                                mrtoCheck, (bool check) => mrtoCheck = check)),
                        checkboxArme(
                            "images/arme/HuntingHorn.png",
                            hhCheck,
                            updateCheckbox(
                                hhCheck, (bool check) => hhCheck = check)),
                        checkboxArme(
                            "images/arme/Lance.png",
                            lncCheck,
                            updateCheckbox(
                                lncCheck, (bool check) => lncCheck = check)),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        checkboxArme(
                            "images/arme/Gunlance.png",
                            glCheck,
                            updateCheckbox(
                                glCheck, (bool check) => glCheck = check)),
                        checkboxArme(
                            "images/arme/SwitchAxe.png",
                            saCheck,
                            updateCheckbox(
                                saCheck, (bool check) => saCheck = check)),
                        checkboxArme(
                            "images/arme/ChargeBlade.png",
                            cbCheck,
                            updateCheckbox(
                                cbCheck, (bool check) => cbCheck = check)),
                        checkboxArme(
                            "images/arme/InsectGlaive.png",
                            igCheck,
                            updateCheckbox(
                                igCheck, (bool check) => igCheck = check)),
                        checkboxArme(
                            "images/arme/Bow.png",
                            arcCheck,
                            updateCheckbox(
                                arcCheck, (bool check) => arcCheck = check)),
                        checkboxArme(
                            "images/arme/LightBowgun.png",
                            lbgCheck,
                            updateCheckbox(
                                lbgCheck, (bool check) => lbgCheck = check)),
                        checkboxArme(
                            "images/arme/HeavyBowgun.png",
                            hbgCheck,
                            updateCheckbox(
                                hbgCheck, (bool check) => hbgCheck = check)),
                      ])
                ])
              ])
            ])));
  }

  //fonction permettant l'actualisation des données lorsque l'on change de séléction d'arme
  Function(bool) updateCheckbox(bool currentCheck, Function(bool) callback) {
    return (bool newCheck) {
      setState(() {
        resetWeaponChoice(); //reinitialiser
        tc.text = ""; //vider le champ de recherche
        callback(newCheck); //mettre a jour les checkbox
        getFilteredWeapons(); //réactualiser les donnée générale
      });
    };
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

  //fonction qui a pour but de reinitialisé toutes les checkbox lié au rang de chasseur
  void resetRankChoice() {
    rcCheck = false;
    rmCheck = false;
  }

  //fonction qui a pour but de reinitialisé toutes les checkbox lié au arme
  void resetWeaponChoice() {
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
