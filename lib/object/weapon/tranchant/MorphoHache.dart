import 'package:builder_mhrs/object/weapon/Arme.dart';

class MorphoHache extends Tranchant {
  final int typeFiole, valueFiole;
  MorphoHache(
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
      required this.typeFiole,
      required this.valueFiole,
      required super.rouge,
      required super.orange,
      required super.jaune,
      required super.vert,
      required super.bleu,
      required super.blanc,
      required super.violet,
      required super.sharpBoost});

  factory MorphoHache.fromJson(
      Map<String, dynamic> json, List<dynamic> skillList, String local) {
    var listSlots = json['slots'] as List<dynamic>;
    List<int> lSlots = List<int>.from(listSlots);
    String localizedNames = "";

    json['name'].forEach((key, value) {
      if (value is String && key == local) {
        localizedNames = value;
      }
    });
    var listSharpBoost = json['tranchantSVBoost'] as List<dynamic>;
    List<int> lSharpBoost = List<int>.from(listSharpBoost);
    return MorphoHache(
        id: json['id'],
        name: localizedNames,
        rarete: json['rarete'],
        categorie: json['categorie'],
        niveau: json['niveau'],
        attaque: json['attaque'],
        affinite: json['affinite'],
        defense: json['def'],
        idElement: json['idElement'],
        element: json['element'],
        slotCalamite: json['slotCalam'],
        typeFiole: json['typeFiole'],
        valueFiole: json['valueFiole'],
        slots: lSlots,
        talent: json['talentId'],
        rouge: json['rouge'],
        orange: json['orange'],
        jaune: json['jaune'],
        vert: json['vert'],
        bleu: json['bleu'],
        blanc: json['blanc'],
        violet: json['violet'],
        sharpBoost: lSharpBoost);
  }
}
