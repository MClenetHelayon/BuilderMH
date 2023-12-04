import 'package:builder_mhrs/object/Joyau.dart';
import 'package:builder_mhrs/object/Talent.dart';

class Talisman {
  final List<Talent> talents;
  final List<int> slots;
  static List<Joyaux> listJoyaux = [];

  Talisman(this.talents, this.slots);
  static getBase() {
    return Talisman([], []);
  }
}
