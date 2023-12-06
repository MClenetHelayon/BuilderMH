class Talent {
  final String name;
  final int id, level, levelMax;
  final bool talisman;
  bool actif;

  Talent(
      {required this.name,
      required this.id,
      required this.level,
      required this.levelMax,
      required this.talisman,
      required this.actif});

  factory Talent.getJson(Map<String, dynamic> json, String currentLanguage) {
    String localizedNames = "";

    json['name'].forEach((key, value) {
      if (value is String && key == currentLanguage) {
        localizedNames = value;
      }
    });
    return Talent(
        name: localizedNames,
        id: json['id'],
        level: 0,
        levelMax: json['levelMax'],
        talisman: json['talisman'],
        actif: true);
  }

  factory Talent.fromJson(Map<String, dynamic> json, List<dynamic> skillList,
      String currentLanguage) {
    final skill =
        skillList.firstWhere((skill) => skill['id'] == json['talentId']);
    String localizedNames = "";

    skill['name'].forEach((key, value) {
      if (value is String && key == currentLanguage) {
        localizedNames = value;
      }
    });
    return Talent(
        name: localizedNames,
        id: json['talentId'],
        level: json['level'],
        levelMax: skill['levelMax'],
        talisman: skill['talisman'],
        actif: true);
  }

  static getBase() {
    return Talent(
        name: '----------',
        id: -1,
        level: 0,
        levelMax: 0,
        talisman: true,
        actif: false);
  }

  static Talent getTalent(Talent skill, int talentLevel) {
    return Talent(
        name: skill.name,
        id: skill.id,
        level: talentLevel,
        levelMax: skill.levelMax,
        talisman: true,
        actif: true);
  }
}
