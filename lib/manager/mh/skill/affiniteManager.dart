import 'package:builder_mhrs/object/Stuff.dart';

double getBerserk(int i, Stuff s) {
  double vretour = 0;
  switch (i) {
    case 0:
      vretour = 1.25;
      break;
    case 1:
      vretour = 1.30;
      break;
    case 2:
      vretour = 1.35;
      break;
    case 3:
      vretour = 1.40;
      break;
  }
  if (s.affinite < 0) {
    vretour = 0.75;
  }
  return vretour;
}

int getMaitre(int i) {
  int vretour = 0;
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
    case 6:
      vretour = 30;
      break;
    case 7:
      vretour = 40;
      break;
  }
  return vretour;
}

int getMaM(int i) {
  int vretour = 0;
  switch (i) {
    case 0:
      vretour = 0;
      break;
    case 1:
      vretour = 15;
      break;
    case 2:
      vretour = 30;
      break;
    case 3:
      vretour = 50;
      break;
  }
  return vretour;
}

int getTemerite(int i) {
  int vretour = 0;
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
    case 4:
      vretour = 10;
      break;
    case 5:
      vretour = 15;
      break;
  }
  return vretour;
}

int getForceLatente(int i) {
  int vretour = 0;
  switch (i) {
    case 0:
      vretour = 0;
      break;
    case 1:
      vretour = 10;
      break;
    case 2:
      vretour = 20;
      break;
    case 3:
      vretour = 30;
      break;
    case 4:
      vretour = 40;
      break;
    case 5:
      vretour = 50;
      break;
  }
  return vretour;
}

int getCorpsEtAme(int i) {
  int vretour = 0;
  switch (i) {
    case 0:
      vretour = 0;
      break;
    case 1:
      vretour = 10;
      break;
    case 2:
      vretour = 20;
      break;
    case 3:
      vretour = 30;
      break;
  }
  return vretour;
}

int getDegainage(int i) {
  int vretour = 0;
  switch (i) {
    case 0:
      vretour = 0;
      break;
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
  return vretour;
}
