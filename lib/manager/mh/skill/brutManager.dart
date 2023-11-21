double getEspritIndomptable(int i) {
  double vretour = 0;
  switch (i) {
    case 0:
      vretour = 0;
      break;
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
  return vretour;
}

double getVengeance(int i) {
  double vretour = 0;
  switch (i) {
    case 0:
      vretour = 0;
      break;
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
  return vretour;
}

double getVendetta(int i) {
  double vretour = 0;
  if (i != 0) {
    vretour = 5;
  }
  return vretour;
}

double getPeakPerf(int i) {
  double vretour = 0;
  switch (i) {
    case 0:
      vretour = 0;
      break;
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
  return vretour;
}

double getContreAttaque(int i) {
  double vretour = 0;
  switch (i) {
    case 0:
      vretour = 0;
      break;
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
  return vretour;
}

double getMachine(int i, double actual) {
  double vretour = 0;
  switch (i) {
    case 0:
      vretour = 0;
      break;
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
    case 0:
      vretour = 0;
      break;
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

double getGardOff(int i, double actual) {
  double vretour = 0;
  switch (i) {
    case 0:
      vretour = 0;
      break;
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

double getTemerite(int i) {
  double vretour = 0;
  switch (i) {
    case 0:
      vretour = 0;
      break;
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
  return vretour;
}

double getHeroisme(int i, double actual) {
  double vretour = 0;
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
  return vretour;
}

double getJV(int i, double actual) {
  double vretour = 0;
  switch (i) {
    case 0:
      vretour = 0;
      break;
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
    case 0:
      vretour = 0;
      break;
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

double getDragonHeart(int i, double actual) {
  double vretour = 0;
  switch (i) {
    case 4:
      vretour = actual * 0.05;
      break;
    case 5:
      vretour = actual * 0.10;
      break;
  }
  return vretour;
}
