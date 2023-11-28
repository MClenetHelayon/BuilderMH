import 'package:builder_mhrs/manager/mh/statManager.dart';
import 'package:builder_mhrs/object/Stuff.dart';
import 'package:builder_mhrs/object/weapon/Arme.dart';

String listTranchant(Stuff s) {
  List<int> allSharp = allIntSharp(s);
  if (allSharp[4] != 0 && allSharp[5] == 0 && Arme.augments) {
    allSharp[4] += Arme.transcendance.sharp;
  }
  if (allSharp[5] != 0 && allSharp[6] == 0 && Arme.augments) {
    allSharp[5] += Arme.transcendance.sharp;
  }
  if (allSharp[6] != 0 && Arme.augments) {
    allSharp[6] += Arme.transcendance.sharp;
  }
  return "${allSharp[0]}/${allSharp[1]}/${allSharp[2]}/${allSharp[3]}/${allSharp[4]}/${allSharp[5]}/${allSharp[6]}";
}
