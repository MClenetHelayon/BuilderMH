import 'package:builder_mhrs/manager/color/colorManager.dart';
import 'package:builder_mhrs/manager/img/imgManager.dart';
import 'package:builder_mhrs/manager/img/simplyElement.dart';
import 'package:builder_mhrs/manager/img/simplyKinsect.dart';
import 'package:builder_mhrs/manager/img/simplyRaw.dart';
import 'package:builder_mhrs/manager/img/simplyWeapon.dart';
import 'package:builder_mhrs/manager/mh/skill/affiniteManager.dart';
import 'package:builder_mhrs/manager/mh/skill/calculManager.dart';
import 'package:builder_mhrs/manager/mh/weapon/bowManager.dart';
import 'package:builder_mhrs/manager/mh/weapon/sharpManager.dart';
import 'package:builder_mhrs/manager/text/color.dart';
import 'package:builder_mhrs/manager/text/localization/arme/fusarb/getDeviation.dart';
import 'package:builder_mhrs/manager/text/localization/arme/fusarb/getMod.dart';
import 'package:builder_mhrs/manager/text/localization/arme/fusarb/getRechargement.dart';
import 'package:builder_mhrs/manager/text/localization/arme/fusarb/getRecul.dart';
import 'package:builder_mhrs/manager/text/localization/arme/fusarb/getTirSpe.dart';
import 'package:builder_mhrs/manager/text/localization/arme/kinsect/getBoostKinsect.dart';
import 'package:builder_mhrs/manager/text/localization/arme/kinsect/getTypeAttaque.dart';
import 'package:builder_mhrs/manager/text/localization/arme/kinsect/getTypeKinsect.dart';
import 'package:builder_mhrs/manager/text/util/divider.dart';
import 'package:builder_mhrs/manager/mh/weapon/weaponManager.dart';
import 'package:builder_mhrs/manager/widget/printStatSimply.dart';
import 'package:builder_mhrs/object/Kinsect.dart';
import 'package:builder_mhrs/object/Stuff.dart';
import 'package:builder_mhrs/object/armor/Armure.dart';
import 'package:builder_mhrs/object/weapon/Arc.dart';
import 'package:builder_mhrs/object/weapon/Arme.dart';
import 'package:builder_mhrs/object/weapon/tranchant/CornedeChasse.dart';
import 'package:builder_mhrs/object/weapon/tranchant/Insectoglaive.dart';
import 'package:builder_mhrs/object/weapon/tranchant/Lancecanon.dart';
import 'package:builder_mhrs/object/weapon/tranchant/MorphoHache.dart';
import 'package:builder_mhrs/object/weapon/tranchant/VoltoHache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget g(Stuff s, BuildContext context) {
  return Card(
      color: getPrimary(),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        gSpeArme(s.weapon, context),
        gSimplyCard(0, s, context),
        const Divider(color: Colors.black),
        gSimplyCard(1, s, context),
        if (s.weapon.idElement != 0) const Divider(color: Colors.black),
        if (s.weapon.idElement != 0) gSimplyCard(2, s, context),
        if (s.weapon is Tranchant) const Divider(color: Colors.black),
        if (s.weapon is Tranchant) gSimplyCard(3, s, context),
      ]));
}

Widget gSharp(Stuff s, BuildContext context) {
  return Column(children: [
    title(AppLocalizations.of(context)!.sharp),
    sharpG(s, context),
  ]);
}

Widget gElem(Stuff s, BuildContext context) {
  return Column(children: [
    title(AppLocalizations.of(context)!.e),
    Container(
        margin: const EdgeInsets.all(5),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Column(children: [
            Row(children: [
              white(
                  "${s.weapon.idElement <= 5 ? AppLocalizations.of(context)!.efe : AppLocalizations.of(context)!.efa} : ${efe(s)}"),
              const SizedBox(width: 3),
              Image.asset(element(s.weapon.idElement), height: 16, width: 16),
            ]),
            Row(children: [
              white(
                  "${s.weapon.idElement <= 5 ? AppLocalizations.of(context)!.tre : AppLocalizations.of(context)!.tra} : ${elem(s)}"),
              const SizedBox(width: 3),
              Image.asset(element(s.weapon.idElement), height: 16, width: 16),
            ]),
            Row(children: [
              white(
                  "${AppLocalizations.of(context)!.elemCritMultip} : x${s.critElem}")
            ])
          ])
        ]))
  ]);
}

Widget gOff(Stuff s, BuildContext context) {
  return Column(children: [
    title(AppLocalizations.of(context)!.att),
    Container(
        margin: const EdgeInsets.all(5),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Column(children: [
            white("${AppLocalizations.of(context)!.efr} : ${efr(s)}"),
            white(
                "${AppLocalizations.of(context)!.trr} : ${row(s).toString()}"),
            white(
                "${AppLocalizations.of(context)!.petalAtt} : ${s.florelet.uAtt.toString()}"),
            switchColorWhite(
                "${AppLocalizations.of(context)!.aff} : ${affinite(s)}%",
                100,
                s.affinite),
            white(
                "${AppLocalizations.of(context)!.critMultip} : ${getBerserk(s.getTalentValueById(22), s).toString()}"),
          ])
        ]))
  ]);
}

Widget gDef(Stuff s, BuildContext context) {
  return Column(children: [
    title(AppLocalizations.of(context)!.def),
    Container(
        color: getPrimary(),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            statDefSimply(vie, s.florelet.uVie + 150),
            statDefSimply(stam, s.florelet.uStam + 150),
            statDefSimply(def, defense(s)),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            statDefSimply(feu, defFeu(s)),
            statDefSimply(eau, defEau(s)),
            statDefSimply(foudre, defFoudre(s)),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            statDefSimply(glace, defGlace(s)),
            statDefSimply(dragon, defDragon(s)),
          ])
        ]))
  ]);
}

Widget calamJowel(Stuff s, BuildContext context) {
  return Card(
      color: getPrimary(),
      child: Container(
          padding: const EdgeInsets.all(5),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            title("${AppLocalizations.of(context)!.calamJowel} : "),
            s.joyauxCalam.slot != 0
                ? Row(children: [
                    white(s.joyauxCalam.talentName),
                    const SizedBox(width: 5),
                    Image.asset(slotCalam(s.weapon.slotCalamite),
                        height: 22, width: 22),
                  ])
                : white(AppLocalizations.of(context)!.none),
          ])));
}

Widget recapTalent(Stuff s, BuildContext context) {
  return Card(
      color: getPrimary(),
      child: Container(
          margin: const EdgeInsets.only(bottom: 5),
          child: Column(children: [
            title(AppLocalizations.of(context)!.talent),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(children: [
                for (var skill in s.getAllTalents().entries)
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        switchColorWhite('${skill.key.name} : ',
                            skill.key.levelMax, skill.value),
                        switchColorWhite(
                            '${skill.value} / ${skill.key.levelMax}',
                            skill.key.levelMax,
                            skill.value)
                      ])
              ])
            ])
          ])));
}

Widget gSimplyCard(int i, Stuff s, BuildContext context) {
  Widget function = Container();
  switch (i) {
    case 0:
      function = gDef(s, context);
      break;
    case 1:
      function = gOff(s, context);
      break;
    case 2:
      function = gElem(s, context);
      break;
    case 3:
      function = gSharp(s, context);
      break;
  }
  return Container(color: getPrimary(), child: function);
}

Widget statOff(Arme weapon, BuildContext context) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
    statWhite(attaque, weapon.attaque.toString()),
    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Image.asset(affi, height: 16, width: 16),
      const SizedBox(width: 5),
      Text("${weapon.affinite.toString()}%",
          style: TextStyle(color: getFourth()))
    ]),
    isDualBlade(weapon, context),
    statWhite(def, weapon.defense.toString())
  ]);
}

Widget statDef(Armure armor) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
    statWhite(def, armor.defense.toString()),
    statWhite(feu, armor.feu.toString()),
    statWhite(eau, armor.eau.toString()),
    statWhite(foudre, armor.foudre.toString()),
    statWhite(glace, armor.glace.toString()),
    statWhite(dragon, armor.dragon.toString())
  ]);
}

List<int> allIntSharp(Stuff s) {
  Tranchant tranch = s.weapon as Tranchant;
  int rouge = tranch.rouge,
      orange = tranch.orange,
      jaune = tranch.jaune,
      vert = tranch.vert,
      bleu = tranch.bleu,
      blanc = tranch.blanc,
      violet = tranch.violet;
  if (tranch.sharpBoost.isNotEmpty) {
    rouge += sharp(s, 1);
    orange += sharp(s, 2);
    jaune += sharp(s, 3);
    vert += sharp(s, 4);
    bleu += sharp(s, 5);
    blanc += sharp(s, 6);
    violet += sharp(s, 7);
  }
  return [rouge, orange, jaune, vert, bleu, blanc, violet];
}

Widget SkillNumLogo(int level, int levelMax) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    for (int i = 0; i < levelMax; i++)
      Container(
          margin: const EdgeInsets.only(right: 2),
          alignment: Alignment.center,
          child: Text(i < level ? "▰" : "▱"))
  ]);
}

gKinsect(Stuff s, BuildContext context) {
  Kinsect k = s.kinsect;
  Insectoglaive i = s.weapon as Insectoglaive;
  return Card(
      margin: const EdgeInsets.all(5),
      color: getPrimary(),
      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Card(
              color: getSecondary(),
              child: IconButton(
                  onPressed: () {},
                  iconSize: 20,
                  icon: Image.asset(ksct, fit: BoxFit.fill))),
          Container(
              margin: const EdgeInsets.only(bottom: 3),
              child: Column(children: [
                title(AppLocalizations.of(context)!.insect),
                title(k.name)
              ]))
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          statWhite(kAtt, k.niveauKinsect[i.niveauKinsect][0].toString()),
          statWhite(kVit, k.niveauKinsect[i.niveauKinsect][1].toString()),
          statWhite(kHeal, k.niveauKinsect[i.niveauKinsect][2].toString())
        ]),
        white(getTypeAttack(k.typeAttaque, context)),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          white(getTypeKinsect(k.typeKinsect[0], context)),
          if (k.typeKinsect.length > 1)
            white(getTypeKinsectSecondaire(k.typeKinsect[1], context) +
                (k.typeKinsect.length > 2
                    ? " / ${getTypeKinsectSecondaire(k.typeKinsect[2], context)}"
                    : ""))
        ]),
        white(getBoostKinsect(k.bonusKinsect, context))
      ]));
}

Widget printBoostKinsect(String img, String stat) {
  return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(img, height: 20, width: 20),
        const SizedBox(width: 3),
        Text(stat)
      ]));
}

gCorne(Stuff s, BuildContext context) {
  CorneDeChasse horn = s.weapon as CorneDeChasse;
  return Card(
      margin: const EdgeInsets.all(5),
      color: getPrimary(),
      child: Column(children: [
        title(AppLocalizations.of(context)!.music),
        printMusic(musique(0), horn.musique[0].name),
        printMusic(musique(1), horn.musique[1].name),
        printMusic(musique(2), horn.musique[2].name)
      ]));
}

Widget printMusic(String img, String stat) {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    Image.asset(img, height: 40, width: 40),
    const SizedBox(width: 3),
    white(stat)
  ]);
}

gArc(Stuff s, BuildContext context) {
  Arc bow = s.weapon as Arc;
  return Card(
      margin: const EdgeInsets.all(5),
      color: getPrimary(),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          title(AppLocalizations.of(context)!.arc),
          Container(
              margin: const EdgeInsets.all(5), child: tBarrage(bow, context)),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Column(children: [
              Container(
                  margin: const EdgeInsets.all(5),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [typeShoot(bow, context, s.getTalentValueById(82))]))
            ]),
            verticalDividerBlack(),
            Column(children: [
              Container(
                  margin: const EdgeInsets.all(5),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [coating(bow, context)]))
            ])
          ])
        ])
      ]));
}

gSpeArme(Arme w, BuildContext context) {
  if (w is Lancecanon ||
      w is MorphoHache ||
      w is VoltoHache ||
      w is Insectoglaive) {
    return Column(children: [
      title(AppLocalizations.of(context)!.specArme),
      if (w is Lancecanon) lancecanon(w, context),
      if (w is MorphoHache) morpho(w, context),
      if (w is VoltoHache) volto(w, context),
      if (w is Insectoglaive) insecto(w, context),
      const Divider(color: Colors.black)
    ]);
  } else if (w is Fusarbalete) {
    return Column(children: [
      title(AppLocalizations.of(context)!.specArme),
      white(
          "${AppLocalizations.of(context)!.mod} : ${getMod(w.mod, w, context)}"),
      white(getTirSpe(w, context)),
      white(w.sensDeviation != 0
          ? '${AppLocalizations.of(context)!.devia} : ${getDeviation(w.sensDeviation, context)} ${getValueDeviation(w.puissanceDeviation, context)}'
          : '${AppLocalizations.of(context)!.devia} : ${getDeviation(w.sensDeviation, context)}'),
      white(
          '${AppLocalizations.of(context)!.recul} ${getRecul(w.recul, context)}'),
      white(
          '${AppLocalizations.of(context)!.recharge} ${getRechargement(w.rechargement, context)}'),
      const Divider(color: Colors.black)
    ]);
  } else {
    return Container();
  }
}
