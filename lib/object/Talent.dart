class Talent {
  final String name;
  final int id,level,levelMax;
  final bool talisman;


  Talent({
    required this.name,
    required this.id,
    required this.level,
    required this.levelMax,
    required this.talisman,
  });
  factory Talent.getJson(Map<String, dynamic> json,String currentLanguage) {
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
    );
  }

  factory Talent.fromJson(Map<String, dynamic> json, List<dynamic> skillList,String currentLanguage) {
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
    );
  }

  static getBase() {
    return Talent(
      name: '----------',
      id: -1,
      level: 0,
      levelMax: 0,
      talisman: true,
    );
  }
}
