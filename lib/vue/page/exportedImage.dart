import 'package:builder_mhrs/controller/color/colorManager.dart';
import 'package:builder_mhrs/controller/color/colorScroll.dart';
import 'package:builder_mhrs/controller/img/afficheImg.dart';
import 'package:builder_mhrs/controller/img/imgManager.dart';
import 'package:builder_mhrs/controller/img/imgManager.dart' as img;
import 'package:builder_mhrs/controller/img/raw.dart';
import 'package:builder_mhrs/controller/mh/armor/florManager.dart';
import 'package:builder_mhrs/controller/mh/weapon/bowManager.dart';
import 'package:builder_mhrs/controller/mh/statManager.dart';
import 'package:builder_mhrs/controller/text/color.dart';
import 'package:builder_mhrs/controller/text/slotAugment.dart';
import 'package:builder_mhrs/controller/text/util/divider.dart';
import 'package:builder_mhrs/controller/mh/weapon/ammoManager.dart';
import 'package:builder_mhrs/controller/widget/printStatSimply.dart';
import 'package:builder_mhrs/model/armor/Florelet.dart';
import 'package:builder_mhrs/model/Joyau.dart';
import 'package:builder_mhrs/model/Screen.dart';
import 'package:builder_mhrs/model/Stuff.dart';
import 'package:builder_mhrs/model/Talent.dart';
import 'package:builder_mhrs/model/armor/Armure.dart';
import 'package:builder_mhrs/model/armor/Bras.dart';
import 'package:builder_mhrs/model/armor/Casque.dart';
import 'package:builder_mhrs/model/armor/Ceinture.dart';
import 'package:builder_mhrs/model/armor/Jambe.dart';
import 'package:builder_mhrs/model/armor/Plastron.dart';
import 'package:builder_mhrs/model/armor/Talisman.dart';
import 'package:builder_mhrs/model/weapon/Arc.dart';
import 'package:builder_mhrs/model/weapon/Arme.dart';
import 'package:builder_mhrs/model/weapon/tranchant/CornedeChasse.dart';
import 'package:builder_mhrs/model/weapon/tranchant/Insectoglaive.dart';
import 'package:builder_mhrs/model/weapon/tranchant/LameDouble.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

Widget buildCard(Screen screen) {
  Stuff s = screen.stuff;
  if (s.weapon is Fusarbalete) {
    screen.width += 250;
    screen.height += 50;
  }
  return Container(
      width: screen.width,
      height: screen.height,
      color: primary,
      child: Row(children: [
        Container(
            color: secondary,
            width:
                s.weapon is Fusarbalete ? screen.width / 6 : screen.width / 5,
            height: screen.height,
            child: recapTalentImg(s, screen.context)),
        Expanded(
            child: Column(children: [
          if (s.weapon is Fusarbalete)
            Card(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                  gDef(s, screen.context, true),
                  verticalDivider(),
                  gOff(s, screen.context, true),
                  verticalDivider(),
                  gSpeArme(s, screen.context, true),
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
              color: secondary,
              width:
                  s.weapon is Fusarbalete ? screen.width / 6 : screen.width / 5,
              height: screen.height,
              child: Column(children: [
                Card(
                    child: Column(children: [
                  gScroll(screen.context),
                  const Divider(color: Colors.black),
                  gSpeArme(s, screen.context, true),
                  gDef(s, screen.context, true),
                  gOff(s, screen.context, true),
                  if (s.weapon.idElement != 0) gElem(s, screen.context, true),
                  if (s.weapon is Tranchant) gSharp(s, screen.context, true),
                  if (s.weapon is Arc) gArc(s, screen.context),
                  if (s.weapon is CorneDeChasse)
                    simplyMusic(
                        s.weapon as CorneDeChasse, screen.context, true),
                  if (s.weapon is CorneDeChasse ||
                      (s.weapon is Insectoglaive && s.kinsect.id != 9999))
                    const Divider(color: Colors.black),
                  if (s.weapon is Insectoglaive && s.kinsect.id != 9999)
                    gKinsectImg(s, screen.context),
                ])),
              ])),
        if (s.weapon is Fusarbalete)
          Container(
              color: secondary,
              width: screen.width / 3.25,
              height: screen.height,
              child: Column(children: [
                Card(child: Column(children: [gFusar(s, screen.context)]))
              ])),
      ]));
}

Widget Weapon(Screen screen) {
  Stuff s = screen.stuff;
  Arme a = s.weapon;
  List<Joyaux> j = Arme.listJoyaux;
  return Card(
      color: const Color.fromRGBO(255, 255, 255, 1),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Column(children: [
          Card(color: secondary, child: afficheIconArmorImg(s, 0, false)),
        ]),
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              margin: const EdgeInsets.only(top: 5), child: boldOrange(a.name)),
          exportArmeStat(a),
          if (a.niveau == "maitre" && Arme.augments) listAugmentImg(a)
        ])),
        Row(children: [
          if (a.niveau == "maitre") exportCalam(a.slotCalamite, screen),
          Container(
              margin: const EdgeInsets.only(right: 5),
              child: Column(children: [
                const SizedBox(height: 4),
                if (a.slots.isEmpty) Container(),
                if (a.slots.isNotEmpty) exportJowel(a.slots[0], j, 0, screen),
                if (a.slots.length >= 2) exportJowel(a.slots[1], j, 1, screen),
                if (a.slots.length == 3) exportJowel(a.slots[2], j, 2, screen),
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
          Card(color: secondary, child: afficheIconArmorImg(s, i, true)),
        ]),
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              margin: const EdgeInsets.only(top: 5), child: boldOrange(a.name)),
          exportTalent(a.talents)
        ])),
        Container(
            margin: const EdgeInsets.only(right: 5),
            child: Column(children: [
              const SizedBox(height: 4),
              if (a.slots.isEmpty) Container(),
              if (a.slots.isNotEmpty) exportJowel(a.slots[0], j, 0, screen),
              if (a.slots.length >= 2) exportJowel(a.slots[1], j, 1, screen),
              if (a.slots.length == 3) exportJowel(a.slots[2], j, 2, screen),
            ]))
      ]));
}

Widget Charm(Screen screen) {
  Stuff s = screen.stuff;
  return Card(
      color: fourth,
      child: Row(children: [
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Card(color: secondary, child: afficheIconArmorImg(s, 7, true))
        ]),
        Expanded(
            child: Row(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            boldOrange(AppLocalizations.of(screen.context)!.tali),
            if (s.charm.talents.isEmpty) Container(),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              if (s.charm.talents.isNotEmpty)
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
              if (s.charm.slots.isNotEmpty && s.charm.slots[0] != 0)
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
  Florelet f = s.florelet;
  return Card(
      color: fourth,
      child: Row(children: [
        Flexible(
            flex: 0,
            child: Column(children: [
              Card(color: secondary, child: afficheIconArmorImg(s, 6, true)),
            ])),
        Flexible(
            flex: 3,
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Flexible(flex: 1, child: boldOrange(f.name)),
              Flexible(flex: 2, child: Container()),
              Flexible(
                  flex: 0,
                  child: Column(children: [
                    rowFlor(f.uVie, f.uStam, f.uAtt, f.uDef, true),
                    rowFlor(f.gVie, f.gStam, f.gAtt, f.gDef, true)
                  ]))
            ]))
      ]));
}

Widget exportTalent(List<Talent> t) {
  return Row(children: [
    if (t.isEmpty) Container(),
    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        if (t.isNotEmpty) talent('${t[0].name} +${t[0].level}'),
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
        color: secondary,
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
      printValueImg(attaque, weapon.attaque.toString()),
      printValueImg(def, weapon.defense.toString()),
      printValueImg(affi, "${weapon.affinite.toString()}%")
    ]),
    Row(children: [
      if (weapon.idElement != 0)
        printValueImg(element(weapon.idElement), weapon.element.toString()),
      if (weapon is LameDouble)
        printValueImg(element(weapon.idElement2), weapon.element2.toString())
    ])
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
      color: secondary,
      child: Container(
          padding: const EdgeInsets.only(left: 2, right: 5, top: 1),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Image.asset(image, height: 22, width: 22),
            const SizedBox(width: 10),
            Text(nom, style: const TextStyle(color: fourth))
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
      color: secondary,
      child: Container(
          padding: const EdgeInsets.only(left: 2, right: 5, top: 1),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Image.asset(image, height: 22, width: 22),
            const SizedBox(width: 10),
            Text(nom, style: const TextStyle(color: fourth)),
          ])));
}

Container printValueImg(String img, String t) {
  return Container(
    decoration:
        BoxDecoration(color: secondary, borderRadius: BorderRadius.circular(5)),
    width: 60,
    height: 22,
    padding: const EdgeInsets.only(top: 1, bottom: 1, left: 2, right: 2),
    margin: const EdgeInsets.only(bottom: 3, right: 3),
    child: statWhite(img, t),
  );
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
            children: [typeShoot(bow, context, s.getTalentValueById(82))])),
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

gScroll(BuildContext context) {
  return Container(
      margin: const EdgeInsets.only(top: 5),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        boldOrange(AppLocalizations.of(context)!.scroll),
        const SizedBox(width: 3),
        Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: sixth),
                color: Stuff.scroll ? scrollO : scrollB))
      ]));
}
