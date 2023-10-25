import '../Arme.dart';

class FusarbaleteLourd extends Fusarbalete {
  final int tirSpe;
  final List<dynamic> frag3, wyvern;
  FusarbaleteLourd(
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
      required super.recul,
      required super.rechargement,
      required super.sensDeviation,
      required super.puissanceDeviation,
      required this.tirSpe,
      required super.bombFrag,
      required super.normal1,
      required super.normal2,
      required super.normal3,
      required super.perfo1,
      required super.perfo2,
      required super.perfo3,
      required super.grenaille1,
      required super.grenaille2,
      required super.grenaille3,
      required super.shrapnel1,
      required super.shrapnel2,
      required super.shrapnel3,
      required super.antib1,
      required super.antib2,
      required super.antib3,
      required super.frag1,
      required super.frag2,
      required this.frag3,
      required super.poison1,
      required super.poison2,
      required super.sleep1,
      required super.sleep2,
      required super.para1,
      required super.para2,
      required super.fatigue1,
      required super.fatigue2,
      required super.soin1,
      required super.soin2,
      required super.demon,
      required super.pierre,
      required super.feu,
      required super.pFeu,
      required super.eau,
      required super.pEau,
      required super.foudre,
      required super.pFoudre,
      required super.glace,
      required super.pGlace,
      required super.dragon,
      required super.pDragon,
      required super.tranch,
      required this.wyvern,
      required super.tranquil});

  factory FusarbaleteLourd.fromJson(
      Map<String, dynamic> json, List<dynamic> skillList, String local) {
    var listSlots = json['slots'] as List<dynamic>;
    List<int> lSlots = List<int>.from(listSlots);
    String localizedNames = "";
    json['name'].forEach((key, value) {
      if (value is String && key == local) {
        localizedNames = value;
      }
    });

    return FusarbaleteLourd(
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
        tirSpe: json['tirSpe'],
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
        frag3: json['frag3'],
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
        wyvern: json['wyvern'],
        tranquil: json['tranquil']);
  }
}
