import 'package:json_annotation/json_annotation.dart';

import '../Joyau.dart';
import '../Talent.dart';
import 'Armure.dart';

@JsonSerializable()
class Ceinture extends Armure {
  static List<Joyaux> listJoyaux = [];

  Ceinture(
      {required super.id,
      required super.name,
      required super.rarete,
      required super.talents,
      required super.defense,
      required super.feu,
      required super.eau,
      required super.foudre,
      required super.glace,
      required super.dragon,
      required super.slots,
      required super.categorie});
  factory Ceinture.fromJson(
      Map<String, dynamic> json, List<dynamic> skillList, String local) {
    var listSlots = json['slots'] as List<dynamic>;
    List<int> lSlots = List<int>.from(listSlots);
    var talentsJson = json['talents'] as List<dynamic>;
    List<Talent> lTalents = talentsJson
        .map<Talent>(
            (talentJson) => Talent.fromJson(talentJson, skillList, local))
        .toList();
    String localizedNames = "";

    json['name'].forEach((key, value) {
      if (value is String && key == local) {
        localizedNames = value;
      }
    });
    return Ceinture(
      id: json['id'],
      name: localizedNames,
      rarete: json['rarete'],
      categorie: json['categorie'],
      talents: lTalents,
      defense: json['def'],
      feu: json['defF'],
      eau: json['defW'],
      foudre: json['defT'],
      glace: json['defI'],
      dragon: json['defD'],
      slots: lSlots,
    );
  }
  getListJoyaux() {
    return listJoyaux;
  }

  static getBase() {
    return Ceinture(
      id: -1,
      name: 'Ceinture',
      rarete: 0,
      categorie: 'novice',
      talents: [
        Talent.getBase(),
        Talent.getBase(),
      ],
      defense: 0,
      feu: 0,
      eau: 0,
      foudre: 0,
      glace: 0,
      dragon: 0,
      slots: [],
    );
  }
}
