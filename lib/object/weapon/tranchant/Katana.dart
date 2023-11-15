import '../Arme.dart';

class Katana extends Tranchant {
  Katana(
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
      required super.rouge,
      required super.orange,
      required super.jaune,
      required super.vert,
      required super.bleu,
      required super.blanc,
      required super.violet,
      required super.sharpBoost});

  factory Katana.fromJson(
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

    return Katana(
        id: json['id'],
        name: localizedNames,
        rarete: json['rarete'],
        categorie: json['categorie'],
        niveau: json['niveau'],
        talent: json['talentId'],
        attaque: json['attaque'],
        affinite: json['affinite'],
        defense: json['def'],
        idElement: json['idElement'],
        element: json['element'],
        slots: lSlots,
        slotCalamite: json['slotCalam'],
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
