import 'package:builder_mhrs/object/Stuff.dart';
import 'package:builder_mhrs/object/weapon/Arc.dart';
import 'package:builder_mhrs/object/weapon/Arme.dart';
import 'package:builder_mhrs/object/weapon/tranchant/LameDouble.dart';

double getSoifDeSang(int i, bool actif) {
  double vretour = 0;
  if (actif) {
    switch (i) {
      case 1:
        vretour = 5;
        break;
      case 2:
        vretour = 7;
        break;
      case 3:
        vretour = 10;
        break;
    }
  }
  return vretour;
}

double getAbandon(int i, bool actif) {
  double vretour = 0;
  if (actif && Stuff.scroll) {
    switch (i) {
      case 1:
        vretour = 12;
        break;
      case 2:
        vretour = 15;
        break;
      case 3:
        vretour = 20;
        break;
    }
  }
  return vretour;
}

double getVendetta(int i, bool actif, Arme a) {
  double vretour = 0;
  if (actif) {
    switch (i) {
      case 1:
        vretour = 8;
        if (a is LameDouble || a is Arc) vretour = 6;

        break;
      case 2:
        vretour = 10;
        if (a is LameDouble || a is Arc) vretour = 8;

        break;
      case 3:
        vretour = 15;
        if (a is LameDouble) vretour = 12;
        if (a is Arc) vretour = 10;
        break;
    }
  }
  return vretour;
}

double getBoostElement(int i, double actual, bool actif) {
  double vretour = 0;
  if (actif) {
    switch (i) {
      case 1:
        vretour = 2;
        break;
      case 2:
        vretour = 3;
        break;
      case 3:
        vretour = 4 + actual * 0.05;
        break;
      case 4:
        vretour = 4 + actual * 0.10;
        break;
      case 5:
        vretour = 4 + actual * 0.20;
        break;
    }
  }
  return vretour;
}

double getKushTeoBlessing(int i, double actual, bool actif) {
  double vretour = 0;
  if (actif) {
    switch (i) {
      case 1:
        vretour = actual * 0.05;
        break;
      case 2:
        vretour = actual * 0.10;
        break;
    }
  }
  return vretour;
}

double getStormsoul(int i, double actual, bool actif) {
  double vretour = 0;
  if (actif) {
    switch (i) {
      case 1:
        vretour = actual * 0.05;
        break;
      case 2:
        vretour = actual * 0.10;
        break;
      case 3:
        vretour = actual * 0.15;
        break;
    }
  }
  return vretour;
}

double getEveilDeSang(int i, bool actif, Arme a) {
  double vretour = 0;
  if (actif) {
    switch (i) {
      case 1:
        vretour = 10;
        break;
      case 2:
        vretour = 20;
        break;
      case 3:
        vretour = 40;
        break;
    }
    if (a is Fusarbalete || a is Arc) {
      switch (i) {
        case 1:
          vretour = 8;
          break;
        case 2:
          vretour = 10;
          break;
        case 3:
          vretour = 15;
          break;
      }
    }
  }
  return vretour;
}

double getMailOfHellFire(int i, double actual, bool actif) {
  double vretour = 0;
  if (actif && !(Stuff.scroll)) {
    switch (i) {
      case 1:
        vretour = actual * 0.05;
        break;
      case 2:
        vretour = actual * 0.10;
        break;
      case 3:
        vretour = actual * 0.20;
        break;
    }
  }
  return vretour;
}

double getLutte(int i, double actual, bool actif) {
  double vretour = 0;
  if (actif) {
    switch (i) {
      case 1:
        vretour = actual * 0.10;
        break;
      case 2:
        vretour = actual * 0.15;
        break;
      case 3:
        vretour = actual * 0.20;
        break;
    }
  }
  return vretour;
}

double getUnion(int i, bool actif) {
  double vretour = 0;
  if (actif) {
    switch (i) {
      case 1:
        vretour = 2;
        break;
      case 2:
        vretour = 3;
        break;
      case 3:
        vretour = 4;
        break;
    }
  }
  return vretour;
}

double getConvDragonRed(int i, int sumDef, bool actif, Arme a) {
  double vretour = 0;
  if (actif && Stuff.scroll) {
    if (a is Arc || a is Fusarbalete) {
      if (i != 0) vretour = sumDef * 0.04;

      if (i == 3) vretour = sumDef * 0.08;
    } else {
      if (i != 0) vretour = sumDef * 0.15;

      if (i == 3) vretour = sumDef * 0.25;
    }
  }
  return vretour;
}

//Crit Element
double getCritElement(int i, double actual, bool actif) {
  double vretour = 0;
  if (actif) {
    switch (i) {
      case 1:
        vretour = actual * 0.05;
        break;
      case 2:
        vretour = actual * 0.10;
        break;
      case 3:
        vretour = actual * 0.15;
        break;
    }
  }
  return vretour;
}
