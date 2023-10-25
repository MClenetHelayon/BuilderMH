import 'package:builder_mhrs/object/Joyau.dart';
import 'package:builder_mhrs/object/Talent.dart';
import 'package:json_annotation/json_annotation.dart';

class Armure {
  final String name, categorie;
  final List<Talent> talent;
  final List<int> slots;
  final int rarete, defense, feu, eau, foudre, glace, dragon;

  Armure(this.name, this.rarete, this.talent, this.defense, this.feu, this.eau,
      this.foudre, this.glace, this.dragon, this.slots, this.categorie);
}

@JsonSerializable()
class Casque extends Armure {
  final String name, categorie;
  final List<Talent> talents;
  final List<int> slots;
  final int rarete, defense, feu, eau, foudre, glace, dragon;
  static List<Joyaux> listJoyaux = [];
  Casque({
    required this.name,
    required this.rarete,
    required this.categorie,
    required this.talents,
    required this.defense,
    required this.feu,
    required this.eau,
    required this.foudre,
    required this.glace,
    required this.dragon,
    required this.slots,
  }) : super(
          name,
          rarete,
          talents,
          defense,
          feu,
          eau,
          foudre,
          glace,
          dragon,
          slots,
          categorie,
        );

  factory Casque.fromJson(
    Map<String, dynamic> json,
    List<dynamic> skillList,
      String currentLanguage,
  ) {
    var listSlots = json['slots'] as List<dynamic>;
    List<int> lSlots = List<int>.from(listSlots);
    var talentsJson = json['talents'] as List<dynamic>;
    List<Talent> lTalents = talentsJson
        .map<Talent>((talentJson) => Talent.fromJson(talentJson, skillList, currentLanguage))
        .toList();

    return Casque(
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
  final String name, categorie;
  final List<Talent> talents;
  final List<int> slots;
  final int rarete, defense, feu, eau, foudre, glace, dragon;
  static List<Joyaux> listJoyaux = [];
  Plastron({
    required this.name,
    required this.rarete,
    required this.categorie,
    required this.talents,
    required this.defense,
    required this.feu,
    required this.eau,
    required this.foudre,
    required this.glace,
    required this.dragon,
    required this.slots,
  }) : super(
          name,
          rarete,
          talents,
          defense,
          feu,
          eau,
          foudre,
          glace,
          dragon,
          slots,
          categorie,
        );

  factory Plastron.fromJson(
    Map<String, dynamic> json,
    List<dynamic> skillList,
      String currentLanguage,
  ) {
    var listSlots = json['slots'] as List<dynamic>;
    List<int> lSlots = List<int>.from(listSlots);
    var talentsJson = json['talents'] as List<dynamic>;
    List<Talent> lTalents = talentsJson
        .map<Talent>((talentJson) => Talent.fromJson(talentJson, skillList, currentLanguage))
        .toList();

    return Plastron(
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
  final String name, categorie;
  final List<Talent> talents;
  final List<int> slots;
  final int rarete, defense, feu, eau, foudre, glace, dragon;
  static List<Joyaux> listJoyaux = [];

  Bras({
    required this.name,
    required this.rarete,
    required this.categorie,
    required this.talents,
    required this.defense,
    required this.feu,
    required this.eau,
    required this.foudre,
    required this.glace,
    required this.dragon,
    required this.slots,
  }) : super(
          name,
          rarete,
          talents,
          defense,
          feu,
          eau,
          foudre,
          glace,
          dragon,
          slots,
          categorie,
        );

  factory Bras.fromJson(
    Map<String, dynamic> json,
    List<dynamic> skillList,
      String currentLanguage,
  ) {
    var listSlots = json['slots'] as List<dynamic>;
    List<int> lSlots = List<int>.from(listSlots);
    var talentsJson = json['talents'] as List<dynamic>;
    List<Talent> lTalents = talentsJson
        .map<Talent>((talentJson) => Talent.fromJson(talentJson, skillList, currentLanguage))
        .toList();

    return Bras(
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
  final String name, categorie;
  final List<Talent> talents;
  final List<int> slots;
  final int rarete, defense, feu, eau, foudre, glace, dragon;
  static List<Joyaux> listJoyaux = [];

  Ceinture({
    required this.name,
    required this.rarete,
    required this.categorie,
    required this.talents,
    required this.defense,
    required this.feu,
    required this.eau,
    required this.foudre,
    required this.glace,
    required this.dragon,
    required this.slots,
  }) : super(
          name,
          rarete,
          talents,
          defense,
          feu,
          eau,
          foudre,
          glace,
          dragon,
          slots,
          categorie,
        );

  factory Ceinture.fromJson(
    Map<String, dynamic> json,
    List<dynamic> skillList,
      String currentLanguage,
  ) {
    var listSlots = json['slots'] as List<dynamic>;
    List<int> lSlots = List<int>.from(listSlots);
    var talentsJson = json['talents'] as List<dynamic>;
    List<Talent> lTalents = talentsJson
        .map<Talent>((talentJson) => Talent.fromJson(talentJson, skillList, currentLanguage))
        .toList();

    return Ceinture(
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
  final String name, categorie;
  final List<Talent> talents;
  final List<int> slots;
  final int rarete, defense, feu, eau, foudre, glace, dragon;
  static List<Joyaux> listJoyaux = [];

  Jambiere({
    required this.name,
    required this.rarete,
    required this.categorie,
    required this.talents,
    required this.defense,
    required this.feu,
    required this.eau,
    required this.foudre,
    required this.glace,
    required this.dragon,
    required this.slots,
  }) : super(
          name,
          rarete,
          talents,
          defense,
          feu,
          eau,
          foudre,
          glace,
          dragon,
          slots,
          categorie,
        );

  factory Jambiere.fromJson(
    Map<String, dynamic> json,
    List<dynamic> skillList,
      String currentLanguage,
  ) {
    var listSlots = json['slots'] as List<dynamic>;
    List<int> lSlots = List<int>.from(listSlots);
    var talentsJson = json['talents'] as List<dynamic>;
    List<Talent> lTalents = talentsJson
        .map<Talent>((talentJson) => Talent.fromJson(talentJson, skillList, currentLanguage))
        .toList();

    return Jambiere(
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
