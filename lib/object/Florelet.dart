import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Florelet {
  final String name;
  final int gVie, gStam, gAtt, gDef, uVie, uStam, uAtt, uDef;
  Florelet(
      {required this.name,
      required this.gVie,
      required this.gStam,
      required this.gAtt,
      required this.gDef,
      required this.uVie,
      required this.uStam,
      required this.uAtt,
      required this.uDef});
  static getBase() {
    return Florelet(
        name: "un Florelet",
        gVie: 10,
        gStam: 10,
        gAtt: 10,
        gDef: 10,
        uVie: 10,
        uStam: 10,
        uAtt: 10,
        uDef: 10);
  }

  factory Florelet.fromJson(
      Map<String, dynamic> petalas, String currentLanguage) {
    String localizedNames = "";

    petalas['name'].forEach((key, value) {
      if (value is String && key == currentLanguage) {
        localizedNames = value;
      }
    });
    return Florelet(
      name:localizedNames,
      gVie: petalas['gVie'],
      gStam: petalas['gStam'],
      gAtt: petalas['gAtt'],
      gDef: petalas['gDef'],
      uVie: petalas['uVie'],
      uStam: petalas['uStam'],
      uAtt: petalas['uAtt'],
      uDef: petalas['uDef'],
    );
  }
}
