double getAbandon(int i, double actual, bool actif) {
  double vretour = 0;
  if (actif) {
    switch (i) {
      case 1:
        vretour = actual * 0.15;
        break;
      case 2:
        vretour = actual * 0.20;
        break;
      case 3:
        vretour = actual * 0.25;
        break;
    }
  }
  return vretour;
}

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

double getBoostAffliction(int i, bool actif) {
  double vretour = 0;
  if (actif) {
    switch (i) {
      case 1:
        vretour = 1;
        break;
      case 2:
        vretour = 2;
        break;
      case 3:
        vretour = 3;
        break;
    }
  }
  return vretour;
}

double getBuildupBoostAffliction(int i, double actual, bool actif) {
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
        vretour = actual * 0.20;
        break;
    }
  }
  return vretour;
}

double getBuildupUnion(int i, double actual, bool actif) {
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

double getBuildupTeo(int i, double actual, bool actif) {
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
