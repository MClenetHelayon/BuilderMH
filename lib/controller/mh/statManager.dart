import 'package:builder_mhrs/controller/color/colorManager.dart';
import 'package:builder_mhrs/controller/img/afficheImg.dart';
import 'package:builder_mhrs/controller/img/imgManager.dart';
import 'package:builder_mhrs/controller/img/element.dart';
import 'package:builder_mhrs/controller/img/kinsect.dart';
import 'package:builder_mhrs/controller/img/raw.dart';
import 'package:builder_mhrs/controller/mh/skill/affiniteManager.dart';
import 'package:builder_mhrs/controller/logic/stat.dart';
import 'package:builder_mhrs/controller/mh/weapon/bowManager.dart';
import 'package:builder_mhrs/controller/mh/weapon/sharpManager.dart';
import 'package:builder_mhrs/controller/text/color.dart';
import 'package:builder_mhrs/controller/text/localization/arme/fusarb/getDeviation.dart';
import 'package:builder_mhrs/controller/text/localization/arme/fusarb/getMod.dart';
import 'package:builder_mhrs/controller/text/localization/arme/fusarb/getRechargement.dart';
import 'package:builder_mhrs/controller/text/localization/arme/fusarb/getRecul.dart';
import 'package:builder_mhrs/controller/text/localization/arme/fusarb/getTirSpe.dart';
import 'package:builder_mhrs/controller/text/localization/arme/kinsect/getBoostKinsect.dart';
import 'package:builder_mhrs/controller/text/localization/arme/kinsect/getTypeAttaque.dart';
import 'package:builder_mhrs/controller/text/localization/arme/kinsect/getTypeKinsect.dart';
import 'package:builder_mhrs/controller/text/util/divider.dart';
import 'package:builder_mhrs/controller/mh/weapon/weaponManager.dart';
import 'package:builder_mhrs/controller/widget/printStatSimply.dart';
import 'package:builder_mhrs/controller/widget/similyCard.dart';
import 'package:builder_mhrs/model/Kinsect.dart';
import 'package:builder_mhrs/model/Stuff.dart';
import 'package:builder_mhrs/model/weapon/Arc.dart';
import 'package:builder_mhrs/model/weapon/Arme.dart';
import 'package:builder_mhrs/model/weapon/tranchant/CornedeChasse.dart';
import 'package:builder_mhrs/model/weapon/tranchant/Insectoglaive.dart';
import 'package:builder_mhrs/model/weapon/tranchant/Lancecanon.dart';
import 'package:builder_mhrs/model/weapon/tranchant/MorphoHache.dart';
import 'package:builder_mhrs/model/weapon/tranchant/VoltoHache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget g(Stuff s, BuildContext context) {
  return Card(
      color: primary,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        gSpeArme(s, context, false),
        Container(color: primary, child: gDef(s, context, false)),
        Container(color: primary, child: gOff(s, context, false)),
        if (s.weapon.idElement != 0)
          Container(color: primary, child: gElem(s, context, false)),
        if (s.weapon is Tranchant) const Divider(color: Colors.black),
        if (s.weapon is Tranchant)
          Container(color: primary, child: gSharp(s, context, false)),
      ]));
}

Widget gSharp(Stuff s, BuildContext context, bool img) {
  return Column(children: [
    title(AppLocalizations.of(context)!.sharp),
    sharpG(s, context, img),
  ]);
}

Widget gElem(Stuff s, BuildContext context, bool img) {
  String t1, t2, t3;
  t1 =
      "${s.weapon.idElement <= 5 ? AppLocalizations.of(context)!.efe : AppLocalizations.of(context)!.efa} : ${efe(s)}";
  t2 =
      "${s.weapon.idElement <= 5 ? AppLocalizations.of(context)!.tre : AppLocalizations.of(context)!.tra} : ${elem(s)}";
  t3 = s.weapon.idElement <= 5
      ? "${AppLocalizations.of(context)!.elemCritMultip} : x${critElem(s)}"
      : "${AppLocalizations.of(context)!.accAffli} : ~${affBuildup(s)}";
  return Column(children: [
    const Divider(color: Colors.black),
    title(AppLocalizations.of(context)!.e),
    Container(
        margin: const EdgeInsets.all(5),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            img ? black(t1) : white(t1),
            const SizedBox(width: 3),
            Image.asset(element(s.weapon.idElement), height: 16, width: 16),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            img ? black(t2) : white(t2),
            const SizedBox(width: 3),
            Image.asset(element(s.weapon.idElement), height: 16, width: 16),
          ]),
          Center(child: img ? black(t3) : white(t3))
        ]))
  ]);
}

Widget gOff(Stuff s, BuildContext context, bool img) {
  String txtEfr = "${AppLocalizations.of(context)!.efr} : ${efr(s)}",
      txtEfe = "${AppLocalizations.of(context)!.trr} : ${row(s).toString()}",
      txtAff = "${AppLocalizations.of(context)!.aff} : ${affinite(s)}%",
      txtCritMultip =
          "${AppLocalizations.of(context)!.critMultip} : ${getBerserk(s.getTalentValueById(22), s).toString()}";
  return Column(children: [
    const Divider(color: Colors.black),
    title(AppLocalizations.of(context)!.att),
    Container(
        margin: const EdgeInsets.all(5),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(children: [
            img ? black(txtEfr) : white(txtEfr),
            img ? black(txtEfe) : white(txtEfe),
            img
                ? switchColorBlack(txtAff, 100, s.affinite)
                : switchColorWhite(txtAff, 100, s.affinite),
            img ? black(txtCritMultip) : white(txtCritMultip),
          ])
        ]))
  ]);
}

Widget gDef(Stuff s, BuildContext context, bool img) {
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
  return Column(children: [
    title(AppLocalizations.of(context)!.def),
    Container(
        margin: const EdgeInsets.all(5),
        color: img ? fourth : primary,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            img
                ? statDefSimplyImg(vie, s.florelet.uVie + 150)
                : statDefSimply(vie, s.florelet.uVie + 150),
            img
                ? statDefSimplyImg(stam, s.florelet.uStam + 150)
                : statDefSimply(stam, s.florelet.uStam + 150),
            img
                ? statDefSimplyImg(def, defense(s))
                : statDefSimply(def, defense(s))
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            img ? statDefSimplyImg(feu, fire) : statDefSimply(feu, fire),
            img ? statDefSimplyImg(eau, water) : statDefSimply(eau, water),
            img
                ? statDefSimplyImg(foudre, thunder)
                : statDefSimply(foudre, thunder)
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            img ? statDefSimplyImg(glace, ice) : statDefSimply(glace, ice),
            img ? statDefSimplyImg(dragon, drag) : statDefSimply(dragon, drag)
          ])
        ]))
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

Widget calamJowelImg(Stuff s, BuildContext context) {
  return Card(
      color: primary,
      child: Container(
          padding: const EdgeInsets.all(5),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            title("${AppLocalizations.of(context)!.calamJowel} : "),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              s.joyauxCalam.slot != 0
                  ? Row(children: [
                      white(
                        s.joyauxCalam.talentName,
                      ),
                      const SizedBox(width: 5),
                      Image.asset(slotCalam(s.weapon.slotCalamite),
                          height: 22, width: 22),
                    ])
                  : white(AppLocalizations.of(context)!.none),
            ])
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

Widget recapTalentImg(Stuff s, BuildContext context) {
  return Column(children: [
    if (s.weapon.niveau == "maitre") calamJowelImg(s, context),
    for (var skill in s.getAllTalents().entries)
      Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: skill.key.actif ? fifth : Colors.blueGrey, width: 2),
            borderRadius: BorderRadius.circular(5),
            color: fourth,
          ),
          margin: const EdgeInsets.only(bottom: 1, top: 1, left: 5, right: 5),
          child: Column(children: [
            switchColorBlack(skill.key.name, skill.key.levelMax, skill.value),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(child: SkillNumLogo(skill.value, skill.key.levelMax)),
              Container(
                  child: switchColorBlack(
                      "${AppLocalizations.of(context)!.niv} ${skill.value}",
                      skill.key.levelMax,
                      skill.value))
            ])
          ]))
  ]);
}

Widget statOff(Arme weapon, BuildContext context) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
    statWhite(attaque, weapon.attaque.toString()),
    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Image.asset(affi, height: 16, width: 16),
      const SizedBox(width: 5),
      white("${weapon.affinite.toString()}%")
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

gKinsectImg(Stuff s, BuildContext context) {
  Kinsect k = s.kinsect;
  Insectoglaive i = s.weapon as Insectoglaive;
  return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          afficheImgKinsect(),
          title(AppLocalizations.of(context)!.insect)
        ]),
        Text(k.name),
        statKinsect(k, i, true),
        Text(getTypeAttack(k.typeAttaque, context)),
        boostKinsect(k, context, true),
        Text(getBoostKinsect(k.bonusKinsect, context))
      ]));
}

Widget statKinsect(Kinsect k, Insectoglaive i, bool img) {
  if (img) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      similyCardKinsectValue(
          statWhite(kAtt, k.niveauKinsect[i.niveauKinsect][0].toString())),
      similyCardKinsectValue(
          statWhite(kVit, k.niveauKinsect[i.niveauKinsect][1].toString())),
      similyCardKinsectValue(
          statWhite(kHeal, k.niveauKinsect[i.niveauKinsect][2].toString()))
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

gSpeArme(Stuff s, BuildContext context, bool img) {
  Arme w = s.weapon;
  if (w is Lancecanon ||
      w is MorphoHache ||
      w is VoltoHache ||
      w is Insectoglaive) {
    return Column(children: [
      title(AppLocalizations.of(context)!.specArme),
      if (w is Lancecanon) lancecanon(w, context, img),
      if (w is MorphoHache) morpho(s, context, img),
      if (w is VoltoHache) volto(w, context, img),
      if (w is Insectoglaive) insecto(w, context, img),
      const Divider(color: Colors.black)
    ]);
  } else if (w is Fusarbalete) {
    String mod =
            "${AppLocalizations.of(context)!.mod} : ${getMod(w.mod, w, context)}",
        tirSpe = getTirSpe(w, context),
        devia = w.sensDeviation != 0
            ? '${AppLocalizations.of(context)!.devia} : ${getDeviation(w.sensDeviation, context)} ${getValueDeviation(w.puissanceDeviation, context)}'
            : '${AppLocalizations.of(context)!.devia} : ${getDeviation(w.sensDeviation, context)}',
        recul =
            '${AppLocalizations.of(context)!.recul} ${getRecul(w.recul, context)}',
        rechargement =
            '${AppLocalizations.of(context)!.recharge} ${getRechargement(w.rechargement, context)}';
    return Column(children: [
      title(AppLocalizations.of(context)!.specArme),
      img ? black(mod) : white(mod),
      img ? black(tirSpe) : white(tirSpe),
      img ? black(devia) : white(devia),
      img ? black(recul) : white(recul),
      img ? black(rechargement) : white(rechargement),
      const Divider(color: Colors.black)
    ]);
  } else {
    return Container();
  }
}
