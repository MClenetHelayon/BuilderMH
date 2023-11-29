import 'package:builder_mhrs/object/Stuff.dart';
import 'package:builder_mhrs/object/weapon/Arc.dart';
import 'package:builder_mhrs/object/weapon/Arme.dart';

double getEspritIndomptable(int i, bool actif) {
  double vretour = 0;
  if (actif) {
    switch (i) {
      case 1:
        vretour = 5;
        break;
      case 2:
        vretour = 10;
        break;
      case 3:
        vretour = 20;
        break;
    }
  }
  return vretour;
}

double getVengeance(int i, bool actif) {
  double vretour = 0;
  if (actif) {
    switch (i) {
      case 1:
        vretour = 5;
        break;
      case 2:
        vretour = 10;
        break;
      case 3:
        vretour = 15;
        break;
      case 4:
        vretour = 20;
        break;
      case 5:
        vretour = 25;
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
        vretour = 10;
        break;
      case 2:
        vretour = 12;
        break;
      case 3:
        vretour = 15;
        break;
    }
    if (a is Fusarbalete || a is Arc) {
      switch (i) {
        case 1:
          vretour = 8;
          break;
        case 2:
          vretour = 9;
          break;
        case 3:
          vretour = 10;
          break;
      }
    }
  }
  return vretour;
}

double getPeakPerf(int i, bool actif) {
  double vretour = 0;
  if (actif) {
    switch (i) {
      case 1:
        vretour = 5;
        break;
      case 2:
        vretour = 10;
        break;
      case 3:
        vretour = 20;
        break;
    }
  }
  return vretour;
}

double getContreAttaque(int i, bool actif) {
  double vretour = 0;
  if (actif) {
    switch (i) {
      case 1:
        vretour = 10;
        break;
      case 2:
        vretour = 15;
        break;
      case 3:
        vretour = 25;
        break;
    }
  }
  return vretour;
}

double getMachine(int i, double actual) {
  double vretour = 0;
  switch (i) {
    case 1:
      vretour = 3;
      break;
    case 2:
      vretour = 6;
      break;
    case 3:
      vretour = 9;
      break;
    case 4:
      vretour = 7 + actual * 0.05;
      break;
    case 5:
      vretour = 8 + actual * 0.06;
      break;
    case 6:
      vretour = 9 + actual * 0.08;
      break;
    case 7:
      vretour = 10 + actual * 0.10;
      break;
  }
  return vretour;
}

double getMatraquage(int i, double actual) {
  double vretour = 0;
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
  return vretour;
}

double getGardOff(int i, double actual, bool actif) {
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

double getTemerite(int i, bool actif) {
  double vretour = 0;
  if (actif) {
    switch (i) {
      case 1:
        vretour = 4;
        break;
      case 2:
        vretour = 8;
        break;
      case 3:
        vretour = 12;
        break;
      case 4:
        vretour = 16;
        break;
      case 5:
        vretour = 20;
        break;
    }
  }
  return vretour;
}

double getHeroisme(int i, double actual, bool actif) {
  double vretour = 0;
  if (actif) {
    switch (i) {
      case 2:
        vretour = actual * 0.05;
        break;
      case 3:
        vretour = actual * 0.05;
        break;
      case 4:
        vretour = actual * 0.10;
        break;
      case 5:
        vretour = actual * 0.30;
    }
  }
  return vretour;
}

double getJV(int i, double actual, bool actif) {
  double vretour = 0;
  switch (i) {
    case 1:
      vretour = actual * 0.10;
      break;
    case 2:
      vretour = actual * 0.20;
      break;
  }
  return vretour;
}

double getBatto(int i) {
  double vretour = 0;
  switch (i) {
    case 1:
      vretour = 3;
      break;
    case 2:
      vretour = 5;
      break;
    case 3:
      vretour = 7;
      break;
  }
  return vretour;
}

double getDragonHeart(int i, double actual, bool actif) {
  double vretour = 0;
  if (actif) {
    switch (i) {
      case 4:
        vretour = actual * 0.05;
        break;
      case 5:
        vretour = actual * 0.10;
        break;
    }
  }
  return vretour;
}

double getAdrenaline(int i, bool actif) {
  double vretour = 0;
  if (actif) {
    switch (i) {
      case 1:
        vretour = 10;
        break;
      case 2:
        vretour = 15;
        break;
      case 3:
        vretour = 30;
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
        vretour = 12;
        break;
      case 2:
        vretour = 15;
        break;
      case 3:
        vretour = 18;
        break;
    }
  }
  return vretour;
}

double getIncursion(int i, bool actif) {
  double vretour = 0;
  if (actif) {
    switch (i) {
      case 1:
        vretour = 10;
        break;
      case 2:
        vretour = 10;
        break;
      case 3:
        vretour = 15;
        break;
    }
  }
  return vretour;
}

double getFurtif(int i, double actual, bool actif) {
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
        vretour = actual * 0.12;
        break;
    }
  }
  return vretour;
}

double getEveilDeSang(int i, bool actif, Arme a) {
  double vretour = 0;
  if (actif) {
    if (a is Fusarbalete || a is Arc) {
      switch (i) {
        case 1:
          vretour = 8;
          break;
        case 2:
          vretour = 15;
          break;
        case 3:
          vretour = 25;
          break;
      }
    } else {
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
    }
  }
  return vretour;
}

double getSoifDeSang(int i, bool actif) {
  double vretour = 0;
  if (actif) {
    switch (i) {
      case 1:
        vretour = 10;
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

double getAbandon(int i, bool actif) {
  double vretour = 0;
  if (actif && !(Stuff.scroll)) {
    switch (i) {
      case 1:
        vretour = 25;
        break;
      case 2:
        vretour = 30;
        break;
      case 3:
        vretour = 35;
        break;
    }
  }
  return vretour;
}

double getMailOfHellFire(int i, bool actif) {
  double vretour = 0;
  if (actif && Stuff.scroll) {
    switch (i) {
      case 1:
        vretour = 15;
        break;
      case 2:
        vretour = 25;
        break;
      case 3:
        vretour = 35;
        break;
    }
  }
  return vretour;
}
