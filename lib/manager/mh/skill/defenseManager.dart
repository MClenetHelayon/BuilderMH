double getBastionDef(int i, double actual) {
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
      vretour = 10 + actual * 0.05;
      break;
    case 4:
      vretour = 20 + actual * 0.05;
      break;
    case 5:
      vretour = 20 + actual * 0.08;
      break;
    case 6:
      vretour = 35 + actual * 0.08;
      break;
    case 7:
      vretour = 35 + actual * 0.10;
      break;
  }
  return vretour;
}

int getDefInDefElem(int i) {
  int vretour = 0;
  if (i >= 3) {
    vretour = 10;
  }
  return vretour;
}

double getHeroisme(int i) {
  double vretour = 0;
  switch (i) {
    case 1:
      vretour = 50;
    case 2:
      vretour = 50;
      break;
    case 3:
      vretour = 100;
      break;
    case 4:
      vretour = 100;
      break;
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
      vretour = actual * 0.15;
      break;
    case 2:
      vretour = actual * 0.30;
      break;
  }
  return vretour;
}

int getBastionElem(int i) {
  int vretour = 0;
  switch (i) {
    case 4:
      vretour = 3;
      break;
    case 5:
      vretour = 3;
      break;
    case 6:
      vretour = 5;
      break;
    case 7:
      vretour = 5;
      break;
  }
  return vretour;
}

int getDragonHeart(int i) {
  int vretour = 0;
  switch (i) {
    case 0:
      vretour = 0;
      break;
    case 1:
      vretour = 30;
      break;
    case 2:
      vretour = 50;
      break;
    case 3:
      vretour = 50;
      break;
    case 4:
      vretour = 50;
      break;
    case 5:
      vretour = 50;
      break;
  }
  return vretour;
}

int getDefElem(int i) {
  int vretour = 0;
  switch (i) {
    case 0:
      vretour = 0;
      break;
    case 1:
      vretour = 6;
      break;
    case 2:
      vretour = 12;
      break;
    case 3:
      vretour = 20;
      break;
  }
  return vretour;
}

int getAlignement(int i) {
  int vretour = 0;
  switch (i) {
    case 0:
      vretour = 0;
      break;
    case 1:
      vretour = 1;
      break;
    case 2:
      vretour = 2;
      break;
    case 3:
      vretour = 3;
      break;
    case 4:
      vretour = 4;
      break;
  }
  return vretour;
}