String element(int id) {
  String img = 'images/logoBuildCard.png';
  switch (id) {
    case 1:
      img = 'images/elementaire/Feu.webp';
      break;
    case 2:
      img = 'images/elementaire/Eau.webp';
      break;
    case 3:
      img = 'images/elementaire/Foudre.webp';
      break;
    case 4:
      img = 'images/elementaire/Glace.webp';
      break;
    case 5:
      img = 'images/elementaire/Dragon.webp';
      break;
    case 6:
      img = 'images/elementaire/Poison.png';
      break;
    case 7:
      img = 'images/elementaire/Para.png';
      break;
    case 8:
      img = 'images/elementaire/Sleep.png';
      break;
    case 9:
      img = 'images/elementaire/Explo.png';
  }
  return img;
}

String slot(int slot) {
  String img = 'images/logoBuildCard.png';
  switch (slot) {
    case 1:
      img = "images/joyau/j1.png";
      break;
    case 2:
      img = "images/joyau/j2.png";
      break;
    case 3:
      img = "images/joyau/j3.png";
      break;
    case 4:
      img = "images/joyau/j4.png";
      break;
  }
  return img;
}

String slotCalam(int slot) {
  String img = 'images/logoBuildCard.png';
  switch (slot) {
    case 1:
      img = "images/joyau/ramp1.png";
      break;
    case 2:
      img = "images/joyau/ramp2.png";
      break;
    case 3:
      img = "images/joyau/ramp3.png";
      break;
  }
  return img;
}

String arme(String categorie) {
  String img = 'images/arme/GreatSword.png';
  switch (categorie) {
    case 'GS':
      img = 'images/arme/GreatSword.png';
      break;
    case 'LS':
      img = 'images/arme/LongSword.png';
      break;
    case 'SNS':
      img = 'images/arme/SwordNShield.png';
      break;
    case 'DB':
      img = 'images/arme/DualBlades.png';
      break;
    case 'MRTO':
      img = 'images/arme/Hammer.png';
      break;
    case 'HH':
      img = 'images/arme/HuntingHorn.png';
      break;
    case 'LNC':
      img = 'images/arme/Lance.png';
      break;
    case 'GL':
      img = 'images/arme/Gunlance.png';
      break;
    case 'SA':
      img = 'images/arme/SwitchAxe.png';
      break;
    case 'CB':
      img = 'images/arme/ChargeBlade.png';
      break;
    case 'IG':
      img = 'images/arme/InsectGlaive.png';
      break;
    case 'ARC':
      img = 'images/arme/Bow.png';
      break;
    case 'LBG':
      img = 'images/arme/LightBowGun.png';
      break;
    case 'HBG':
      img = 'images/arme/HeavyBowGun.png';
      break;
  }
  return img;
}

String armure(int id) {
  String vretour = "images/armure/Casque.png";
  switch (id) {
    case 1:
      vretour = "images/armure/Casque.png";
      break;
    case 2:
      vretour = "images/armure/Torse.png";
      break;
    case 3:
      vretour = "images/armure/Bras.png";
      break;
    case 4:
      vretour = "images/armure/Ceinture.png";
      break;
    case 5:
      vretour = "images/armure/Jambe.png";
      break;
    case 6:
      vretour = "images/armure/Petalas.png";
      break;
    case 7:
      vretour = "images/armure/Talisman.png";
  }
  return vretour;
}

String musique(int id) {
  String vretour = "images/logoBuildCard.png";
  switch (id) {
    case 0:
      vretour = "images/arme/hhnote/note1.png";
      break;
    case 1:
      vretour = "images/arme/hhnote/note2.png";
      break;
    case 2:
      vretour = "images/arme/hhnote/note3.png";
      break;
  }
  return vretour;
}
