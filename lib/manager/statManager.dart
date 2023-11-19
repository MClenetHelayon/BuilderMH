import 'package:builder_mhrs/manager/colorManager.dart';
import 'package:builder_mhrs/manager/weaponManager.dart';
import 'package:builder_mhrs/object/Armure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../object/Kinsect.dart';
import '../object/Stuff.dart';
import '../object/weapon/Arc.dart';
import '../object/weapon/Arme.dart';
import '../object/weapon/tranchant/CornedeChasse.dart';
import '../object/weapon/tranchant/Insectoglaive.dart';
import '../object/weapon/tranchant/Lancecanon.dart';
import '../object/weapon/tranchant/MorphoHache.dart';
import '../object/weapon/tranchant/VoltoHache.dart';
import 'local/arme/cbTypeFiole.dart';
import 'local/arme/fusarb/getDeviation.dart';
import 'local/arme/fusarb/getMod.dart';
import 'local/arme/fusarb/getRechargement.dart';
import 'local/arme/fusarb/getRecul.dart';
import 'local/arme/fusarb/getTirSpe.dart';
import 'local/arme/glTypeCanon.dart';
import 'local/arme/saTypeFiole.dart';
import 'skill/calculManager.dart';
import 'imgManager.dart';
import 'skill/affiniteManager.dart';
import 'sharpManager.dart';
import 'textManager.dart';
import 'weapon/bowManager.dart';

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
  return Column(
    children: [
      title(AppLocalizations.of(context)!.sharp),
      sharpG(s, context),
    ],
  );
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
          ]),
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
          white("${AppLocalizations.of(context)!.trr} : ${row(s).toString()}"),
          white(
              "${AppLocalizations.of(context)!.petalAtt} : ${s.florelet.uAtt.toString()}"),
          switchColor("${AppLocalizations.of(context)!.aff} : ${affinite(s)}%",
              100, s.affinite),
          white(
              "${AppLocalizations.of(context)!.critMultip} : ${getBerserk(s.getTalentById(22), s).toString()}"),
        ])
      ]),
    )
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
            gDefSimply("images/elementaire/Vie.png", s.florelet.uVie + 150),
            gDefSimply("images/elementaire/Stam.png", s.florelet.uStam + 150),
            gDefSimply("images/elementaire/Defense.png", defense(s)),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            gDefSimply("images/elementaire/Feu.webp", defFeu(s)),
            gDefSimply("images/elementaire/Eau.webp", defEau(s)),
            gDefSimply("images/elementaire/Foudre.webp", defFoudre(s)),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            gDefSimply("images/elementaire/Glace.webp", defGlace(s)),
            gDefSimply("images/elementaire/Dragon.webp", defDragon(s)),
          ])
        ]))
  ]);
}

Widget calamJowel(Stuff s, BuildContext context) {
  return Card(
      color: getPrimary(),
      child: Container(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              title("${AppLocalizations.of(context)!.calamJowel} : "),
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
            ],
          )));
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
                      switchColor('${skill.key.name} : ', skill.key.levelMax,
                          skill.value),
                      switchColor('${skill.value} / ${skill.key.levelMax}',
                          skill.key.levelMax, skill.value)
                    ],
                  ),
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
  Widget attaque = printStatWhite(
      "images/elementaire/Attaque.webp", weapon.attaque.toString());
  Widget defense = printStatWhite(
      "images/elementaire/Defense.png", weapon.defense.toString());
  Widget affinite =
      Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
    Image.asset("images/elementaire/Affinite.webp", height: 16, width: 16),
    const SizedBox(width: 5),
    Text("${weapon.affinite.toString()}%",
        style: TextStyle(color: getFourth())),
  ]);
  Widget elem = isDualBlade(weapon, context);
  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [attaque, affinite, elem, defense]);
}

Widget statDef(Armure armor) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      printStatWhite(
          "images/elementaire/Defense.png", armor.defense.toString()),
      printStatWhite("images/elementaire/Feu.webp", armor.feu.toString()),
      printStatWhite("images/elementaire/Eau.webp", armor.eau.toString()),
      printStatWhite("images/elementaire/Foudre.webp", armor.foudre.toString()),
      printStatWhite("images/elementaire/Glace.webp", armor.glace.toString()),
      printStatWhite("images/elementaire/Dragon.webp", armor.dragon.toString())
    ],
  );
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
  if (tranch.sharpBoost.length != 0) {
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
        child: Text(
          i < level ? "▰" : "▱",
        ),
      )
  ]);
}

gKinsect(Stuff s, BuildContext context) {
  Kinsect k = s.kinsect;
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
                  icon: Image.asset(
                    'images/arme/kinsect.png',
                    fit: BoxFit.fill,
                  ))),
          Container(
            margin: const EdgeInsets.only(bottom: 3),
            child: Column(children: [
              title(AppLocalizations.of(context)!.insect),
              title(k.name),
            ]),
          )
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          printStatWhite(
            "images/elementaire/AttKinsect.png",
            k.niveauKinsect[(s.weapon as Insectoglaive).niveauKinsect][0]
                .toString(),
          ),
          printStatWhite(
            "images/elementaire/VitKinsect.png",
            k.niveauKinsect[(s.weapon as Insectoglaive).niveauKinsect][1]
                .toString(),
          ),
          printStatWhite(
            "images/elementaire/HealKinsect.png",
            k.niveauKinsect[(s.weapon as Insectoglaive).niveauKinsect][2]
                .toString(),
          ),
        ]),
        white(k.typeAttaque),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          white(k.typeKinsect[0]),
          if (k.typeKinsect.length > 1) white(k.typeKinsect[1]),
        ]),
        white(k.bonusKinsect)
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
  return Card(
      margin: const EdgeInsets.all(5),
      color: getPrimary(),
      child: Column(children: [
        title(AppLocalizations.of(context)!.music),
        printMusic(musique(0), horn.musique[0].name),
        printMusic(musique(1), horn.musique[1].name),
        printMusic(musique(2), horn.musique[2].name),
      ]));
}

Widget printMusic(String img, String stat) {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    Image.asset(img, height: 40, width: 40),
    const SizedBox(width: 3),
    white(stat),
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
                      children: [
                        typeShoot(bow, context, s.getTalentById(82))
                      ])),
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
      white(vretour),
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
