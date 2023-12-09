import 'package:builder_mhrs/controller/text/localization/getElem.dart';
import 'package:builder_mhrs/model/weapon/Arme.dart';

List<Arme> getLWeapons(List<Arme> lweapons, String cbxElem, String cbxCalam,
    String cbxSharp, bool affNeg) {
  lweapons = getLWeaponsByElem(lweapons, cbxElem);
  lweapons = getLWeaponsByCalam(lweapons, cbxCalam);
  lweapons = getWeaponBySharp(lweapons, cbxSharp);
  lweapons = getWeaponByAffNeg(lweapons, affNeg);
  return lweapons;
}

List<Arme> getWeaponByAffNeg(List<Arme> lweapons, bool affNeg) {
  List<Arme> vretour = [];
  lweapons.forEach((weapon) {
    if (weapon.niveau == "none") {
      vretour.add(weapon);
    } else if (!affNeg) {
      if (weapon.affinite >= 0) {
        vretour.add(weapon);
      }
    } else {
      vretour.add(weapon);
    }
  });
  return vretour;
}

List<Arme> getLWeaponsByElem(List<Arme> lweapons, String id) {
  List<Arme> vretour = [];
  if (id == "all") {
    vretour = lweapons;
  } else {
    vretour = lweapons
        .where((weapons) =>
            weapons.idElement == convertStringElemToIdElem(id) ||
            weapons.niveau == "none")
        .toList();
  }
  return vretour;
}

List<Arme> getLWeaponsByCalam(List<Arme> lweapons, String id) {
  List<Arme> vretour = [];
  if (id == "all") {
    vretour = lweapons;
  } else {
    vretour = lweapons
        .where((weapons) =>
            weapons.slotCalamite == int.tryParse(id) ||
            weapons.niveau == "none")
        .toList();
  }
  return vretour;
}

List<Arme> getWeaponBySharp(List<Arme> lweapons, String cbxTranch) {
  List<Arme> vretour = [];
  lweapons.forEach((weapon) {
    if (weapon.niveau == "none") {
      vretour.add(weapon);
    } else if (weapon is Tranchant) {
      switch (cbxTranch) {
        case "r":
          if (weapon.rouge != 0) {
            vretour.add(weapon);
          }
          break;
        case "o":
          if (weapon.orange != 0) {
            vretour.add(weapon);
          }
          break;
        case "j":
          if (weapon.jaune != 0) {
            vretour.add(weapon);
          }
          break;
        case "v":
          if (weapon.vert != 0) {
            vretour.add(weapon);
          }
          break;
        case "b":
          if (weapon.bleu != 0) {
            vretour.add(weapon);
          }
          break;
        case "bc":
          if (weapon.blanc != 0) {
            vretour.add(weapon);
          }
          break;
        case "vl":
          if (weapon.violet != 0) {
            vretour.add(weapon);
          }
          break;
      }
    } else {
      vretour.add(weapon);
    }
  });
  return vretour;
}
