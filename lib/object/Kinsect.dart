class Kinsect {
  final String name, niveau, typeAttaque, bonusKinsect;
  final int rarete, id;
  final List<String> typeKinsect;
  final List<List<int>> niveauKinsect;
  Kinsect(
      {required this.id,
      required this.name,
      required this.rarete,
      required this.niveau,
      required this.typeAttaque,
      required this.bonusKinsect,
      required this.typeKinsect,
      required this.niveauKinsect});

  factory Kinsect.fromJson(Map<String, dynamic> json) {
    var ListTypeKinsect = json['typeKinsect'] as List<dynamic>;
    List<String> lType = List<String>.from(ListTypeKinsect);
    var ListNiveau = json['niveauKinsect'] as List<dynamic>;
    List<List<int>> lNiveau = List<List<int>>.from(
      ListNiveau.map((niveau) => List<int>.from(niveau)),
    );

    return Kinsect(
      id: json['id'],
      name: json['name'],
      rarete: json['rarete'],
      niveau: json['niveau'],
      typeAttaque: json['typeAttaque'],
      bonusKinsect: json['bonusKinsect'],
      typeKinsect: lType,
      niveauKinsect: lNiveau,
    );
  }
  static Kinsect getBase() {
    return Kinsect(
      id: 9999,
      name: "-------------",
      rarete: 0,
      niveau: "novice",
      typeAttaque: "-------------",
      bonusKinsect: "-------------",
      typeKinsect: [],
      niveauKinsect: [],
    );
  }
}
