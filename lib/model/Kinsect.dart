class Kinsect {
  final String name, niveau;
  final int rarete, id, typeAttaque, bonusKinsect;
  final List<int> typeKinsect;
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

  factory Kinsect.fromJson(Map<String, dynamic> json, String local) {
    var ListTypeKinsect = json['typeKinsect'] as List<dynamic>;
    List<int> lType = List<int>.from(ListTypeKinsect);
    var ListNiveau = json['niveauKinsect'] as List<dynamic>;
    List<List<int>> lNiveau = List<List<int>>.from(
        ListNiveau.map((niveau) => List<int>.from(niveau)));
    String localizedNames = "";

    json['name'].forEach((key, value) {
      if (value is String && key == local) {
        localizedNames = value;
      }
    });
    return Kinsect(
        id: json['id'],
        name: localizedNames,
        rarete: json['rarete'],
        niveau: json['niveau'],
        typeAttaque: json['typeAttaque'],
        bonusKinsect: json['bonusKinsect'],
        typeKinsect: lType,
        niveauKinsect: lNiveau);
  }
  static Kinsect getBase() {
    return Kinsect(
        id: 9999,
        name: "-------------",
        rarete: 0,
        niveau: "novice",
        typeAttaque: 0,
        bonusKinsect: 0,
        typeKinsect: [],
        niveauKinsect: []);
  }
}
