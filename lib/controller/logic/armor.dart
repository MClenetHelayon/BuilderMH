import 'package:builder_mhrs/model/armor/Armure.dart';
import 'package:builder_mhrs/model/Talent.dart';
import 'package:builder_mhrs/model/armor/Bras.dart';
import 'package:builder_mhrs/model/armor/Casque.dart';
import 'package:builder_mhrs/model/armor/Ceinture.dart';
import 'package:builder_mhrs/model/armor/Jambe.dart';
import 'package:builder_mhrs/model/armor/Plastron.dart';

List<Casque> getLCasque(
  List<Casque> larmors,
  Talent cbxSkill,
) {
  larmors = getLArmorsBySkill(larmors, cbxSkill);
  return larmors;
}

List<Plastron> getLPlastron(
  List<Plastron> larmors,
  Talent cbxSkill,
) {
  larmors = getLArmorsBySkill(larmors, cbxSkill);
  return larmors;
}

List<Bras> getLBras(
  List<Bras> larmors,
  Talent cbxSkill,
) {
  larmors = getLArmorsBySkill(larmors, cbxSkill);
  return larmors;
}

List<Ceinture> getLCeinture(
  List<Ceinture> larmors,
  Talent cbxSkill,
) {
  larmors = getLArmorsBySkill(larmors, cbxSkill);
  return larmors;
}

List<Jambiere> getLJambe(
  List<Jambiere> larmors,
  Talent cbxSkill,
) {
  larmors = getLArmorsBySkill(larmors, cbxSkill);
  return larmors;
}

List<T> getLArmorsBySkill<T extends Armure>(List<T> larmors, Talent cbxSkill) {
  List<T> vretour = [];
  if (cbxSkill.id != -1) {
    larmors.forEach((armure) {
      if (armure.talents.contains(cbxSkill)) {
        vretour.add(armure);
      }
    });
  } else {
    vretour = larmors;
  }

  return vretour;
}
