import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Joyaux {
  final String name, nameSkill;
  final int id;
  int level;
  int slot;

  Joyaux({
    required this.nameSkill,
    required this.name,
    required this.id,
    required this.level,
    required this.slot,
  });

  factory Joyaux.fromJson(Map<String, dynamic> json, List<dynamic> skillList, String currentLanguage) {
    if (json['talentId'] != null) {
      final skill =
          skillList.firstWhere((skill) => skill['id'] == json['talentId']);
      String localizedNames = "";
      skill['name'].forEach((key, value) {
        if (value is String && key == currentLanguage) {
          localizedNames = value;
        }
      });
      return Joyaux(
        name: json['name'],
        nameSkill: localizedNames,
        id: json['id'],
        level: json['level'],
        slot: json['taille'],
      );
    } else {
      return Joyaux(
        name: json['name'],
        nameSkill: '-----------------',
        id: json['id'],
        level: json['level'],
        slot: json['taille'],
      );
    }
  }
  static getBase() {
    return Joyaux(
      name: '-----------------',
      nameSkill: '-----------------',
      id: 9999,
      level: 0,
      slot: 4,
    );
  }
}


