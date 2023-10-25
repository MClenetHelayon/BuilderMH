import 'Joyau.dart';
import 'Talent.dart';

class Talisman {
  final List<Talent> talents;
  final List<int> slots;
  static List<Joyaux> listJoyaux = [];

  Talisman(this.talents, this.slots);
  static getBase() {
    return Talisman([], []);
  }
}
