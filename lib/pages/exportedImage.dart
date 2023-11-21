import 'package:builder_mhrs/manager/color/colorManager.dart';
import 'package:builder_mhrs/manager/text/color.dart';
import 'package:builder_mhrs/manager/text/localization/arme/cbTypeFiole.dart';
import 'package:builder_mhrs/manager/text/localization/arme/fusarb/getDeviation.dart';
import 'package:builder_mhrs/manager/text/localization/arme/fusarb/getMod.dart';
import 'package:builder_mhrs/manager/text/localization/arme/fusarb/getRechargement.dart';
import 'package:builder_mhrs/manager/text/localization/arme/fusarb/getRecul.dart';
import 'package:builder_mhrs/manager/text/localization/arme/fusarb/getTirSpe.dart';
import 'package:builder_mhrs/manager/text/localization/arme/glTypeCanon.dart';
import 'package:builder_mhrs/manager/text/localization/arme/kinsect/getBoostKinsect.dart';
import 'package:builder_mhrs/manager/text/localization/arme/kinsect/getTypeAttaque.dart';
import 'package:builder_mhrs/manager/text/localization/arme/kinsect/getTypeKinsect.dart';
import 'package:builder_mhrs/manager/text/localization/arme/saTypeFiole.dart';
import 'package:builder_mhrs/manager/text/tranchant.dart';
import 'package:builder_mhrs/manager/text/util/divider.dart';
import 'package:builder_mhrs/manager/mh/weapon/ammoManager.dart';
import 'package:builder_mhrs/manager/widget/printStatSimply.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import '../manager/mh/skill/calculManager.dart';
import '../manager/img/imgManager.dart' as img;
import '../manager/img/imgManager.dart';
import '../manager/mh/weapon/sharpManager.dart';
import '../manager/mh/skill/affiniteManager.dart';
import '../manager/statManager.dart';
import '../manager/mh/weapon/bowManager.dart';
import '../object/armor/Armure.dart';
import '../object/Joyau.dart';
import '../object/Kinsect.dart';
import '../object/Screen.dart';
import '../object/Talent.dart';
import '../object/Talisman.dart';
import '../object/armor/Bras.dart';
import '../object/armor/Casque.dart';
import '../object/armor/Ceinture.dart';
import '../object/armor/Jambe.dart';
import '../object/armor/Plastron.dart';
import '../object/weapon/Arc.dart';
import '../object/weapon/Arme.dart';
import '../object/Stuff.dart';
import '../object/weapon/tranchant/CornedeChasse.dart';
import '../object/weapon/tranchant/Insectoglaive.dart';
import '../object/weapon/tranchant/LameDouble.dart';
import '../object/weapon/tranchant/Lancecanon.dart';
import '../object/weapon/tranchant/MorphoHache.dart';
import '../object/weapon/tranchant/VoltoHache.dart';

Widget buildCard(Screen screen) {
  Stuff s = screen.stuff;
  if (s.weapon is Fusarbalete) {
    screen.width += 250;
    screen.height += 50;
  }
  return Container(
      width: screen.width,
      height: screen.height,
      color: getPrimary(),
      child: Row(children: [
        Container(
            color: getSecondary(),
            width:
                s.weapon is Fusarbalete ? screen.width / 6 : screen.width / 5,
            height: screen.height,
            child: Column(children: [
              if (s.weapon.niveau == "maitre") calamJowel(s, screen.context),
              for (var skill in s.getAllTalents().entries)
                Card(
                    child: Container(
                        margin: const EdgeInsets.only(
                            bottom: 1, top: 1, left: 5, right: 5),
                        child: Column(children: [
                          switchColorBlack(
                              skill.key.name, skill.key.levelMax, skill.value),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    child: SkillNumLogo(
                                        skill.value, skill.key.levelMax)),
                                Container(
                                    child: switchColorBlack(
                                        "${AppLocalizations.of(screen.context)!.niv} ${skill.value}",
                                        skill.key.levelMax,
                                        skill.value))
                              ])
                        ])))
            ])),
        Expanded(
            child: Column(children: [
          if (s.weapon is Fusarbalete)
            Card(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                  gDef(s, screen.context),
                  verticalDivider(),
                  gOff(s, screen.context),
                  verticalDivider(),
                  gSpeArme(s.weapon, screen.context),
                ])),
          Weapon(screen),
          Armor(1, s.helmet, screen),
          Armor(2, s.torso, screen),
          Armor(3, s.gant, screen),
          Armor(4, s.boucle, screen),
          Armor(5, s.pied, screen),
          Charm(screen),
          Flor(screen),
        ])),
        if (s.weapon is! Fusarbalete)
          Container(
              color: getSecondary(),
              width:
                  s.weapon is Fusarbalete ? screen.width / 6 : screen.width / 5,
              height: screen.height,
              child: Column(children: [
                Card(
                    child: Column(children: [
                  gSpeArme(s.weapon, screen.context),
                  gDef(s, screen.context),
                  const Divider(color: Colors.black),
                  gOff(s, screen.context),
                  const Divider(color: Colors.black),
                  if (s.weapon.idElement != 0) gElem(s, screen.context),
                  if (s.weapon is Tranchant) gSharp(s, screen.context),
                  if (s.weapon is Arc) gArc(s, screen.context),
                  if (s.weapon is CorneDeChasse) gCorne(s, screen.context),
                  if (s.weapon is Insectoglaive && s.kinsect.id != 9999)
                    gKinsect(s, screen.context),
                ])),
              ])),
        if (s.weapon is Fusarbalete)
          Container(
              color: getSecondary(),
              width: screen.width / 3.25,
              height: screen.height,
              child: Column(children: [
                Card(
                    child: Column(children: [
                  gFusar(s, screen.context),
                ])),
              ])),
      ]));
}

Widget Weapon(Screen screen) {
  Stuff s = screen.stuff;
  List<Joyaux> j = Arme.listJoyaux;
  return Card(
      color: const Color.fromRGBO(255, 255, 255, 1),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Column(children: [
          Card(color: getSecondary(), child: icon(0, false, s)),
        ]),
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              margin: const EdgeInsets.only(top: 5),
              child: Text(s.weapon.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: getFifth()))),
          exportArmeStat(s.weapon),
        ])),
        Row(children: [
          if (s.weapon.niveau == "maitre")
            exportCalam(s.weapon.slotCalamite, screen),
          Container(
              margin: const EdgeInsets.only(right: 5),
              child: Column(children: [
                const SizedBox(height: 4),
                if (s.weapon.slots.isEmpty) Container(),
                if (s.weapon.slots.length >= 1)
                  exportJowel(s.weapon.slots[0], j, 0, screen),
                if (s.weapon.slots.length >= 2)
                  exportJowel(s.weapon.slots[1], j, 1, screen),
                if (s.weapon.slots.length == 3)
                  exportJowel(s.weapon.slots[2], j, 2, screen),
              ]))
        ])
      ]));
}

Widget Armor(int i, Armure a, Screen screen) {
  Stuff s = screen.stuff;
  List<Joyaux> j = [];
  switch (i) {
    case 1:
      j = Casque.listJoyaux;
      break;
    case 2:
      j = Plastron.listJoyaux;
      break;
    case 3:
      j = Bras.listJoyaux;
      break;
    case 4:
      j = Ceinture.listJoyaux;
      break;
    case 5:
      j = Jambiere.listJoyaux;
      break;
  }
  return Card(
      color: const Color.fromRGBO(255, 255, 255, 1),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Column(children: [
          Card(color: getSecondary(), child: icon(i, true, s)),
        ]),
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              margin: const EdgeInsets.only(top: 5),
              child: Text(a.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: getFifth()))),
          exportTalent(a.talents)
        ])),
        Container(
            margin: const EdgeInsets.only(right: 5),
            child: Column(children: [
              const SizedBox(height: 4),
              if (a.slots.isEmpty) Container(),
              if (a.slots.length >= 1) exportJowel(a.slots[0], j, 0, screen),
              if (a.slots.length >= 2) exportJowel(a.slots[1], j, 1, screen),
              if (a.slots.length == 3) exportJowel(a.slots[2], j, 2, screen),
            ]))
      ]));
}

Widget calamJowel(Stuff s, BuildContext context) {
  return Card(
      child: Container(
          padding: const EdgeInsets.all(5),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("${AppLocalizations.of(context)!.calamJowel} : "),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              s.joyauxCalam.slot != 0
                  ? Row(children: [
                      Text(
                        s.joyauxCalam.talentName,
                      ),
                      const SizedBox(width: 5),
                      Image.asset(slotCalam(s.weapon.slotCalamite),
                          height: 22, width: 22),
                    ])
                  : Text(AppLocalizations.of(context)!.none),
            ])
          ])));
}

Widget Charm(Screen screen) {
  Stuff s = screen.stuff;
  return Card(
      color: getFourth(),
      child: Row(children: [
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Card(color: getSecondary(), child: icon(7, true, s))]),
        Expanded(
            child: Row(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(AppLocalizations.of(screen.context)!.tali,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: getFifth())),
            if (s.charm.talents.isEmpty) Container(),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              if (s.charm.talents.length >= 1)
                talent(
                    '${s.charm.talents[0].name} +${s.charm.talents[0].level}'),
              if (s.charm.talents.length >= 2)
                talent(
                    '${s.charm.talents[1].name} +${s.charm.talents[1].level}'),
            ])
          ])
        ])),
        Container(
            margin: const EdgeInsets.only(right: 5),
            child: Column(children: [
              if (s.charm.slots.isEmpty) Container(),
              if (s.charm.slots.length >= 1 && s.charm.slots[0] != 0)
                exportJowel(s.charm.slots[0], Talisman.listJoyaux, 0, screen),
              if (s.charm.slots.length >= 2 && s.charm.slots[1] != 0)
                exportJowel(s.charm.slots[1], Talisman.listJoyaux, 1, screen),
              if (s.charm.slots.length == 3 && s.charm.slots[2] != 0)
                exportJowel(s.charm.slots[2], Talisman.listJoyaux, 2, screen),
            ]))
      ]));
}

Widget Flor(Screen screen) {
  Stuff s = screen.stuff;
  return Card(
      color: getFourth(),
      child: Row(children: [
        Flexible(
            flex: 1,
            child: Column(children: [
              Card(color: getSecondary(), child: icon(6, true, s)),
            ])),
        Flexible(
            flex: 3,
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Flexible(
                  flex: 1,
                  child: Text(s.florelet.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: getFifth()))),
              Flexible(flex: 2, child: Container()),
              Flexible(
                  flex: 0,
                  child: Row(children: [
                    Column(children: [
                      Container(
                        child: printValueImg("images/elementaire/Vie.png",
                            s.florelet.uVie.toString()),
                      ),
                      Container(
                        child: printValueImg("images/elementaire/Vie.png",
                            s.florelet.gVie.toString()),
                      ),
                    ]),
                    Column(children: [
                      Container(
                        child: printValueImg("images/elementaire/Stam.png",
                            s.florelet.uStam.toString()),
                      ),
                      Container(
                        child: printValueImg("images/elementaire/Stam.png",
                            s.florelet.gStam.toString()),
                      ),
                    ]),
                    Column(children: [
                      Container(
                        child: printValueImg("images/elementaire/Attaque.webp",
                            s.florelet.uAtt.toString()),
                      ),
                      Container(
                        child: printValueImg("images/elementaire/Attaque.webp",
                            s.florelet.gAtt.toString()),
                      ),
                    ]),
                    Column(children: [
                      Container(
                        child: printValueImg("images/elementaire/Defense.png",
                            s.florelet.uDef.toString()),
                      ),
                      Container(
                        child: printValueImg("images/elementaire/Defense.png",
                            s.florelet.gDef.toString()),
                      ),
                    ])
                  ]))
            ]))
      ]));
}

Widget icon(int i, bool isArmor, Stuff s) {
  return IconButton(
      onPressed: () {},
      iconSize: 40,
      icon: Image.asset(
        isArmor ? img.armure(i) : img.arme(s.weapon.categorie),
        fit: BoxFit.fill,
      ));
}

Widget exportTalent(List<Talent> t) {
  return Row(children: [
    if (t.isEmpty) Container(),
    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        if (t.length >= 1) talent('${t[0].name} +${t[0].level}'),
        if (t.length >= 2) talent('${t[1].name} +${t[1].level}'),
      ]),
      Row(children: [
        if (t.length >= 3) talent('${t[2].name} +${t[2].level}'),
        if (t.length >= 4) talent('${t[3].name} +${t[3].level}'),
      ])
    ])
  ]);
}

Container talent(String s) {
  return Container(
      decoration: BoxDecoration(
        color: getSecondary(),
        borderRadius: BorderRadius.circular(5),
      ),
      margin: const EdgeInsets.only(right: 5.0, bottom: 5.0),
      padding:
          const EdgeInsets.only(left: 10.0, right: 10.0, top: 3.0, bottom: 3.0),
      child: Text(s, style: const TextStyle(color: Colors.white)));
}

Widget exportArmeStat(Arme weapon) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Row(children: [
      printValueImg(
          "images/elementaire/Attaque.webp", weapon.attaque.toString()),
      printValueImg(
          "images/elementaire/Defense.png", weapon.defense.toString()),
      printValueImg(
          "images/elementaire/Affinite.webp", "${weapon.affinite.toString()}%")
    ]),
    Row(children: [
      if (weapon.idElement != 0)
        printValueImg(element(weapon.idElement), weapon.element.toString()),
      if (weapon is LameDouble)
        printValueImg(element(weapon.idElement2), weapon.element2.toString()),
    ]),
  ]);
}

Widget exportCalam(int slotCalamite, Screen screen) {
  String image = img.slotCalam(slotCalamite);
  String nom = "";
  if (screen.stuff.joyauxCalam.slot == 0) {
    nom = AppLocalizations.of(screen.context)!.none;
  } else {
    nom = "${screen.stuff.joyauxCalam.name} [${screen.stuff.joyauxCalam.slot}]";
  }

  return Card(
      margin: const EdgeInsets.only(bottom: 3.0, right: 2),
      color: getSecondary(),
      child: Container(
          padding: const EdgeInsets.only(left: 2, right: 5, top: 1),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Image.asset(image, height: 22, width: 22),
            const SizedBox(width: 10),
            Text(nom, style: const TextStyle(color: Colors.white)),
          ])));
}

Widget exportJowel(int slot, List<Joyaux> j, int id, Screen screen) {
  String image = img.slot(slot);
  String nom = "";

  if (j.isNotEmpty && j.length > id) {
    if (j[id].id != 0 && j[id].id != 9999) {
      nom = "${j[id].name} +${j[id].level} [${j[id].slot}]";
    } else {
      nom = AppLocalizations.of(screen.context)!.none;
    }
  } else {
    nom = AppLocalizations.of(screen.context)!.none;
  }

  return Card(
      margin: const EdgeInsets.only(bottom: 3.0),
      color: getSecondary(),
      child: Container(
          padding: const EdgeInsets.only(left: 2, right: 5, top: 1),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Image.asset(image, height: 22, width: 22),
            const SizedBox(width: 10),
            Text(nom, style: const TextStyle(color: Colors.white)),
          ])));
}

Container printValueImg(String img, String t) {
  return Container(
    decoration: BoxDecoration(
      color: getSecondary(),
      borderRadius: BorderRadius.circular(5),
    ),
    width: 60,
    height: 22,
    padding: const EdgeInsets.only(top: 1, bottom: 1, left: 2, right: 2),
    margin: const EdgeInsets.only(
      bottom: 3,
      right: 3,
    ),
    child: statWhite(img, t),
  );
}

Widget gDef(Stuff s, BuildContext context) {
  return Column(
    children: [
      title(AppLocalizations.of(context)!.def),
      Container(
          margin: const EdgeInsets.all(5),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  gDefSimply(
                      "images/elementaire/Vie.png", s.florelet.uVie + 150),
                  gDefSimply(
                      "images/elementaire/Stam.png", s.florelet.uStam + 150),
                  gDefSimply("images/elementaire/Defense.png", defense(s)),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  gDefSimply("images/elementaire/Feu.webp", defFeu(s)),
                  gDefSimply("images/elementaire/Eau.webp", defEau(s))
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  gDefSimply("images/elementaire/Foudre.webp", defFoudre(s)),
                  gDefSimply("images/elementaire/Glace.webp", defGlace(s)),
                  gDefSimply("images/elementaire/Dragon.webp", defDragon(s)),
                ])
              ]))
    ],
  );
}

Container gDefSimply(String img, int value) {
  return Container(
      margin: const EdgeInsets.only(right: 5),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(img, height: 18, width: 18),
        const SizedBox(width: 3),
        Text(value.toString()),
      ]));
}

Widget gOff(Stuff s, BuildContext context) {
  return Column(children: [
    title(AppLocalizations.of(context)!.att),
    Container(
        margin: const EdgeInsets.all(5),
        child: Column(children: [
          Text(
              "${AppLocalizations.of(context)!.petalAtt} : ${s.florelet.uAtt.toString()}"),
          Text("${AppLocalizations.of(context)!.efr} : ${efr(s)}"),
          Text("${AppLocalizations.of(context)!.trr} : ${row(s).toString()}"),
          switchColorBlack(
              "${AppLocalizations.of(context)!.aff} : ${affinite(s)}%",
              100,
              s.affinite),
          Text(
              "${AppLocalizations.of(context)!.critMultip} : ${getBerserk(s.getTalentById(22), s).toString()}"),
        ]))
  ]);
}

Widget gElem(Stuff s, BuildContext context) {
  return Column(children: [
    title(AppLocalizations.of(context)!.e),
    Container(
        margin: const EdgeInsets.all(5),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
                "${s.weapon.idElement <= 5 ? AppLocalizations.of(context)!.efe : AppLocalizations.of(context)!.efa} : ${efe(s)}"),
            const SizedBox(width: 3),
            Image.asset(img.element(s.weapon.idElement), height: 16, width: 16),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
                "${s.weapon.idElement <= 5 ? AppLocalizations.of(context)!.tre : AppLocalizations.of(context)!.tra} : ${elem(s)}"),
            const SizedBox(width: 3),
            Image.asset(img.element(s.weapon.idElement), height: 16, width: 16),
          ]),
          Text(
              "${AppLocalizations.of(context)!.elemCritMultip} : x${s.critElem}"),
        ])),
    const Divider(color: Colors.black),
  ]);
}

Widget gSharp(Stuff s, BuildContext context) {
  Tranchant sharp = s.weapon as Tranchant;
  return Column(children: [
    title(AppLocalizations.of(context)!.sharp),
    Container(
        margin: const EdgeInsets.all(5),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              color: getSecondary(),
              child: IntrinsicWidth(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    superColoring(3, sharp),
                    if (sharp.sharpBoost.length != 0)
                      containerSimplyStat(s.nbSavoirFaire >= 1 ? 12 : 6, 5,
                          sharp.sharpBoost[0]),
                    if (sharp.sharpBoost.length != 0)
                      containerSimplyStat(s.nbSavoirFaire >= 2 ? 12 : 6, 5,
                          sharp.sharpBoost[1]),
                    if (sharp.sharpBoost.length != 0)
                      containerSimplyStat(s.nbSavoirFaire >= 3 ? 12 : 6, 5,
                          sharp.sharpBoost[2]),
                    if (sharp.sharpBoost.length != 0)
                      containerSimplyStat(s.nbSavoirFaire >= 4 ? 12 : 6, 5,
                          sharp.sharpBoost[3]),
                    if (sharp.sharpBoost.length != 0)
                      containerSimplyStat(s.nbSavoirFaire >= 5 ? 12 : 6, 5,
                          sharp.sharpBoost[4]),
                  ],
                ),
              )),
          black(listTranchant(s)),
          Text("${AppLocalizations.of(context)!.sharpRaw} : x${s.sharpRaw}"),
          Text("${AppLocalizations.of(context)!.sharpElem} : x${s.sharpElem}"),
        ])),
    if (s.weapon is CorneDeChasse ||
        (s.weapon is Insectoglaive && s.kinsect.id != 9999))
      const Divider(color: Colors.black),
  ]);
}

gKinsect(Stuff s, BuildContext context) {
  Kinsect k = s.kinsect;
  return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Card(
              color: getSecondary(),
              child: IconButton(
                  onPressed: () {},
                  iconSize: 20,
                  icon: Image.asset(
                    'images/arme/kinsect.png',
                    fit: BoxFit.fill,
                  ))),
          title(AppLocalizations.of(context)!.insect),
        ]),
        Text(k.name),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          statBlack(
            "images/elementaire/AttKinsect.png",
            k.niveauKinsect[(s.weapon as Insectoglaive).niveauKinsect][0]
                .toString(),
          ),
          statBlack(
            "images/elementaire/VitKinsect.png",
            k.niveauKinsect[(s.weapon as Insectoglaive).niveauKinsect][1]
                .toString(),
          ),
          statBlack(
            "images/elementaire/HealKinsect.png",
            k.niveauKinsect[(s.weapon as Insectoglaive).niveauKinsect][2]
                .toString(),
          ),
        ]),
        Text(getTypeAttack(k.typeAttaque, context)),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(getTypeKinsect(k.typeKinsect[0], context)),
          if (k.typeKinsect.length > 1)
            Text(getTypeKinsectSecondaire(k.typeKinsect[1], context) +
                (k.typeKinsect.length > 2
                    ? " / ${getTypeKinsectSecondaire(k.typeKinsect[2], context)}"
                    : "")),
        ]),
        Text(getBoostKinsect(k.bonusKinsect, context))
      ]));
}

Widget printBoostKinsect(String img, String stat) {
  return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(img, height: 20, width: 20),
        const SizedBox(width: 3),
        Text(stat),
      ]));
}

gCorne(Stuff s, BuildContext context) {
  CorneDeChasse horn = s.weapon as CorneDeChasse;
  return Column(children: [
    title(AppLocalizations.of(context)!.music),
    printMusic(musique(0), horn.musique[0].name),
    printMusic(musique(1), horn.musique[1].name),
    printMusic(musique(2), horn.musique[2].name),
  ]);
}

Widget printMusic(String img, String stat) {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    Image.asset(img, height: 40, width: 40),
    const SizedBox(width: 3),
    Text(stat),
  ]);
}

gArc(Stuff s, BuildContext context) {
  Arc bow = s.weapon as Arc;
  return Column(children: [
    title(AppLocalizations.of(context)!.arc),
    Container(margin: const EdgeInsets.all(5), child: tBarrage(bow, context)),
    Container(
        margin: const EdgeInsets.all(5),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [typeShoot(bow, context, s.getTalentById(82))])),
    Container(
        margin: const EdgeInsets.all(5),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("${AppLocalizations.of(context)!.fiole} :"),
          coating(bow, context)
        ]))
  ]);
}

gFusar(Stuff s, BuildContext context) {
  return Column(children: [
    title(AppLocalizations.of(context)!.mun),
    Container(
        margin: const EdgeInsets.all(5), child: getPrintImgAmmo(s, context)),
  ]);
}

gSpeArme(Arme w, BuildContext context) {
  String vretour = "";
  if (w is Lancecanon) {
    vretour =
        "${AppLocalizations.of(context)!.canon} : ${getTypeCanon(w.typeCanon, context)} ${w.niveauCanon}";
  }
  if (w is Insectoglaive) {
    vretour =
        "${AppLocalizations.of(context)!.kinsectLvl} : ${w.niveauKinsect}";
  }
  if (w is MorphoHache) {
    vretour = w.valueFiole != 0
        ? "${getSaFiole(w.typeFiole, context)}} ${w.valueFiole}"
        : getSaFiole(w.typeFiole, context);
  }
  if (w is VoltoHache) {
    vretour = getCbFiole(w.typeFiole, context);
  }
  if (vretour != "") {
    return Column(children: [
      title(AppLocalizations.of(context)!.specArme),
      Text(vretour),
      const Divider(color: Colors.black)
    ]);
  } else if (w is Fusarbalete) {
    return Column(children: [
      title(AppLocalizations.of(context)!.specArme),
      Text(
          "${AppLocalizations.of(context)!.mod} : ${getMod(w.mod, w, context)}"),
      Text(getTirSpe(w, context)),
      Text(w.sensDeviation != 0
          ? '${AppLocalizations.of(context)!.devia} : ${getDeviation(w.sensDeviation, context)} ${getValueDeviation(w.puissanceDeviation, context)}'
          : '${AppLocalizations.of(context)!.devia} : ${getDeviation(w.sensDeviation, context)}'),
      Text(
          '${AppLocalizations.of(context)!.recul} ${getRecul(w.recul, context)}'),
      Text(
          '${AppLocalizations.of(context)!.recharge} ${getRechargement(w.rechargement, context)}'),
      const Divider(color: Colors.black)
    ]);
  } else {
    return Container();
  }
}
