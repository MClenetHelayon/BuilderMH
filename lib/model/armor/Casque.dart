import 'package:json_annotation/json_annotation.dart';
import 'package:builder_mhrs/model/Joyau.dart';
import 'package:builder_mhrs/model/Talent.dart';
import 'package:builder_mhrs/model/armor/Armure.dart';

@JsonSerializable()
class Casque extends Armure {
  static List<Joyaux> listJoyaux = [];
  Casque(
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

  factory Casque.fromJson(
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
    return Casque(
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
    return Casque(
      id: -1,
      name: 'Casque',
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
