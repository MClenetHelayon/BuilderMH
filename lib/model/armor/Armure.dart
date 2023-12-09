import 'package:builder_mhrs/model/Talent.dart';

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
