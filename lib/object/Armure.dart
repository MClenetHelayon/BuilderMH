import 'package:builder_mhrs/object/Joyau.dart';
import 'package:builder_mhrs/object/Talent.dart';
import 'package:json_annotation/json_annotation.dart';

class Armure {
  final String name, categorie;
  final List<Talent> talents;
  final List<int> slots;
  final int id, rarete, defense, feu, eau, foudre, glace, dragon;

  Armure(
      {required this.id,
      required this.name,
      required this.rarete,
      required this.talents,
      required this.defense,
      required this.feu,
      required this.eau,
      required this.foudre,
      required this.glace,
      required this.dragon,
      required this.slots,
      required this.categorie});
}

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
    Map<String, dynamic> json,
    List<dynamic> skillList,
    String currentLanguage,
  ) {
    var listSlots = json['slots'] as List<dynamic>;
    List<int> lSlots = List<int>.from(listSlots);
    var talentsJson = json['talents'] as List<dynamic>;
    List<Talent> lTalents = talentsJson
        .map<Talent>((talentJson) =>
            Talent.fromJson(talentJson, skillList, currentLanguage))
        .toList();

    return Casque(
      id: json['id'],
      name: json['name'],
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

@JsonSerializable()
class Plastron extends Armure {
  static List<Joyaux> listJoyaux = [];
  Plastron(
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

  factory Plastron.fromJson(
    Map<String, dynamic> json,
    List<dynamic> skillList,
    String currentLanguage,
  ) {
    var listSlots = json['slots'] as List<dynamic>;
    List<int> lSlots = List<int>.from(listSlots);
    var talentsJson = json['talents'] as List<dynamic>;
    List<Talent> lTalents = talentsJson
        .map<Talent>((talentJson) =>
            Talent.fromJson(talentJson, skillList, currentLanguage))
        .toList();

    return Plastron(
      id: json['id'],
      name: json['name'],
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
    return Plastron(
      id: -1,
      name: 'Platron',
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

@JsonSerializable()
class Bras extends Armure {
  static List<Joyaux> listJoyaux = [];

  Bras(
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

  factory Bras.fromJson(
    Map<String, dynamic> json,
    List<dynamic> skillList,
    String currentLanguage,
  ) {
    var listSlots = json['slots'] as List<dynamic>;
    List<int> lSlots = List<int>.from(listSlots);
    var talentsJson = json['talents'] as List<dynamic>;
    List<Talent> lTalents = talentsJson
        .map<Talent>((talentJson) =>
            Talent.fromJson(talentJson, skillList, currentLanguage))
        .toList();

    return Bras(
      id: json['id'],
      name: json['name'],
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
    return Bras(
      id: -1,
      name: 'Bras',
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
    Map<String, dynamic> json,
    List<dynamic> skillList,
    String currentLanguage,
  ) {
    var listSlots = json['slots'] as List<dynamic>;
    List<int> lSlots = List<int>.from(listSlots);
    var talentsJson = json['talents'] as List<dynamic>;
    List<Talent> lTalents = talentsJson
        .map<Talent>((talentJson) =>
            Talent.fromJson(talentJson, skillList, currentLanguage))
        .toList();

    return Ceinture(
      id: json['id'],
      name: json['name'],
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

@JsonSerializable()
class Jambiere extends Armure {
  static List<Joyaux> listJoyaux = [];

  Jambiere(
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

  factory Jambiere.fromJson(
    Map<String, dynamic> json,
    List<dynamic> skillList,
    String currentLanguage,
  ) {
    var listSlots = json['slots'] as List<dynamic>;
    List<int> lSlots = List<int>.from(listSlots);
    var talentsJson = json['talents'] as List<dynamic>;
    List<Talent> lTalents = talentsJson
        .map<Talent>((talentJson) =>
            Talent.fromJson(talentJson, skillList, currentLanguage))
        .toList();

    return Jambiere(
      id: json['id'],
      name: json['name'],
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
    return Jambiere(
      id: -1,
      name: 'Jambière',
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
