import '../Musique.dart';
import '../Joyau.dart';
import '../Talent.dart';

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

class Tranchant extends Arme {
  List<int> sharpBoost;
  int rouge, orange, jaune, vert, bleu, blanc, violet;
  Tranchant(
      {required super.name,
      required super.rarete,
      required super.categorie,
      required super.niveau,
      required super.talent,
      required super.attaque,
      required super.affinite,
      required super.defense,
      required super.idElement,
      required super.element,
      required super.slots,
      required super.slotCalamite,
      required this.rouge,
      required this.orange,
      required this.jaune,
      required this.vert,
      required this.bleu,
      required this.blanc,
      required this.violet,
      required this.sharpBoost});
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
      {required super.name,
      required super.rarete,
      required super.categorie,
      required super.niveau,
      required super.talent,
      required super.attaque,
      required super.affinite,
      required super.defense,
      required super.idElement,
      required super.element,
      required super.slots,
      required super.slotCalamite,
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
      required this.tranquil});
}
