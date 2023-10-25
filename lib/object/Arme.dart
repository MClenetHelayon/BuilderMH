import '../object/Musique.dart';
import 'Joyau.dart';
import 'Talent.dart';
import 'ITranchant.dart';

class Arme {
  final String name, categorie, niveau;
  final int rarete,
      attaque,
      affinite,
      defense,
      idElement,
      element,
      slotCalamite;
  final List<int> slots;
  final Talent? talent;

  static List<Joyaux> listJoyaux = [];
  Arme({
    required this.name,
    required this.rarete,
    required this.categorie,
    required this.niveau,
    required this.talent,
    required this.attaque,
    required this.affinite,
    required this.defense,
    required this.idElement,
    required this.element,
    required this.slots,
    required this.slotCalamite,
  });

  static getBase() {
    return Arme(
      name: "-----------------------",
      rarete: 1,
      categorie: "GS",
      niveau: "novice",
      talent: Talent.getBase(),
      attaque: 0,
      affinite: 0,
      defense: 0,
      idElement: 0,
      element: 0,
      slots: [],
      slotCalamite: 0,
    );
  }

  static String extarctName(Map<String, dynamic> json, List<dynamic> typeList,
      String name, String local) {
    String vretour = '';
    for (var type in typeList) {
      Map<String, dynamic> typeData = type as Map<String, dynamic>;
      if (typeData['id'] == json[name]) {
        vretour = typeData['name'][local];
        break;
      }
    }
    return vretour;
  }
}

class GrandeEpee extends Arme implements Tranchant {

  final List<int> sharpBoost;

  @override
  int rouge, orange, jaune, vert, bleu, blanc, violet;
  GrandeEpee(
      {required String name,
      required int rarete,
      required String categorie,
      required String niveau,
      required Talent? talent,
      required int attaque,
      required int affinite,
      required int defense,
      required int idElement,
      required int element,
      required List<int> slots,
      required int slotCalamite,
      required this.rouge,
      required this.orange,
      required this.jaune,
      required this.vert,
      required this.bleu,
      required this.blanc,
      required this.violet,
      required this.sharpBoost})
      : super(
            name: name,
            rarete: rarete,
            categorie: categorie,
            niveau: niveau,
            talent: talent,
            attaque: attaque,
            affinite: affinite,
            defense: defense,
            idElement: idElement,
            element: element,
            slots: slots,
            slotCalamite: slotCalamite);

  factory GrandeEpee.fromJson(
      Map<String, dynamic> json, List<dynamic> skillList, String local) {
    var listSlots = json['slots'] as List<dynamic>;
    List<int> lSlots = List<int>.from(listSlots);
    String localizedNames = "";

    json['name'].forEach((key, value) {
      if (value is String && key == local) {
        localizedNames = value;
      }
    });
    var listSharpBoost = json['tranchantSVBoost'] as List<dynamic>;
    List<int> lSharpBoost = List<int>.from(listSharpBoost);

    return GrandeEpee(
        name: localizedNames,
        rarete: json['rarete'],
        categorie: json['categorie'],
        niveau: json['niveau'],
        talent: json['talentId'],
        attaque: json['attaque'],
        affinite: json['affinite'],
        defense: json['def'],
        idElement: json['idElement'],
        element: json['element'],
        slots: lSlots,
        slotCalamite: json['slotCalam'],
        rouge: json['rouge'],
        orange: json['orange'],
        jaune: json['jaune'],
        vert: json['vert'],
        bleu: json['bleu'],
        blanc: json['blanc'],
        violet: json['violet'],
        sharpBoost: lSharpBoost);
  }

  @override
  set sharpBoost(List<int> _sharpBoost) {
    // TODO: implement sharpBoost
  }
}

class Katana extends Arme implements Tranchant {

  final List<int> sharpBoost;

  @override
  int rouge, orange, jaune, vert, bleu, blanc, violet;
  Katana(
      {required String name,
      required int rarete,
      required String categorie,
      required String niveau,
      required Talent? talent,
      required int attaque,
      required int affinite,
      required int defense,
      required int idElement,
      required int element,
      required List<int> slots,
      required int slotCalamite,
      required this.rouge,
      required this.orange,
      required this.jaune,
      required this.vert,
      required this.bleu,
      required this.blanc,
      required this.violet,
      required this.sharpBoost})
      : super(
            name: name,
            rarete: rarete,
            categorie: categorie,
            niveau: niveau,
            talent: talent,
            attaque: attaque,
            affinite: affinite,
            defense: defense,
            idElement: idElement,
            element: element,
            slots: slots,
            slotCalamite: slotCalamite);

  factory Katana.fromJson(
      Map<String, dynamic> json, List<dynamic> skillList, String local) {
    var listSlots = json['slots'] as List<dynamic>;
    List<int> lSlots = List<int>.from(listSlots);
    String localizedNames = "";

    json['name'].forEach((key, value) {
      if (value is String && key == local) {
        localizedNames = value;
      }
    });
    var listSharpBoost = json['tranchantSVBoost'] as List<dynamic>;
    List<int> lSharpBoost = List<int>.from(listSharpBoost);

    return Katana(
        name: localizedNames,
        rarete: json['rarete'],
        categorie: json['categorie'],
        niveau: json['niveau'],
        talent: json['talentId'],
        attaque: json['attaque'],
        affinite: json['affinite'],
        defense: json['def'],
        idElement: json['idElement'],
        element: json['element'],
        slots: lSlots,
        slotCalamite: json['slotCalam'],
        rouge: json['rouge'],
        orange: json['orange'],
        jaune: json['jaune'],
        vert: json['vert'],
        bleu: json['bleu'],
        blanc: json['blanc'],
        violet: json['violet'],
        sharpBoost: lSharpBoost);
  }

  @override
  set sharpBoost(List<int> _sharpBoost) {
    // TODO: implement sharpBoost
  }
}

class EpeeBouclier extends Arme implements Tranchant {

  final List<int> sharpBoost;
  @override
  int rouge, orange, jaune, vert, bleu, blanc, violet;
  EpeeBouclier(
      {required String name,
      required int rarete,
      required String categorie,
      required String niveau,
      required Talent? talent,
      required int attaque,
      required int affinite,
      required int defense,
      required int idElement,
      required int element,
      required List<int> slots,
      required int slotCalamite,
      required this.rouge,
      required this.orange,
      required this.jaune,
      required this.vert,
      required this.bleu,
      required this.blanc,
      required this.violet,
      required this.sharpBoost})
      : super(
            name: name,
            rarete: rarete,
            categorie: categorie,
            niveau: niveau,
            talent: talent,
            attaque: attaque,
            affinite: affinite,
            defense: defense,
            idElement: idElement,
            element: element,
            slots: slots,
            slotCalamite: slotCalamite);

  factory EpeeBouclier.fromJson(
      Map<String, dynamic> json, List<dynamic> skillList, String local) {
    var listSlots = json['slots'] as List<dynamic>;
    List<int> lSlots = List<int>.from(listSlots);
    String localizedNames = "";

    json['name'].forEach((key, value) {
      if (value is String && key == local) {
        localizedNames = value;
      }
    });
    var listSharpBoost = json['tranchantSVBoost'] as List<dynamic>;
    List<int> lSharpBoost = List<int>.from(listSharpBoost);

    return EpeeBouclier(
        name: localizedNames,
        rarete: json['rarete'],
        categorie: json['categorie'],
        niveau: json['niveau'],
        talent: json['talentId'],
        attaque: json['attaque'],
        affinite: json['affinite'],
        defense: json['def'],
        idElement: json['idElement'],
        element: json['element'],
        slots: lSlots,
        slotCalamite: json['slotCalam'],
        rouge: json['rouge'],
        orange: json['orange'],
        jaune: json['jaune'],
        vert: json['vert'],
        bleu: json['bleu'],
        blanc: json['blanc'],
        violet: json['violet'],
        sharpBoost: lSharpBoost);
  }

  @override
  set sharpBoost(List<int> _sharpBoost) {
    // TODO: implement sharpBoost
  }
}

class LameDouble extends Arme implements Tranchant {
  final int 
      idElement2,
      element2;
  final List<int> sharpBoost;

  @override
  int rouge, orange, jaune, vert, bleu, blanc, violet;
  LameDouble(
      {required String name,
      required int rarete,
      required String categorie,
      required String niveau,
      required Talent? talent,
      required int attaque,
      required int affinite,
      required int defense,
      required int idElement,
      required int element,
      required List<int> slots,
      required int slotCalamite,
      required this.idElement2,
      required this.element2,
      required this.rouge,
      required this.orange,
      required this.jaune,
      required this.vert,
      required this.bleu,
      required this.blanc,
      required this.violet,
      required this.sharpBoost})
      : super(
            name: name,
            rarete: rarete,
            categorie: categorie,
            niveau: niveau,
            talent: talent,
            attaque: attaque,
            affinite: affinite,
            defense: defense,
            idElement: idElement,
            element: element,
            slots: slots,
            slotCalamite: slotCalamite);

  factory LameDouble.fromJson(
      Map<String, dynamic> json, List<dynamic> skillList, String local) {
    var listSlots = json['slots'] as List<dynamic>;
    List<int> lSlots = List<int>.from(listSlots);
    String localizedNames = "";

    json['name'].forEach((key, value) {
      if (value is String && key == local) {
        localizedNames = value;
      }
    });
    var listSharpBoost = json['tranchantSVBoost'] as List<dynamic>;
    List<int> lSharpBoost = List<int>.from(listSharpBoost);

    return LameDouble(
        name: localizedNames,
        rarete: json['rarete'],
        categorie: json['categorie'],
        niveau: json['niveau'],
        talent: json['talentId'],
        attaque: json['attaque'],
        affinite: json['affinite'],
        defense: json['def'],
        idElement: json['idElement1'],
        element: json['element1'],
        slots: lSlots,
        slotCalamite: json['slotCalam'],
        idElement2: json['idElement2'],
        element2: json['element2'],
        rouge: json['rouge'],
        orange: json['orange'],
        jaune: json['jaune'],
        vert: json['vert'],
        bleu: json['bleu'],
        blanc: json['blanc'],
        violet: json['violet'],
        sharpBoost: lSharpBoost);
  }

  @override
  set sharpBoost(List<int> _sharpBoost) {
    // TODO: implement sharpBoost
  }
}

class Marteau extends Arme implements Tranchant {

  final List<int> sharpBoost;

  @override
  int rouge, orange, jaune, vert, bleu, blanc, violet;
  Marteau(
      {required String name,
      required int rarete,
      required String categorie,
      required String niveau,
      required Talent? talent,
      required int attaque,
      required int affinite,
      required int defense,
      required int idElement,
      required int element,
      required List<int> slots,
      required int slotCalamite,
      required this.rouge,
      required this.orange,
      required this.jaune,
      required this.vert,
      required this.bleu,
      required this.blanc,
      required this.violet,
      required this.sharpBoost})
      : super(
            name: name,
            rarete: rarete,
            categorie: categorie,
            niveau: niveau,
            talent: talent,
            attaque: attaque,
            affinite: affinite,
            defense: defense,
            idElement: idElement,
            element: element,
            slots: slots,
            slotCalamite: slotCalamite);

  factory Marteau.fromJson(
      Map<String, dynamic> json, List<dynamic> skillList, String local) {
    var listSlots = json['slots'] as List<dynamic>;
    List<int> lSlots = List<int>.from(listSlots);
    String localizedNames = "";

    json['name'].forEach((key, value) {
      if (value is String && key == local) {
        localizedNames = value;
      }
    });
    var listSharpBoost = json['tranchantSVBoost'] as List<dynamic>;
    List<int> lSharpBoost = List<int>.from(listSharpBoost);

    return Marteau(
        name: localizedNames,
        rarete: json['rarete'],
        categorie: json['categorie'],
        niveau: json['niveau'],
        talent: json['talentId'],
        attaque: json['attaque'],
        affinite: json['affinite'],
        defense: json['def'],
        idElement: json['idElement'],
        element: json['element'],
        slots: lSlots,
        slotCalamite: json['slotCalam'],
        rouge: json['rouge'],
        orange: json['orange'],
        jaune: json['jaune'],
        vert: json['vert'],
        bleu: json['bleu'],
        blanc: json['blanc'],
        violet: json['violet'],
        sharpBoost: lSharpBoost);
  }

  @override
  set sharpBoost(List<int> _sharpBoost) {
    // TODO: implement sharpBoost
  }
}

class CorneDeChasse extends Arme implements Tranchant {

  final List<int> sharpBoost;
  final List<Musique> musique;

  @override
  int rouge, orange, jaune, vert, bleu, blanc, violet;
  CorneDeChasse(
      {required String name,
      required int rarete,
      required String categorie,
      required String niveau,
      required Talent? talent,
      required int attaque,
      required int affinite,
      required int defense,
      required int idElement,
      required int element,
      required List<int> slots,
      required int slotCalamite,
      required this.musique,
      required this.rouge,
      required this.orange,
      required this.jaune,
      required this.vert,
      required this.bleu,
      required this.blanc,
      required this.violet,
      required this.sharpBoost})
      : super(
            name: name,
            rarete: rarete,
            categorie: categorie,
            niveau: niveau,
            talent: talent,
            attaque: attaque,
            affinite: affinite,
            defense: defense,
            idElement: idElement,
            element: element,
            slots: slots,
            slotCalamite: slotCalamite);

  factory CorneDeChasse.fromJson(Map<String, dynamic> json,
      List<dynamic> skillList, List<Musique> musicList, String local) {
    var listSlots = json['slots'] as List<dynamic>;
    List<int> lSlots = List<int>.from(listSlots);
    String localizedNames = "";

    json['name'].forEach((key, value) {
      if (value is String && key == local) {
        localizedNames = value;
      }
    });
    var listSharpBoost = json['tranchantSVBoost'] as List<dynamic>;
    List<int> lSharpBoost = List<int>.from(listSharpBoost);

    var ListMusiques = json['musique'] as List<dynamic>;
    List<Musique> lMusiques = [];
    ListMusiques.forEach((id) {
      musicList.forEach((musique) {
        if (id == musique.id) {
          lMusiques.add(musique);
        }
      });
    });

    return CorneDeChasse(
        name: localizedNames,
        rarete: json['rarete'],
        categorie: json['categorie'],
        niveau: json['niveau'],
        talent: json['talentId'],
        attaque: json['attaque'],
        affinite: json['affinite'],
        defense: json['def'],
        idElement: json['idElement'],
        element: json['element'],
        slots: lSlots,
        slotCalamite: json['slotCalam'],
        musique: lMusiques,
        rouge: json['rouge'],
        orange: json['orange'],
        jaune: json['jaune'],
        vert: json['vert'],
        bleu: json['bleu'],
        blanc: json['blanc'],
        violet: json['violet'],
        sharpBoost: lSharpBoost);
  }

  @override
  set sharpBoost(List<int> _sharpBoost) {
    // TODO: implement sharpBoost
  }
}

class Lance extends Arme implements Tranchant {

  final List<int> sharpBoost;
  @override
  int rouge, orange, jaune, vert, bleu, blanc, violet;
  Lance(
      {required String name,
      required int rarete,
      required String categorie,
      required String niveau,
      required Talent? talent,
      required int attaque,
      required int affinite,
      required int defense,
      required int idElement,
      required int element,
      required List<int> slots,
      required int slotCalamite,
      required this.rouge,
      required this.orange,
      required this.jaune,
      required this.vert,
      required this.bleu,
      required this.blanc,
      required this.violet,
      required this.sharpBoost})
      : super(
            name: name,
            rarete: rarete,
            categorie: categorie,
            niveau: niveau,
            talent: talent,
            attaque: attaque,
            affinite: affinite,
            defense: defense,
            idElement: idElement,
            element: element,
            slots: slots,
            slotCalamite: slotCalamite);

  factory Lance.fromJson(
      Map<String, dynamic> json, List<dynamic> skillList, String local) {
    var listSlots = json['slots'] as List<dynamic>;
    List<int> lSlots = List<int>.from(listSlots);
    String localizedNames = "";

    json['name'].forEach((key, value) {
      if (value is String && key == local) {
        localizedNames = value;
      }
    });
    var listSharpBoost = json['tranchantSVBoost'] as List<dynamic>;
    List<int> lSharpBoost = List<int>.from(listSharpBoost);

    return Lance(
        name: localizedNames,
        rarete: json['rarete'],
        categorie: json['categorie'],
        niveau: json['niveau'],
        talent: json['talentId'],
        attaque: json['attaque'],
        affinite: json['affinite'],
        defense: json['def'],
        idElement: json['idElement'],
        element: json['element'],
        slots: lSlots,
        slotCalamite: json['slotCalam'],
        rouge: json['rouge'],
        orange: json['orange'],
        jaune: json['jaune'],
        vert: json['vert'],
        bleu: json['bleu'],
        blanc: json['blanc'],
        violet: json['violet'],
        sharpBoost: lSharpBoost);
  }

  @override
  set sharpBoost(List<int> _sharpBoost) {
    // TODO: implement sharpBoost
  }
}

class Lancecanon extends Arme implements Tranchant {
  final int 
      typeCanon,
      niveauCanon;
  final List<int> sharpBoost;

  @override
  int rouge, orange, jaune, vert, bleu, blanc, violet;
  Lancecanon(
      {required String name,
      required int rarete,
      required String categorie,
      required String niveau,
      required Talent? talent,
      required int attaque,
      required int affinite,
      required int defense,
      required int idElement,
      required int element,
      required List<int> slots,
      required int slotCalamite,
      required this.typeCanon,
      required this.niveauCanon,
      required this.rouge,
      required this.orange,
      required this.jaune,
      required this.vert,
      required this.bleu,
      required this.blanc,
      required this.violet,
      required this.sharpBoost})
      : super(
            name: name,
            rarete: rarete,
            categorie: categorie,
            niveau: niveau,
            talent: talent,
            attaque: attaque,
            affinite: affinite,
            defense: defense,
            idElement: idElement,
            element: element,
            slots: slots,
            slotCalamite: slotCalamite);

  factory Lancecanon.fromJson(
      Map<String, dynamic> json, List<dynamic> skillList, String local) {
    var listSlots = json['slots'] as List<dynamic>;
    List<int> lSlots = List<int>.from(listSlots);
    String localizedNames = "";

    json['name'].forEach((key, value) {
      if (value is String && key == local) {
        localizedNames = value;
      }
    });
    var listSharpBoost = json['tranchantSVBoost'] as List<dynamic>;
    List<int> lSharpBoost = List<int>.from(listSharpBoost);

    return Lancecanon(
        name: localizedNames,
        rarete: json['rarete'],
        categorie: json['categorie'],
        niveau: json['niveau'],
        attaque: json['attaque'],
        affinite: json['affinite'],
        defense: json['def'],
        idElement: json['idElement'],
        element: json['element'],
        slotCalamite: json['slotCalam'],
        typeCanon: json['typeCanon'],
        niveauCanon: json['niveauCanon'],
        slots: lSlots,
        talent: json['talentId'],
        rouge: json['rouge'],
        orange: json['orange'],
        jaune: json['jaune'],
        vert: json['vert'],
        bleu: json['bleu'],
        blanc: json['blanc'],
        violet: json['violet'],
        sharpBoost: lSharpBoost);
  }

  @override
  set sharpBoost(List<int> _sharpBoost) {
    // TODO: implement sharpBoost
  }
}

class MorphoHache extends Arme implements Tranchant {
  final int 
      typeFiole,
      valueFiole;
  final List<int> sharpBoost;

  @override
  int rouge, orange, jaune, vert, bleu, blanc, violet;
  MorphoHache(
      {required String name,
      required int rarete,
      required String categorie,
      required String niveau,
      required Talent? talent,
      required int attaque,
      required int affinite,
      required int defense,
      required int idElement,
      required int element,
      required List<int> slots,
      required int slotCalamite,
      required this.typeFiole,
      required this.valueFiole,
      required this.rouge,
      required this.orange,
      required this.jaune,
      required this.vert,
      required this.bleu,
      required this.blanc,
      required this.violet,
      required this.sharpBoost})
      : super(
            name: name,
            rarete: rarete,
            categorie: categorie,
            niveau: niveau,
            talent: talent,
            attaque: attaque,
            affinite: affinite,
            defense: defense,
            idElement: idElement,
            element: element,
            slots: slots,
            slotCalamite: slotCalamite);

  factory MorphoHache.fromJson(
      Map<String, dynamic> json, List<dynamic> skillList, String local) {
    var listSlots = json['slots'] as List<dynamic>;
    List<int> lSlots = List<int>.from(listSlots);
    String localizedNames = "";

    json['name'].forEach((key, value) {
      if (value is String && key == local) {
        localizedNames = value;
      }
    });
    var listSharpBoost = json['tranchantSVBoost'] as List<dynamic>;
    List<int> lSharpBoost = List<int>.from(listSharpBoost);
    return MorphoHache(
        name: localizedNames,
        rarete: json['rarete'],
        categorie: json['categorie'],
        niveau: json['niveau'],
        attaque: json['attaque'],
        affinite: json['affinite'],
        defense: json['def'],
        idElement: json['idElement'],
        element: json['element'],
        slotCalamite: json['slotCalam'],
        typeFiole: json['typeFiole'],
        valueFiole: json['valueFiole'],
        slots: lSlots,
        talent: json['talentId'],
        rouge: json['rouge'],
        orange: json['orange'],
        jaune: json['jaune'],
        vert: json['vert'],
        bleu: json['bleu'],
        blanc: json['blanc'],
        violet: json['violet'],
        sharpBoost: lSharpBoost);
  }

  @override
  set sharpBoost(List<int> _sharpBoost) {
    // TODO: implement sharpBoost
  }
}

class VoltoHache extends Arme implements Tranchant {
  final int 
      typeFiole;
  final List<int> sharpBoost;

  @override
  int rouge, orange, jaune, vert, bleu, blanc, violet;
  VoltoHache(
      {required String name,
      required int rarete,
      required String categorie,
      required String niveau,
      required Talent? talent,
      required int attaque,
      required int affinite,
      required int defense,
      required int idElement,
      required int element,
      required List<int> slots,
      required int slotCalamite,
      required this.typeFiole,
      required this.rouge,
      required this.orange,
      required this.jaune,
      required this.vert,
      required this.bleu,
      required this.blanc,
      required this.violet,
      required this.sharpBoost})
      : super(
            name: name,
            rarete: rarete,
            categorie: categorie,
            niveau: niveau,
            talent: talent,
            attaque: attaque,
            affinite: affinite,
            defense: defense,
            idElement: idElement,
            element: element,
            slots: slots,
            slotCalamite: slotCalamite);

  factory VoltoHache.fromJson(
      Map<String, dynamic> json, List<dynamic> skillList, String local) {
    var listSlots = json['slots'] as List<dynamic>;
    List<int> lSlots = List<int>.from(listSlots);
    String localizedNames = "";

    json['name'].forEach((key, value) {
      if (value is String && key == local) {
        localizedNames = value;
      }
    });
    var listSharpBoost = json['tranchantSVBoost'] as List<dynamic>;
    List<int> lSharpBoost = List<int>.from(listSharpBoost);

    return VoltoHache(
        name: localizedNames,
        rarete: json['rarete'],
        categorie: json['categorie'],
        niveau: json['niveau'],
        typeFiole: json['typeFiole'],
        attaque: json['attaque'],
        affinite: json['affinite'],
        defense: json['def'],
        idElement: json['idElement'],
        element: json['element'],
        slotCalamite: json['slotCalam'],
        slots: lSlots,
        talent: json['talentId'],
        rouge: json['rouge'],
        orange: json['orange'],
        jaune: json['jaune'],
        vert: json['vert'],
        bleu: json['bleu'],
        blanc: json['blanc'],
        violet: json['violet'],
        sharpBoost: lSharpBoost);
  }

  @override
  set sharpBoost(List<int> _sharpBoost) {
    // TODO: implement sharpBoost
  }
}

class Insectoglaive extends Arme implements Tranchant {
  final int 
      niveauKinsect;

  final List<int> sharpBoost;

  @override
  int rouge, orange, jaune, vert, bleu, blanc, violet;
  Insectoglaive(
      {required String name,
      required int rarete,
      required String categorie,
      required String niveau,
      required Talent? talent,
      required int attaque,
      required int affinite,
      required int defense,
      required int idElement,
      required int element,
      required List<int> slots,
      required int slotCalamite,
      required this.niveauKinsect,
      required this.rouge,
      required this.orange,
      required this.jaune,
      required this.vert,
      required this.bleu,
      required this.blanc,
      required this.violet,
      required this.sharpBoost})
      : super(
            name: name,
            rarete: rarete,
            categorie: categorie,
            niveau: niveau,
            talent: talent,
            attaque: attaque,
            affinite: affinite,
            defense: defense,
            idElement: idElement,
            element: element,
            slots: slots,
            slotCalamite: slotCalamite);

  factory Insectoglaive.fromJson(
      Map<String, dynamic> json, List<dynamic> skillList, String local) {
    var listSlots = json['slots'] as List<dynamic>;
    List<int> lSlots = List<int>.from(listSlots);
    String localizedNames = "";

    json['name'].forEach((key, value) {
      if (value is String && key == local) {
        localizedNames = value;
      }
    });
    var listSharpBoost = json['tranchantSVBoost'] as List<dynamic>;
    List<int> lSharpBoost = List<int>.from(listSharpBoost);

    return Insectoglaive(
        name: localizedNames,
        rarete: json['rarete'],
        categorie: json['categorie'],
        niveau: json['niveau'],
        talent: json['talentId'],
        attaque: json['attaque'],
        affinite: json['affinite'],
        defense: json['def'],
        idElement: json['idElement'],
        element: json['element'],
        slots: lSlots,
        slotCalamite: json['slotCalam'],
        niveauKinsect: json['niveauKinsect'],
        rouge: json['rouge'],
        orange: json['orange'],
        jaune: json['jaune'],
        vert: json['vert'],
        bleu: json['bleu'],
        blanc: json['blanc'],
        violet: json['violet'],
        sharpBoost: lSharpBoost);
  }

  @override
  set sharpBoost(List<int> _sharpBoost) {
    // TODO: implement sharpBoost
  }
}

class Arc extends Arme {
  final int 
      typeMun1,
      lvlTypeMun1,
      typeMun2,
      lvlTypeMun2,
      typeMun3,
      lvlTypeMun3,
      typeMun4,
      lvlTypeMun4,
      force,
      combat,
      poison,
      para,
      sleep,
      explo,
      fatigue,
      barrage;

  Arc(
      {required String name,
      required int rarete,
      required String categorie,
      required String niveau,
      required Talent? talent,
      required int attaque,
      required int affinite,
      required int defense,
      required int idElement,
      required int element,
      required List<int> slots,
      required int slotCalamite,
      required this.force,
      required this.combat,
      required this.poison,
      required this.para,
      required this.sleep,
      required this.explo,
      required this.fatigue,
      required this.typeMun1,
      required this.lvlTypeMun1,
      required this.typeMun2,
      required this.lvlTypeMun2,
      required this.typeMun3,
      required this.lvlTypeMun3,
      required this.typeMun4,
      required this.lvlTypeMun4,
      required this.barrage})
      : super(
            name: name,
            rarete: rarete,
            categorie: categorie,
            niveau: niveau,
            talent: talent,
            attaque: attaque,
            affinite: affinite,
            defense: defense,
            idElement: idElement,
            element: element,
            slots: slots,
            slotCalamite: slotCalamite);

  factory Arc.fromJson(
    Map<String, dynamic> json,
    List<dynamic> skillList,
    String local,
  ) {
    var listSlots = json['slots'] as List<dynamic>;
    List<int> lSlots = List<int>.from(listSlots);
    String localizedNames = "";

    json['name'].forEach((key, value) {
      if (value is String && key == local) {
        localizedNames = value;
      }
    });
    return Arc(
        name: localizedNames,
        rarete: json['rarete'],
        categorie: json['categorie'],
        niveau: json['niveau'],
        typeMun1: json['typeMun1'][0],
        lvlTypeMun1: json['typeMun1'][1],
        typeMun2: json['typeMun2'][0],
        lvlTypeMun2: json['typeMun2'][1],
        typeMun3: json['typeMun3'][0],
        lvlTypeMun3: json['typeMun3'][1],
        typeMun4: json['typeMun4'][0],
        lvlTypeMun4: json['typeMun4'][1],
        barrage: json['barrage'],
        attaque: json['attaque'],
        affinite: json['affinite'],
        defense: json['def'],
        idElement: json['idElement'],
        element: json['element'],
        slots: lSlots,
        slotCalamite: json['slotCalam'],
        force: json['force'],
        combat: json['combat'],
        poison: json['poison'],
        para: json['para'],
        sleep: json['sleep'],
        explo: json['explo'],
        fatigue: json['faiblesse'],
        talent: json['talentId']);
  }
}

class Fusarbalete extends Arme {
  final int recul, rechargement, sensDeviation, puissanceDeviation;
  final bool bombFrag;
  final List<dynamic> normal1,
      normal2,
      normal3,
      perfo1,
      perfo2,
      perfo3,
      grenaille1,
      grenaille2,
      grenaille3,
      shrapnel1,
      shrapnel2,
      shrapnel3,
      antib1,
      antib2,
      antib3,
      frag1,
      frag2,
      poison1,
      poison2,
      sleep1,
      sleep2,
      para1,
      para2,
      fatigue1,
      fatigue2,
      soin1,
      soin2,
      demon,
      pierre,
      feu,
      pFeu,
      eau,
      pEau,
      foudre,
      pFoudre,
      glace,
      pGlace,
      dragon,
      pDragon,
      tranch,
      tranquil;
  Fusarbalete(
      {required String name,
      required int rarete,
      required String categorie,
      required String niveau,
      required Talent? talent,
      required int attaque,
      required int affinite,
      required int defense,
      required int idElement,
      required int element,
      required List<int> slots,
      required int slotCalamite,
      required this.recul,
      required this.rechargement,
      required this.sensDeviation,
      required this.puissanceDeviation,
      required this.bombFrag,
      required this.normal1,
      required this.normal2,
      required this.normal3,
      required this.perfo1,
      required this.perfo2,
      required this.perfo3,
      required this.grenaille1,
      required this.grenaille2,
      required this.grenaille3,
      required this.shrapnel1,
      required this.shrapnel2,
      required this.shrapnel3,
      required this.antib1,
      required this.antib2,
      required this.antib3,
      required this.frag1,
      required this.frag2,
      required this.poison1,
      required this.poison2,
      required this.sleep1,
      required this.sleep2,
      required this.para1,
      required this.para2,
      required this.fatigue1,
      required this.fatigue2,
      required this.soin1,
      required this.soin2,
      required this.demon,
      required this.pierre,
      required this.feu,
      required this.pFeu,
      required this.eau,
      required this.pEau,
      required this.foudre,
      required this.pFoudre,
      required this.glace,
      required this.pGlace,
      required this.dragon,
      required this.pDragon,
      required this.tranch,
      required this.tranquil})
      : super(
            name: name,
            rarete: rarete,
            categorie: categorie,
            niveau: niveau,
            talent: talent,
            attaque: attaque,
            affinite: affinite,
            defense: defense,
            idElement: idElement,
            element: element,
            slots: slots,
            slotCalamite: slotCalamite);
}

class FusarbaleteLeger extends Fusarbalete {
  FusarbaleteLeger(
      {required String name,
      required int rarete,
      required String categorie,
      required String niveau,
      required Talent? talent,
      required int attaque,
      required int affinite,
      required int defense,
      required int idElement,
      required int element,
      required List<int> slots,
      required int slotCalamite,
      required int recul,
      required int rechargement,
      required int sensDeviation,
      required int puissanceDeviation,
      required bool bombFrag,
      required List<dynamic> normal1,
      required List<dynamic> normal2,
      required List<dynamic> normal3,
      required List<dynamic> perfo1,
      required List<dynamic> perfo2,
      required List<dynamic> perfo3,
      required List<dynamic> grenaille1,
      required List<dynamic> grenaille2,
      required List<dynamic> grenaille3,
      required List<dynamic> shrapnel1,
      required List<dynamic> shrapnel2,
      required List<dynamic> shrapnel3,
      required List<dynamic> antib1,
      required List<dynamic> antib2,
      required List<dynamic> antib3,
      required List<dynamic> frag1,
      required List<dynamic> frag2,
      required List<dynamic> poison1,
      required List<dynamic> poison2,
      required List<dynamic> sleep1,
      required List<dynamic> sleep2,
      required List<dynamic> para1,
      required List<dynamic> para2,
      required List<dynamic> fatigue1,
      required List<dynamic> fatigue2,
      required List<dynamic> soin1,
      required List<dynamic> soin2,
      required List<dynamic> demon,
      required List<dynamic> pierre,
      required List<dynamic> feu,
      required List<dynamic> pFeu,
      required List<dynamic> eau,
      required List<dynamic> pEau,
      required List<dynamic> foudre,
      required List<dynamic> pFoudre,
      required List<dynamic> glace,
      required List<dynamic> pGlace,
      required List<dynamic> dragon,
      required List<dynamic> pDragon,
      required List<dynamic> tranch,
      required List<dynamic> tranquil})
      : super(
            name: name,
            rarete: rarete,
            categorie: categorie,
            niveau: niveau,
            talent: talent,
            attaque: attaque,
            affinite: affinite,
            defense: defense,
            idElement: idElement,
            element: element,
            slots: slots,
            slotCalamite: slotCalamite,
            recul: recul,
            rechargement: rechargement,
            sensDeviation: sensDeviation,
            puissanceDeviation: puissanceDeviation,
            bombFrag: bombFrag,
            normal1: normal1,
            normal2: normal2,
            normal3: normal3,
            perfo1: perfo1,
            perfo2: perfo2,
            perfo3: perfo3,
            grenaille1: grenaille1,
            grenaille2: grenaille2,
            grenaille3: grenaille3,
            shrapnel1: shrapnel1,
            shrapnel2: shrapnel2,
            shrapnel3: shrapnel3,
            antib1: antib1,
            antib2: antib2,
            antib3: antib3,
            frag1: frag1,
            frag2: frag2,
            poison1: poison1,
            poison2: poison2,
            sleep1: sleep1,
            sleep2: sleep2,
            para1: para1,
            para2: para2,
            fatigue1: fatigue1,
            fatigue2: fatigue2,
            soin1: soin1,
            soin2: soin2,
            demon: demon,
            pierre: pierre,
            feu: feu,
            pFeu: pFeu,
            eau: eau,
            pEau: pEau,
            foudre: foudre,
            pFoudre: pFoudre,
            glace: glace,
            pGlace: pGlace,
            dragon: dragon,
            pDragon: pDragon,
            tranch: tranch,
            tranquil: tranquil);

  factory FusarbaleteLeger.fromJson(
      Map<String, dynamic> json, List<dynamic> skillList, String local) {
    var listSlots = json['slots'] as List<dynamic>;
    List<int> lSlots = List<int>.from(listSlots);
    String localizedNames = "";
    json['name'].forEach((key, value) {
      if (value is String && key == local) {
        localizedNames = value;
      }
    });

    return FusarbaleteLeger(
        name: localizedNames,
        rarete: json['rarete'],
        categorie: json['categorie'],
        niveau: json['niveau'],
        talent: json['talentId'],
        attaque: json['attaque'],
        affinite: json['affinite'],
        defense: json['def'],
        idElement: json['idElement'],
        element: json['element'],
        slots: lSlots,
        slotCalamite: json['slotCalam'],
        recul: json['recul'],
        rechargement: json['recharge'],
        sensDeviation: json['deviation'][0],
        puissanceDeviation: json['deviation'][1],
        bombFrag: json['bombFrag'],
        normal1: json['norm'][0],
        normal2: json['norm'][1],
        normal3: json['norm'][2],
        perfo1: json['perfo'][0],
        perfo2: json['perfo'][1],
        perfo3: json['perfo'][2],
        grenaille1: json['grenaille'][0],
        grenaille2: json['grenaille'][1],
        grenaille3: json['grenaille'][2],
        shrapnel1: json['shrapnel'][0],
        shrapnel2: json['shrapnel'][1],
        shrapnel3: json['shrapnel'][2],
        antib1: json['antib'][0],
        antib2: json['antib'][1],
        antib3: json['antib'][2],
        frag1: json['frag'][0],
        frag2: json['frag'][1],
        poison1: json['poison'][0],
        poison2: json['poison'][1],
        sleep1: json['sleep'][0],
        sleep2: json['sleep'][1],
        para1: json['para'][0],
        para2: json['para'][1],
        fatigue1: json['fatigue'][0],
        fatigue2: json['fatigue'][1],
        soin1: json['soin'][0],
        soin2: json['soin'][1],
        demon: json['demon'],
        pierre: json['pierre'],
        feu: json['feu'],
        pFeu: json['pFeu'],
        eau: json['eau'],
        pEau: json['pEau'],
        foudre: json['foudre'],
        pFoudre: json['pFoudre'],
        glace: json['glace'],
        pGlace: json['pGlace'],
        dragon: json['dragon'],
        pDragon: json['pDragon'],
        tranch: json['tranch'],
        tranquil: json['tranquil']);
  }
}
