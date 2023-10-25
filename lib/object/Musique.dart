class Musique {
  final int id;
  final String name;

  Musique({
    required this.id,
    required this.name,
  });

  factory Musique.fromJson(Map<String, dynamic> json, String currentLanguage) {
    String localizedNames = "";

    json['name'].forEach((key, value) {
      if (value is String && key == currentLanguage) {
        localizedNames = value;
      }
    });

    return Musique(
      id: json['id'],
      name: localizedNames,
    );
  }
}
