import 'package:builder_mhrs/manager/color/colorManager.dart';
import 'package:builder_mhrs/manager/img/afficheImg.dart';
import 'package:builder_mhrs/manager/img/imgManager.dart';
import 'package:builder_mhrs/manager/img/element.dart';
import 'package:builder_mhrs/manager/img/kinsect.dart';
import 'package:builder_mhrs/manager/img/raw.dart';
import 'package:builder_mhrs/manager/mh/skill/affiniteManager.dart';
import 'package:builder_mhrs/manager/logic/stat.dart';
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
      color: primary,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        gSpeArme(s.weapon, context, false),
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
    sharpG(s, context, false),
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
            if (s.weapon.idElement <= 5)
              Center(
                  child: white(
                      "${AppLocalizations.of(context)!.elemCritMultip} : x${critElem(s)}")),
            if (s.weapon.idElement >= 6)
              Center(
                  child: white(
                      "${AppLocalizations.of(context)!.accAffli} : ~${affBuildup(s)}")),
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
    Container(color: primary, child: allDef(s, context, false))
  ]);
}

Widget allDef(Stuff s, BuildContext context, bool img) {
  int fire = defFeu(s),
      water = defEau(s),
      thunder = defFoudre(s),
      ice = defGlace(s),
      drag = defDragon(s);
  if (s.getTalentValueById(40) != 0 && Stuff.scroll) {
    fire = 0;
    water = 0;
    thunder = 0;
    ice = 0;
    drag = 0;
  }
  return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      img
          ? statDefSimplyImg(vie, s.florelet.uVie + 150)
          : statDefSimply(vie, s.florelet.uVie + 150),
      img
          ? statDefSimplyImg(stam, s.florelet.uStam + 150)
          : statDefSimply(stam, s.florelet.uStam + 150),
      img ? statDefSimplyImg(def, defense(s)) : statDefSimply(def, defense(s))
    ]),
    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      img ? statDefSimplyImg(feu, fire) : statDefSimply(feu, fire),
      img ? statDefSimplyImg(eau, water) : statDefSimply(eau, water),
      img ? statDefSimplyImg(foudre, thunder) : statDefSimply(foudre, thunder)
    ]),
    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      img ? statDefSimplyImg(glace, ice) : statDefSimply(glace, ice),
      img ? statDefSimplyImg(dragon, drag) : statDefSimply(dragon, drag)
    ])
  ]);
}

Widget calamJowel(Stuff s, BuildContext context) {
  return Card(
      color: primary,
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
      color: primary,
      child: Container(
          margin: const EdgeInsets.only(bottom: 5),
          child: Column(children: [
            title(AppLocalizations.of(context)!.talent),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(children: [
                for (var skill in s.getAllTalents().entries)
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: skill.key.actif ? primary : secondary),
                      padding: const EdgeInsets.all(5),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            switchColorWhite('${skill.key.name} : ',
                                skill.key.levelMax, skill.value),
                            switchColorWhite(
                                '${skill.value} / ${skill.key.levelMax}',
                                skill.key.levelMax,
                                skill.value)
                          ]))
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
  return Container(color: primary, child: function);
}

Widget statOff(Arme weapon, BuildContext context) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
    statWhite(attaque, weapon.attaque.toString()),
    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Image.asset(affi, height: 16, width: 16),
      const SizedBox(width: 5),
      Text("${weapon.affinite.toString()}%", style: TextStyle(color: fourth))
    ]),
    isDualBlade(weapon, context),
    statWhite(def, weapon.defense.toString())
  ]);
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
      color: primary,
      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          afficheImgKinsect(),
          Container(
              margin: const EdgeInsets.only(bottom: 3),
              child: Column(children: [
                title(AppLocalizations.of(context)!.insect),
                title(k.name)
              ]))
        ]),
        statKinsect(k, i, false),
        white(getTypeAttack(k.typeAttaque, context)),
        boostKinsect(k, context, false),
        white(getBoostKinsect(k.bonusKinsect, context))
      ]));
}

Widget statKinsect(Kinsect k, Insectoglaive i, bool img) {
  if (img) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      statBlack(
        kAtt,
        k.niveauKinsect[i.niveauKinsect][0].toString(),
      ),
      statBlack(
        kVit,
        k.niveauKinsect[i.niveauKinsect][1].toString(),
      ),
      statBlack(
        kHeal,
        k.niveauKinsect[i.niveauKinsect][2].toString(),
      )
    ]);
  } else {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      statWhite(kAtt, k.niveauKinsect[i.niveauKinsect][0].toString()),
      statWhite(kVit, k.niveauKinsect[i.niveauKinsect][1].toString()),
      statWhite(kHeal, k.niveauKinsect[i.niveauKinsect][2].toString())
    ]);
  }
}

Widget boostKinsect(Kinsect k, BuildContext context, bool img) {
  String type = k.typeKinsect.length > 1
      ? getTypeKinsectSecondaire(k.typeKinsect[1], context) +
          (k.typeKinsect.length > 2
              ? " / ${getTypeKinsectSecondaire(k.typeKinsect[2], context)}"
              : "")
      : "";

  return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
    img
        ? black(getTypeKinsect(k.typeKinsect[0], context))
        : white(getTypeKinsect(k.typeKinsect[0], context)),
    if (k.typeKinsect.length > 1) img ? black(type) : white(type)
  ]);
}

Widget simplyMusic(CorneDeChasse horn, BuildContext context, bool forImg) {
  return Column(children: [
    title(AppLocalizations.of(context)!.music),
    pMusic(musique(0), horn.musique[0].name, forImg),
    pMusic(musique(1), horn.musique[1].name, forImg),
    pMusic(musique(2), horn.musique[2].name, forImg)
  ]);
}

gArc(Stuff s, BuildContext context) {
  Arc bow = s.weapon as Arc;
  return Card(
      margin: const EdgeInsets.all(5),
      color: primary,
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
                      children: [
                        typeShoot(bow, context, s.getTalentValueById(82))
                      ]))
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

gSpeArme(Arme w, BuildContext context, bool img) {
  if (w is Lancecanon ||
      w is MorphoHache ||
      w is VoltoHache ||
      w is Insectoglaive) {
    return Column(children: [
      title(AppLocalizations.of(context)!.specArme),
      if (w is Lancecanon) lancecanon(w, context, img),
      if (w is MorphoHache) morpho(w, context, img),
      if (w is VoltoHache) volto(w, context, img),
      if (w is Insectoglaive) insecto(w, context, img),
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
