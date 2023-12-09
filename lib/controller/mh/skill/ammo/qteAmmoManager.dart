int getMaxMun1(int lvl) {
  int vretour = 0;
  if (lvl != 0) {
    vretour = 1;
  }
  return vretour;
}

int getMaxMun2(int lvl) {
  int vretour = 0;
  if (lvl >= 2) {
    vretour = 1;
  }
  return vretour;
}

int getMaxMun3(int lvl) {
  int vretour = 0;
  if (lvl >= 3) {
    vretour = 1;
  }
  return vretour;
}

int getMaxMun13(int lvl) {
  int vretour = 0;
  if (lvl != 0 && lvl < 3) {
    vretour = 1;
  }
  if (lvl >= 3) {
    vretour = 2;
  }
  return vretour;
}

int getMaxMun23(int lvl) {
  int vretour = 0;
  if (lvl == 2) {
    vretour = 1;
  }
  if (lvl >= 3) {
    vretour = 2;
  }
  return vretour;
}
