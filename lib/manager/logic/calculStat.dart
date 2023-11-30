import 'package:builder_mhrs/object/Stuff.dart';
import 'package:builder_mhrs/object/weapon/Arme.dart';
import 'package:builder_mhrs/manager/mh/skill/affiniteManager.dart' as aff;
import 'package:builder_mhrs/manager/mh/skill/brutManager.dart' as att;
import 'package:builder_mhrs/manager/mh/skill/defenseManager.dart' as def;
import 'package:builder_mhrs/manager/mh/skill/elementManager.dart' as ele;
import 'package:builder_mhrs/manager/mh/skill/afflictionManager.dart' as affli;

String efr(Stuff s) {
  return (row(s) * s.sharpRaw * (1 + (s.affinite / 100) * (s.critBoost - 1)))
      .toStringAsFixed(1);
}

String efe(Stuff s) {
  return (elem(s) * s.sharpElem * (1 + (s.affinite / 100) * (s.critElem - 1)))
      .toStringAsFixed(1);
}

String affBuildup(Stuff s) {
  return (buildup(s)).toStringAsFixed(1);
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
  if (s.getTalentValueById(70) != 0) {
    vretour +=
        aff.getIncursion(s.getTalentValueById(70), s.getTalentById(94).actif);
  }
  if (s.getTalentValueById(77) != 0) {
    vretour +=
        aff.getLutte(s.getTalentValueById(77), s.getTalentById(94).actif);
  }
  if (s.getTalentValueById(128) != 0) {
    vretour +=
        aff.getSoifDeSang(s.getTalentValueById(128), s.getTalentById(94).actif);
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
    vretour += att.getVendetta(
        s.getTalentValueById(142), s.getTalentById(94).actif, s.weapon);
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

  if (s.getTalentValueById(70) != 0) {
    vretour +=
        att.getIncursion(s.getTalentValueById(70), s.getTalentById(70).actif);
  }
  if (s.getTalentValueById(111) != 0) {
    vretour += att.getAdrenaline(
        s.getTalentValueById(111), s.getTalentById(111).actif);
  }
  if (s.getTalentValueById(140) != 0) {
    vretour +=
        att.getUnion(s.getTalentValueById(140), s.getTalentById(140).actif);
  }
  if (s.getTalentValueById(14) != 0) {
    vretour += att.getFurtif(
        s.getTalentValueById(14), vretour, s.getTalentById(14).actif);
  }
  if (s.getTalentValueById(57) != 0) {
    vretour += att.getEveilDeSang(
        s.getTalentValueById(57), s.getTalentById(57).actif, s.weapon);
  }
  if (s.getTalentValueById(128) != 0) {
    vretour += att.getSoifDeSang(
        s.getTalentValueById(128), s.getTalentById(128).actif);
  }
  if (s.getTalentValueById(0) != 0) {
    vretour +=
        att.getAbandon(s.getTalentValueById(0), s.getTalentById(0).actif);
  }
  if (s.getTalentValueById(41) != 0) {
    vretour += att.getMailOfHellFire(
        s.getTalentValueById(41), s.getTalentById(41).actif);
  }
  if (s.weapon.idElement >= 6) {
    if (s.getTalentValueById(26) != 0) {
      vretour += att.getBuildUpBoost(
          s.getTalentValueById(26), base, s.getTalentById(26).actif);
    }
  }

  if (s.getTalentValueById(74) != 0) {
    vretour +=
        att.getJV(s.getTalentValueById(74), base, s.getTalentById(74).actif);
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
  if (s.getTalentValueById(49) != 0) {
    vretour +=
        def.getDefiance(s.getTalentValueById(49), s.getTalentById(94).actif);
  }
  if (s.getTalentValueById(102) != 0) {
    vretour +=
        def.getFuriousDef(s.getTalentValueById(102), s.getTalentById(94).actif);
  }
  if (s.getTalentValueById(141) != 0) {
    vretour +=
        def.getVaillance(s.getTalentValueById(141), s.getTalentById(94).actif);
  }
  if (s.getTalentValueById(41) != 0) {
    vretour -= def.getMailOfHellFireDef(
        s.getTalentValueById(41), s.getTalentById(41).actif);
  }
  return vretour.round();
}

int defElem(int i, Stuff s) {
  int vretour = i;
  if (s.getTalentValueById(17) > 3) {
    vretour += def.getBastionElem(s.getTalentValueById(17));
  }
  if (s.getTalentValueById(102) != 0) {
    vretour += def.getFuriousElem(
        s.getTalentValueById(102), s.getTalentById(94).actif);
  }
  if (s.getTalentValueById(41) != 0) {
    vretour -= def.getMailOfHellFireDefElem(
        s.getTalentValueById(41), s.getTalentById(41).actif);
  }
  if (s.getTalentValueById(40) != 0) {
    vretour += def.getDragonConversionBlue(
        s.getTalentValueById(40), s.getTalentById(40).actif);
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

int defConvDragonRed() {
  return 0;
}

double elem(Stuff s) {
  double vretour = s.weapon.element.toDouble();
  if (Arme.augments) {
    if (s.weapon.idElement <= 5) vretour += (Arme.transcendance.elem).toInt();
    if (s.weapon.idElement >= 6) vretour += (Arme.transcendance.affl).toInt();
  }
  if (s.weapon.idElement <= 5) {
    if (s.getTalentValueById(128) != 0) {
      vretour += ele.getSoifDeSang(
          s.getTalentValueById(128), s.getTalentById(128).actif);
    }
    if (s.getTalentValueById(0) != 0) {
      vretour +=
          ele.getAbandon(s.getTalentValueById(0), s.getTalentById(0).actif);
    }
    if (s.getTalentValueById(142) != 0) {
      vretour += ele.getVendetta(
          s.getTalentValueById(142), s.getTalentById(142).actif, s.weapon);
    }
    if (s.getTalentValueById(57) != 0) {
      vretour += ele.getEveilDeSang(
          s.getTalentValueById(57), s.getTalentById(57).actif, s.weapon);
    }
    if (s.getTalentValueById(140) != 0) {
      vretour +=
          ele.getUnion(s.getTalentValueById(140), s.getTalentById(140).actif);
    }
    if (s.getTalentValueById(40) != 0) {
      vretour += ele.getConvDragonRed(
          s.getTalentValueById(40),
          (defFeu(s) + defEau(s) + defGlace(s) + defDragon(s)),
          s.getTalentById(40).actif,
          s.weapon);
    }
    switch (s.weapon.idElement) {
      case 1:
        if (s.getTalentValueById(113) != 0) {
          vretour += ele.getBoostElement(
              s.getTalentValueById(113), vretour, s.getTalentById(113).actif);
        }
        if (s.getTalentValueById(21) != 0) {
          vretour += ele.getKushTeoBlessing(
              s.getTalentValueById(21), vretour, s.getTalentById(21).actif);
        }
        break;
      case 2:
        if (s.getTalentValueById(79) != 0) {
          vretour += ele.getBoostElement(
              s.getTalentValueById(79), vretour, s.getTalentById(79).actif);
        }
        if (s.getTalentValueById(20) != 0) {
          vretour += ele.getKushTeoBlessing(
              s.getTalentValueById(20), vretour, s.getTalentById(20).actif);
        }
        break;
      case 3:
        if (s.getTalentValueById(60) != 0) {
          vretour += ele.getBoostElement(
              s.getTalentValueById(60), vretour, s.getTalentById(60).actif);
        }
        if (s.getTalentValueById(6) != 0) {
          vretour += ele.getStormsoul(
              s.getTalentValueById(6), vretour, s.getTalentById(6).actif);
        }
        break;
      case 4:
        if (s.getTalentValueById(24) != 0) {
          vretour += ele.getBoostElement(
              s.getTalentValueById(24), vretour, s.getTalentById(24).actif);
        }
        if (s.getTalentValueById(20) != 0) {
          vretour += ele.getKushTeoBlessing(
              s.getTalentValueById(20), vretour, s.getTalentById(20).actif);
        }
        break;
      case 5:
        if (s.getTalentValueById(110) != 0) {
          vretour += ele.getBoostElement(
              s.getTalentValueById(110), vretour, s.getTalentById(110).actif);
        }
        if (s.getTalentValueById(6) != 0) {
          vretour += ele.getStormsoul(
              s.getTalentValueById(6), vretour, s.getTalentById(6).actif);
        }
        break;
    }
    if (s.getTalentValueById(77) != 0) {
      vretour += ele.getLutte(
          s.getTalentValueById(77), vretour, s.getTalentById(77).actif);
    }
    if (s.getTalentValueById(41) != 0) {
      vretour += ele.getMailOfHellFire(
          s.getTalentValueById(41), vretour, s.getTalentById(41).actif);
    }
  } else if (s.weapon.idElement >= 6) {
    if (s.getTalentValueById(128) != 0) {
      vretour += affli.getSoifDeSang(
          s.getTalentValueById(128), s.getTalentById(128).actif);
    }
    switch (s.weapon.idElement) {
      case 6:
        if (s.getTalentValueById(96) != 0) {
          vretour += affli.getBoostAffliction(
              s.getTalentValueById(96), s.getTalentById(96).actif);
        }
        break;
      case 7:
        if (s.getTalentValueById(99) != 0) {
          vretour += affli.getBoostAffliction(
              s.getTalentValueById(99), s.getTalentById(99).actif);
        }
        break;
      case 8:
        if (s.getTalentValueById(75) != 0) {
          vretour += affli.getBoostAffliction(
              s.getTalentValueById(75), s.getTalentById(75).actif);
        }
        break;
      case 9:
        if (s.getTalentValueById(48) != 0) {
          vretour += affli.getBoostAffliction(
              s.getTalentValueById(48), s.getTalentById(48).actif);
        }
        break;
    }
    if (s.getTalentValueById(0) != 0) {
      vretour += affli.getAbandon(
          s.getTalentValueById(0), vretour, s.getTalentById(0).actif);
    }
  }
  return vretour;
}

double buildup(Stuff s) {
  double vretour = s.affBuilup;
  switch (s.weapon.idElement) {
    case 6:
      if (s.getTalentValueById(96) != 0) {
        vretour += affli.getBuildupBoostAffliction(
            s.getTalentValueById(96), vretour, s.getTalentById(96).actif);
      }
      break;
    case 7:
      if (s.getTalentValueById(99) != 0) {
        vretour += affli.getBuildupBoostAffliction(
            s.getTalentValueById(99), vretour, s.getTalentById(99).actif);
      }
      break;
    case 8:
      if (s.getTalentValueById(75) != 0) {
        vretour += affli.getBuildupBoostAffliction(
            s.getTalentValueById(75), vretour, s.getTalentById(75).actif);
      }
      break;
    case 9:
      if (s.getTalentValueById(48) != 0) {
        vretour += affli.getBuildupBoostAffliction(
            s.getTalentValueById(48), vretour, s.getTalentById(48).actif);
      }
      if (s.getTalentValueById(29) != 0) {
        vretour += affli.getBuildupTeo(
            s.getTalentValueById(29), vretour, s.getTalentById(29).actif);
      }
      break;
  }
  if (s.getTalentValueById(140) != 0) {
    vretour += affli.getBuildupUnion(
        s.getTalentValueById(140), vretour, s.getTalentById(140).actif);
  }
  return vretour;
}
