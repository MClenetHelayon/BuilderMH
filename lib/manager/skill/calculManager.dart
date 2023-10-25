import '../../object/Stuff.dart';
import '../../object/ITranchant.dart';
import 'affiniteManager.dart' as aff;
import 'brutManager.dart' as att;
import 'defenseManager.dart' as def;

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

int affinite(Stuff s) {
  int vretour = s.weapon.affinite;
  if (s.getTalentById(87) != 0) {
    vretour += aff.getMaitre(s.getTalentById(87));
  }
  if (s.getTalentById(94) != 0) {
    vretour += aff.getMaM(s.getTalentById(94));
  }
  if (s.getTalentById(132) != 0) {
    vretour += aff.getTemerite(s.getTalentById(132));
  }
  if (s.getTalentById(61) != 0) {
    vretour += aff.getForceLatente(s.getTalentById(61));
  }
  if (s.getTalentById(42) != 0) {
    vretour += aff.getCorpsEtAme(s.getTalentById(42));
  }
  if (s.getTalentById(50) != 0) {
    vretour += aff.getDegainage(s.getTalentById(50));
  }
  return vretour;
}

int row(Stuff s) {
  double vretour = (s.weapon.attaque).toDouble() + (s.florelet.gAtt).toDouble(),
      base = vretour;
  if (s.getTalentById(78) != 0) {
    vretour += att.getMachine(s.getTalentById(78), base);
  }
  if (s.getTalentById(16) != 0) {
    vretour += att.getBatto(s.getTalentById(16));
  }
  if (s.getTalentById(39) != 0) {
    vretour += att.getContreAttaque(s.getTalentById(39));
  }
  if (s.getTalentById(143) != 0) {
    vretour += att.getVengeance(s.getTalentById(143));
  }

  if (s.getTalentById(142) != 0) {
    vretour += att.getVendetta(s.getTalentById(142));
  }

  if (s.getTalentById(107) != 0) {
    vretour += att.getPeakPerf(s.getTalentById(107));
  }
  if (s.getTalentById(132) != 0) {
    vretour += att.getTemerite(s.getTalentById(132));
  }
  if (s.getTalentById(55) != 0) {
    vretour += att.getEspritIndomptable(s.getTalentById(55));
  }
  if (s.getTalentById(62) != 0) {
    vretour += att.getGardOff(s.getTalentById(62), base);
  }
  if (s.getTalentById(46) > 3) {
    vretour += att.getDragonHeart(s.getTalentById(46), base);
  }
  if (s.getTalentById(68) > 1) {
    vretour += att.getHeroisme(s.getTalentById(68), base);
  }
  if (s.getTalentById(89) != 0 && s.sharpRaw < 1.2 && s.sharpRaw > 0.8) {
    vretour += att.getMatraquage(s.getTalentById(89), base);
  }
  if (s.getTalentById(74) != 0) {
    vretour += att.getJV(s.getTalentById(74), base);
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
  if (s.getTalentById(17) != 0) {
    vretour += def.getBastionDef(s.getTalentById(17), vretour);
  }
  if (s.getTalentById(69) != 0) {
    vretour += def.getDefInDefElem(s.getTalentById(69));
  }
  if (s.getTalentById(56) != 0) {
    vretour += def.getDefInDefElem(s.getTalentById(56));
  }
  if (s.getTalentById(105) != 0) {
    vretour += def.getDefInDefElem(s.getTalentById(105));
  }
  if (s.getTalentById(10) != 0) {
    vretour += def.getDefInDefElem(s.getTalentById(10));
  }
  if (s.getTalentById(146) != 0) {
    vretour += def.getDefInDefElem(s.getTalentById(146));
  }
  if (s.getTalentById(68) != 0) {
    vretour += def.getHeroisme(s.getTalentById(68));
  }
  if (s.getTalentById(74) != 0) {
    vretour += def.getJV(s.getTalentById(74), vretour);
  }
  return vretour.round();
}

int defElem(int i, Stuff s) {
  int vretour = i;
  if (s.getTalentById(17) > 3) {
    vretour += def.getBastionElem(s.getTalentById(17));
  }
  return vretour;
}

int defFeu(Stuff s) {
  int vretour = defElem(
      s.helmet.feu + s.torso.feu + s.gant.feu + s.boucle.feu + s.pied.feu, s);
  if (s.getTalentById(69) != 0) {
    vretour += def.getDefElem(s.getTalentById(69));
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
  if (s.getTalentById(105) != 0) {
    vretour += def.getDefElem(s.getTalentById(105));
  }
  if (s.getTalentById(5) != 0) {
    vretour += def.getAlignement(s.getTalentById(5));
  }
  vretour = dragonHeart(vretour, s);
  return vretour;
}

int defEau(Stuff s) {
  int vretour = defElem(
      s.helmet.eau + s.torso.eau + s.gant.eau + s.boucle.eau + s.pied.eau, s);
  if (s.getTalentById(56) != 0) {
    vretour += def.getDefElem(s.getTalentById(56));
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
  if (s.getTalentById(10) != 0) {
    vretour += def.getDefElem(s.getTalentById(10));
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
  if (s.getTalentById(146) != 0) {
    vretour += def.getDefElem(s.getTalentById(146));
  }
  if (s.getTalentById(4) != 0) {
    vretour += def.getAlignement(s.getTalentById(4));
  }
  vretour = dragonHeart(vretour, s);
  return vretour;
}

int dragonHeart(int i, Stuff s) {
  int vretour = i;
  if (s.getTalentById(46) != 0) {
    vretour = def.getDragonHeart(s.getTalentById(46));
  }
  return vretour;
}

int elem(Stuff s) {
  int vretour = s.weapon.element;
  return vretour;
}
