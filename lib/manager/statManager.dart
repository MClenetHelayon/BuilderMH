import 'package:builder_mhrs/manager/weaponManager.dart';
import 'package:builder_mhrs/object/Armure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../object/Stuff.dart';
import '../object/weapon/Arme.dart';
import 'skill/calculManager.dart';
import 'imgManager.dart';
import 'skill/affiniteManager.dart';
import 'sharpManager.dart';
import 'textManager.dart';

Widget g(Stuff s, BuildContext context) {
  return Card(
      color: Colors.black,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        gSimplyCard(0, s, context),
        gSimplyCard(1, s, context),
        if (s.weapon.idElement != 0) gSimplyCard(2, s, context),
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
              blue(
                  "${s.weapon.idElement <= 5 ? AppLocalizations.of(context)!.efe : AppLocalizations.of(context)!.efa} : ${efe(s)}"),
              const SizedBox(width: 3),
              Image.asset(element(s.weapon.idElement), height: 16, width: 16),
            ]),
            Row(children: [
              blue(
                  "${s.weapon.idElement <= 5 ? AppLocalizations.of(context)!.tre : AppLocalizations.of(context)!.tra} : ${elem(s)}"),
              const SizedBox(width: 3),
              Image.asset(element(s.weapon.idElement), height: 16, width: 16),
            ])
          ]),
          Column(children: [
            blue(
                "${AppLocalizations.of(context)!.elemCritMultip} : x${s.critElem}"),
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
          blue("${AppLocalizations.of(context)!.efr} : ${efr(s)}"),
          blue("${AppLocalizations.of(context)!.trr} : ${row(s).toString()}"),
          blue(
              "${AppLocalizations.of(context)!.petalAtt} : ${s.florelet.uAtt.toString()}"),
        ]),
        Column(children: [
          switchColor("${AppLocalizations.of(context)!.aff} : ${affinite(s)}%",
              100, s.affinite),
          blue(
              "${AppLocalizations.of(context)!.critMultip} : ${getBerserk(s.getTalentById(22), s).toString()}"),
        ])
      ]),
    )
  ]);
}

Widget gDef(Stuff s, BuildContext context) {
  return Column(
    children: [
      title(AppLocalizations.of(context)!.def),
      Card(
          color: Colors.black,
          child: Container(
              margin: const EdgeInsets.all(5),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      gDefSimply(
                          "images/elementaire/Vie.png", s.florelet.uVie + 150),
                      gDefSimply("images/elementaire/Stam.png",
                          s.florelet.uStam + 150),
                    ]),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      gDefSimply("images/elementaire/Defense.png", defense(s)),
                      gDefSimply("images/elementaire/Feu.webp", defFeu(s)),
                      gDefSimply("images/elementaire/Eau.webp", defEau(s)),
                      gDefSimply(
                          "images/elementaire/Foudre.webp", defFoudre(s)),
                      gDefSimply("images/elementaire/Glace.webp", defGlace(s)),
                      gDefSimply(
                          "images/elementaire/Dragon.webp", defDragon(s)),
                    ])
                  ])))
    ],
  );
}

Widget calamJowel(Stuff s, BuildContext context) {
  return Card(
      color: Colors.black,
      child: Container(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              blue("${AppLocalizations.of(context)!.calamJowel} : "),
              s.joyauxCalam.slot != 0
                  ? Row(children: [
                      blue(
                        s.joyauxCalam.talentName,
                      ),
                      const SizedBox(width: 5),
                      Image.asset(slotCalam(s.weapon.slotCalamite),
                          height: 22, width: 22),
                    ])
                  : blue(AppLocalizations.of(context)!.none),
            ],
          )));
}

Widget recapTalent(Stuff s, BuildContext context) {
  return Card(
      color: Colors.black,
      child: Column(children: [
        title(AppLocalizations.of(context)!.talent),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(children: [
            for (var skill in s.getAllTalents().entries)
              Card(
                color: const Color.fromARGB(255, 60, 60, 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    switchColor('${skill.key.name} : ', skill.key.levelMax,
                        skill.value),
                    switchColor('${skill.value} / ${skill.key.levelMax}',
                        skill.key.levelMax, skill.value)
                  ],
                ),
              )
          ])
        ])
      ]));
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
  return Card(
      color: Colors.black,
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(8.0), // Arrondi des coins de la Card
        side: const BorderSide(
            width: 2.0, color: Colors.blue), // Bordure fixe de 2px
      ),
      child: function);
}

Widget statOff(Arme weapon, BuildContext context) {
  Widget attaque =
      printStat("images/elementaire/Attaque.webp", weapon.attaque.toString());
  Widget defense =
      printStat("images/elementaire/Defense.png", weapon.defense.toString());
  Widget affinite =
      Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
    Image.asset("images/elementaire/Affinite.webp", height: 16, width: 16),
    const SizedBox(width: 5),
    Text("${weapon.affinite.toString()}%",
        style: const TextStyle(color: Colors.blue)),
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
      printStat("images/elementaire/Defense.png", armor.defense.toString()),
      printStat("images/elementaire/Feu.webp", armor.feu.toString()),
      printStat("images/elementaire/Eau.webp", armor.eau.toString()),
      printStat("images/elementaire/Foudre.webp", armor.foudre.toString()),
      printStat("images/elementaire/Glace.webp", armor.glace.toString()),
      printStat("images/elementaire/Dragon.webp", armor.dragon.toString())
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
