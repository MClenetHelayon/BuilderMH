import 'package:builder_mhrs/object/Stuff.dart';
import 'package:builder_mhrs/object/weapon/Arme.dart';
import '../mh/skill/affiniteManager.dart' as aff;
import '../mh/skill/brutManager.dart' as att;
import '../mh/skill/defenseManager.dart' as def;

String efr(Stuff s) {
  return (row(s) * s.sharpRaw * (1 + (s.affinite / 100) * (s.critBoost - 1)))
      .toStringAsFixed(1);
}

String efe(Stuff s) {
  return (elem(s) * s.sharpElem * (1 + (s.affinite / 100) * (s.critElem - 1)))
      .toStringAsFixed(1);
}

int sharp(Stuff s, int idColor) {
  Tranchant sharp = s.weapon as Tranchant;
  int vretour = 0;
  if (sharp.sharpBoost[0] == idColor && s.nbSavoirFaire >= 1) vretour += 10;
  if (sharp.sharpBoost[1] == idColor && s.nbSavoirFaire >= 2) vretour += 10;
  if (sharp.sharpBoost[2] == idColor && s.nbSavoirFaire >= 3) vretour += 10;
  if (sharp.sharpBoost[3] == idColor && s.nbSavoirFaire >= 4) vretour += 10;
  if (sharp.sharpBoost[4] == idColor && s.nbSavoirFaire >= 5) vretour += 10;
  return vretour;
}

num affinite(Stuff s) {
  num vretour = s.weapon.affinite;
  if (Arme.augments) {
    vretour += (Arme.transcendance.aff).toDouble();
  }
  if (s.getTalentValueById(87) != 0) {
    vretour += aff.getMaitre(s.getTalentValueById(87));
  }
  if (s.getTalentValueById(94) != 0) {
    vretour += aff.getMaM(s.getTalentValueById(94), s.getTalentById(94).actif);
  }
  if (s.getTalentValueById(132) != 0) {
    vretour +=
        aff.getTemerite(s.getTalentValueById(132), s.getTalentById(94).actif);
  }
  if (s.getTalentValueById(61) != 0) {
    vretour += aff.getForceLatente(
        s.getTalentValueById(61), s.getTalentById(94).actif);
  }
  if (s.getTalentValueById(42) != 0) {
    vretour +=
        aff.getCorpsEtAme(s.getTalentValueById(42), s.getTalentById(94).actif);
  }
  if (s.getTalentValueById(50) != 0) {
    vretour +=
        aff.getDegainage(s.getTalentValueById(50), s.getTalentById(94).actif);
  }
  return vretour;
}

int row(Stuff s) {
  double vretour = (s.weapon.attaque).toDouble() + (s.florelet.gAtt).toDouble(),
      base = vretour;
  if (Arme.augments) {
    vretour += (Arme.transcendance.att).toDouble();
  }
  if (s.getTalentValueById(78) != 0) {
    vretour += att.getMachine(s.getTalentValueById(78), base);
  }
  if (s.getTalentValueById(16) != 0) {
    vretour += att.getBatto(s.getTalentValueById(16));
  }
  if (s.getTalentValueById(39) != 0) {
    vretour += att.getContreAttaque(
        s.getTalentValueById(39), s.getTalentById(94).actif);
  }
  if (s.getTalentValueById(143) != 0) {
    vretour +=
        att.getVengeance(s.getTalentValueById(143), s.getTalentById(94).actif);
  }
  if (s.getTalentValueById(142) != 0) {
    vretour +=
        att.getVendetta(s.getTalentValueById(142), s.getTalentById(94).actif);
  }
  if (s.getTalentValueById(107) != 0) {
    vretour +=
        att.getPeakPerf(s.getTalentValueById(107), s.getTalentById(94).actif);
  }
  if (s.getTalentValueById(132) != 0) {
    vretour +=
        att.getTemerite(s.getTalentValueById(132), s.getTalentById(94).actif);
  }
  if (s.getTalentValueById(55) != 0) {
    vretour += att.getEspritIndomptable(
        s.getTalentValueById(55), s.getTalentById(94).actif);
  }
  if (s.getTalentValueById(62) != 0) {
    vretour += att.getGardOff(
        s.getTalentValueById(62), base, s.getTalentById(94).actif);
  }
  if (s.getTalentValueById(46) > 3) {
    vretour += att.getDragonHeart(
        s.getTalentValueById(46), base, s.getTalentById(94).actif);
  }
  if (s.getTalentValueById(68) > 1) {
    vretour += att.getHeroisme(
        s.getTalentValueById(68), base, s.getTalentById(94).actif);
  }
  if (s.getTalentValueById(89) != 0 && s.sharpRaw < 1.2 && s.sharpRaw > 0.8) {
    vretour += att.getMatraquage(s.getTalentValueById(89), base);
  }
  if (s.getTalentValueById(74) != 0) {
    vretour +=
        att.getJV(s.getTalentValueById(74), base, s.getTalentById(94).actif);
  }
  return vretour.round();
}

int defense(Stuff s) {
  double vretour = (s.helmet.defense +
          s.torso.defense +
          s.gant.defense +
          s.boucle.defense +
          s.pied.defense +
          s.weapon.defense +
          s.florelet.gDef)
      .toDouble();
  if (s.getTalentValueById(17) != 0) {
    vretour += def.getBastionDef(s.getTalentValueById(17), vretour);
  }
  if (s.getTalentValueById(69) != 0) {
    vretour += def.getDefInDefElem(s.getTalentValueById(69));
  }
  if (s.getTalentValueById(56) != 0) {
    vretour += def.getDefInDefElem(s.getTalentValueById(56));
  }
  if (s.getTalentValueById(105) != 0) {
    vretour += def.getDefInDefElem(s.getTalentValueById(105));
  }
  if (s.getTalentValueById(10) != 0) {
    vretour += def.getDefInDefElem(s.getTalentValueById(10));
  }
  if (s.getTalentValueById(146) != 0) {
    vretour += def.getDefInDefElem(s.getTalentValueById(146));
  }
  if (s.getTalentValueById(68) != 0) {
    vretour +=
        def.getHeroisme(s.getTalentValueById(68), s.getTalentById(94).actif);
  }
  if (s.getTalentValueById(74) != 0) {
    vretour +=
        def.getJV(s.getTalentValueById(74), vretour, s.getTalentById(94).actif);
  }
  return vretour.round();
}

int defElem(int i, Stuff s) {
  int vretour = i;
  if (s.getTalentValueById(17) > 3) {
    vretour += def.getBastionElem(s.getTalentValueById(17));
  }
  return vretour;
}

int defFeu(Stuff s) {
  int vretour = defElem(
      s.helmet.feu + s.torso.feu + s.gant.feu + s.boucle.feu + s.pied.feu, s);
  if (s.getTalentValueById(69) != 0) {
    vretour += def.getDefElem(s.getTalentValueById(69));
  }
  vretour = dragonHeart(vretour, s);
  return vretour;
}

int defFoudre(Stuff s) {
  int vretour = defElem(
      s.helmet.foudre +
          s.torso.foudre +
          s.gant.foudre +
          s.boucle.foudre +
          s.pied.foudre,
      s);
  if (s.getTalentValueById(105) != 0) {
    vretour += def.getDefElem(s.getTalentValueById(105));
  }
  if (s.getTalentValueById(5) != 0) {
    vretour += def.getAlignement(s.getTalentValueById(5));
  }
  vretour = dragonHeart(vretour, s);
  return vretour;
}

int defEau(Stuff s) {
  int vretour = defElem(
      s.helmet.eau + s.torso.eau + s.gant.eau + s.boucle.eau + s.pied.eau, s);
  if (s.getTalentValueById(56) != 0) {
    vretour += def.getDefElem(s.getTalentValueById(56));
  }
  vretour = dragonHeart(vretour, s);
  return vretour;
}

int defGlace(Stuff s) {
  int vretour = defElem(
      s.helmet.glace +
          s.torso.glace +
          s.gant.glace +
          s.boucle.glace +
          s.pied.glace,
      s);
  if (s.getTalentValueById(10) != 0) {
    vretour += def.getDefElem(s.getTalentValueById(10));
  }
  vretour = dragonHeart(vretour, s);
  return vretour;
}

int defDragon(Stuff s) {
  int vretour = defElem(
      s.helmet.dragon +
          s.torso.dragon +
          s.gant.dragon +
          s.boucle.dragon +
          s.pied.dragon,
      s);
  if (s.getTalentValueById(146) != 0) {
    vretour += def.getDefElem(s.getTalentValueById(146));
  }
  if (s.getTalentValueById(4) != 0) {
    vretour += def.getAlignement(s.getTalentValueById(4));
  }
  vretour = dragonHeart(vretour, s);
  return vretour;
}

int dragonHeart(int i, Stuff s) {
  int vretour = i;
  if (s.getTalentValueById(46) != 0) {
    vretour =
        def.getDragonHeart(s.getTalentValueById(46), s.getTalentById(94).actif);
  }

  return vretour;
}

int elem(Stuff s) {
  int vretour = s.weapon.element;
  if (Arme.augments) {
    if (s.weapon.idElement <= 5) vretour += (Arme.transcendance.elem).toInt();
    if (s.weapon.idElement >= 6) vretour += (Arme.transcendance.affl).toInt();
  }
  return vretour;
}
