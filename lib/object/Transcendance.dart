class Transcendance {
  final int slot1,
      slot2,
      slot3,
      slot4,
      slot5,
      slot6,
      slot7,
      slot8,
      slot9,
      slot10,
      att,
      elem,
      sharp;

  Transcendance(
      {required this.slot1,
      required this.slot2,
      required this.slot3,
      required this.slot4,
      required this.slot5,
      required this.slot6,
      required this.slot7,
      required this.slot8,
      required this.slot9,
      required this.slot10,
      required this.att,
      required this.elem,
      required this.sharp});

  static getBase() {
    return Transcendance(
        slot1: 0,
        slot2: 0,
        slot3: 0,
        slot4: 0,
        slot5: 0,
        slot6: 0,
        slot7: 0,
        slot8: 0,
        slot9: 0,
        slot10: 0,
        att: 0,
        elem: 0,
        sharp: 0);
  }
}
