import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class JoyauxCalam {
  final String name, talentName;
  final int id, slot;

  JoyauxCalam({
    required this.id,
    required this.name,
    required this.slot,
    required this.talentName,
  });

  factory JoyauxCalam.fromJson(Map<String, dynamic> json,String currentLanguage) {
    String localizedNames = "";
    String localizedSkill="";

    json['name'].forEach((key, value) {
      if (value is String && key == currentLanguage) {
        localizedNames = value;
      }
    });
    json['talentName'].forEach((key, value) {
      if(value is String && key == currentLanguage){
        localizedSkill = value;
      }
    });
    return JoyauxCalam(
      name: localizedNames,
      id: json['id'],
      slot: json['taille'],
      talentName: localizedSkill,
    );
  }

  static getBase() {
    return JoyauxCalam(
      name: '-----------------',
      id: 9999,
      slot: 0,
      talentName: '-----------------',
    );
  }
}