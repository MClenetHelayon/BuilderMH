import 'package:builder_mhrs/controller/mh/weapon/sharpManager.dart';
import 'package:builder_mhrs/model/Stuff.dart';

double getBoostRaw(Stuff s) {
  List<int> allSharp = allIntSharp(s);
  double vretour = 0;
  if (allSharp[0] != 0) vretour = 0.50;
  if (allSharp[1] != 0) vretour = 0.75;
  if (allSharp[2] != 0) vretour = 1.00;
  if (allSharp[3] != 0) vretour = 1.05;
  if (allSharp[4] != 0) vretour = 1.20;
  if (allSharp[5] != 0) vretour = 1.32;
  if (allSharp[6] != 0) vretour = 1.39;
  return vretour;
}

double getBoostElem(Stuff s) {
  List<int> allSharp = allIntSharp(s);
  double vretour = 0;
  if (allSharp[0] != 0) vretour = 0.25;
  if (allSharp[1] != 0) vretour = 0.50;
  if (allSharp[2] != 0) vretour = 0.75;
  if (allSharp[3] != 0) vretour = 1.00;
  if (allSharp[4] != 0) vretour = 1.0625;
  if (allSharp[5] != 0) vretour = 1.15;
  if (allSharp[6] != 0) vretour = 1.25;
  return vretour;
}
