import 'package:builder_mhrs/object/armor/Armure.dart';
import 'package:builder_mhrs/object/armor/Bras.dart';
import 'package:builder_mhrs/object/armor/Casque.dart';
import 'package:builder_mhrs/object/armor/Ceinture.dart';
import 'package:builder_mhrs/object/armor/Jambe.dart';
import 'package:builder_mhrs/object/armor/Plastron.dart';

int convertIconInt(Armure a) {
  int vretour = 0;
  switch (a.runtimeType) {
    case Casque:
      vretour = 1;
      break;
    case Plastron:
      vretour = 2;
      break;
    case Bras:
      vretour = 3;
      break;
    case Ceinture:
      vretour = 4;
      break;
    case Jambiere:
      vretour = 5;
      break;
  }
  return vretour;
}
