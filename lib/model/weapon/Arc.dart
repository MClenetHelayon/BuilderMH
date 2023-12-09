import 'package:builder_mhrs/model/weapon/Arme.dart';

class Arc extends Arme {
  final int typeMun1,
      lvlTypeMun1,
      typeMun2,
      lvlTypeMun2,
      typeMun3,
      lvlTypeMun3,
      typeMun4,
      lvlTypeMun4,
      force,
      combat,
      poison,
      para,
      sleep,
      explo,
      fatigue,
      barrage;

  Arc(
      {required super.id,
      required super.name,
      required super.rarete,
      required super.categorie,
      required super.niveau,
      required super.talent,
      required super.attaque,
      required super.affinite,
      required super.defense,
      required super.idElement,
      required super.element,
      required super.slots,
      required super.slotCalamite,
      required this.force,
      required this.combat,
      required this.poison,
      required this.para,
      required this.sleep,
      required this.explo,
      required this.fatigue,
      required this.typeMun1,
      required this.lvlTypeMun1,
      required this.typeMun2,
      required this.lvlTypeMun2,
      required this.typeMun3,
      required this.lvlTypeMun3,
      required this.typeMun4,
      required this.lvlTypeMun4,
      required this.barrage});

  factory Arc.fromJson(
    Map<String, dynamic> json,
    List<dynamic> skillList,
    String local,
  ) {
    var listSlots = json['slots'] as List<dynamic>;
    List<int> lSlots = List<int>.from(listSlots);
    String localizedNames = "";

    json['name'].forEach((key, value) {
      if (value is String && key == local) {
        localizedNames = value;
      }
    });
    return Arc(
        id: json['id'],
        name: localizedNames,
        rarete: json['rarete'],
        categorie: json['categorie'],
        niveau: json['niveau'],
        typeMun1: json['typeMun1'][0],
        lvlTypeMun1: json['typeMun1'][1],
        typeMun2: json['typeMun2'][0],
        lvlTypeMun2: json['typeMun2'][1],
        typeMun3: json['typeMun3'][0],
        lvlTypeMun3: json['typeMun3'][1],
        typeMun4: json['typeMun4'][0],
        lvlTypeMun4: json['typeMun4'][1],
        barrage: json['barrage'],
        attaque: json['attaque'],
        affinite: json['affinite'],
        defense: json['def'],
        idElement: json['idElement'],
        element: json['element'],
        slots: lSlots,
        slotCalamite: json['slotCalam'],
        force: json['force'],
        combat: json['combat'],
        poison: json['poison'],
        para: json['para'],
        sleep: json['sleep'],
        explo: json['explo'],
        fatigue: json['faiblesse'],
        talent: json['talentId']);
  }
}
