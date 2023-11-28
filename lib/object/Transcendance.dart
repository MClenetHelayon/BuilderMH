class Transcendance {
  int slotTotal = 10, att, aff, elem, affl, sharp, calam, shell;
  List<bool> bRamp = [false, false],
      bAtt = [false, false, false, false],
      bAff = [false, false, false],
      bAffl = [false, false, false, false],
      bElem = [false, false, false, false, false, false, false, false],
      bSharp = [false, false, false, false],
      bShell = [false, false];

  Transcendance(
      {required this.att,
      required this.aff,
      required this.elem,
      required this.affl,
      required this.sharp,
      required this.calam,
      required this.shell});

  static getBase() {
    return Transcendance(
        att: 0, aff: 0, elem: 0, affl: 0, sharp: 0, calam: 0, shell: 0);
  }

  void reset() {
    slotTotal = 10;
  }

  void fullReset() {
    slotTotal = 10;
    bRamp = [false, false];
    bAtt = [false, false, false, false];
    bAff = [false, false, false];
    bAffl = [false, false, false, false];
    bElem = [false, false, false, false, false, false, false, false];
    bSharp = [false, false, false, false];
    bShell = [false, false];
    att = 0;
    aff = 0;
    elem = 0;
    affl = 0;
    sharp = 0;
    calam = 0;
    shell = 0;
  }

  void notOverflow() {
    if (slotTotal > 10) {
      slotTotal = 10;
    }
    if (slotTotal < 0) {
      slotTotal = 0;
    }
  }
}
