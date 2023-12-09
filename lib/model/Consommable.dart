class Consommable {
  bool griffeA,
      griffeD,
      charmA,
      charmD,
      graineA,
      graineD,
      popoA,
      popoD,
      poudreA,
      poudreD;

  Consommable(
      {required this.griffeA,
      required this.griffeD,
      required this.charmA,
      required this.charmD,
      required this.graineA,
      required this.graineD,
      required this.popoA,
      required this.popoD,
      required this.poudreA,
      required this.poudreD});

  static getBase() {
    return Consommable(
        griffeA: true,
        griffeD: true,
        charmA: true,
        charmD: true,
        graineA: false,
        graineD: false,
        popoA: false,
        popoD: false,
        poudreA: false,
        poudreD: false);
  }
}
