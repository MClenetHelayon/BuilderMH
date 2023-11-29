import 'package:builder_mhrs/object/Kinsect.dart';
import 'package:builder_mhrs/object/Talisman.dart';

import '../manager/mh/skill/calculManager.dart' as aff;
import 'armor/Bras.dart';
import 'armor/Casque.dart';
import 'armor/Ceinture.dart';
import 'armor/Jambe.dart';
import 'armor/Plastron.dart';
import 'weapon/Arme.dart';
import 'Florelet.dart';
import 'Joyau.dart';
import 'JoyauCalam.dart';
import 'Talent.dart';

class Stuff {
  static String local = 'fr';
  static List<Talent> lSkill = [];
  late Map<Talent, int> _talents = {};
  static List<Joyaux> ljowel = [];
  late Casque helmet;
  late Plastron torso;
  late Bras gant;
  late Ceinture boucle;
  late Jambiere pied;
  late Talisman charm;
  late Arme weapon;
  late JoyauxCalam joyauxCalam;
  late Florelet florelet;
  late Kinsect kinsect;
  num affinite = 0;
  int nbSavoirFaire = 0;
  double critBoost = 1.25, critElem = 1, sharpRaw = 0.5, sharpElem = 0.25;

  Stuff(this.helmet, this.torso, this.gant, this.boucle, this.pied, this.charm,
      this.weapon, this.joyauxCalam, this.florelet, this.kinsect);

  getCasque() => helmet;
  getPlastron() => torso;
  getBras() => gant;
  getCeinture() => boucle;
  getJambiere() => pied;
  getCharm() => charm;
  getWeapon() => weapon;
  getJoyauCalam() => joyauxCalam;
  getFlorelet() => florelet;
  getKinsect() => kinsect;
  getNbSavoirFaire() => nbSavoirFaire;
  getAffinite() => affinite;
  getCritBoost() => critBoost;
  getSharpRaw() => sharpRaw;
  getSharpElem() => sharpElem;
  getAllTalents() => _talents;

  setCasque(Casque value) => helmet = value;
  setPlastron(Plastron value) => torso = value;
  setBras(Bras value) => gant = value;
  setCeinture(Ceinture value) => boucle = value;
  setJambiere(Jambiere value) => pied = value;
  setCharm(Talisman value) => charm = value;
  setWeapon(Arme value) => weapon = value;
  setJoyauCalam(JoyauxCalam value) => joyauxCalam = value;
  setFlorelet(Florelet value) => florelet = value;
  setKinsect(Kinsect value) => kinsect = value;
  setNbSavoirFaire(int value) => nbSavoirFaire = value;
  setAffinite(num value) => affinite = value;
  setCritBoost(double value) => critBoost = value;
  setSharpRaw(double value) => sharpRaw = value;
  setSharpElem(double value) => sharpElem = value;
  setLocal(String value) => local = value;

  void getListTalents() {
    _talents = {};
    if (Arme.listJoyaux.isNotEmpty) addSkillJowel(Arme.listJoyaux);
    if (Casque.listJoyaux.isNotEmpty) addSkillJowel(Casque.listJoyaux);
    if (Plastron.listJoyaux.isNotEmpty) addSkillJowel(Plastron.listJoyaux);
    if (Bras.listJoyaux.isNotEmpty) addSkillJowel(Bras.listJoyaux);
    if (Ceinture.listJoyaux.isNotEmpty) addSkillJowel(Ceinture.listJoyaux);
    if (Jambiere.listJoyaux.isNotEmpty) addSkillJowel(Jambiere.listJoyaux);
    if (Talisman.listJoyaux.isNotEmpty) addSkillJowel(Talisman.listJoyaux);
    addSkillNatif(helmet.talents);
    addSkillNatif(torso.talents);
    addSkillNatif(gant.talents);
    addSkillNatif(boucle.talents);
    addSkillNatif(pied.talents);
    addSkillNatif(charm.talents);
    _talents = Map.fromEntries(
      _talents.entries.toList()
        ..sort((a, b) {
          final valueComparison = b.value.compareTo(a.value);
          if (valueComparison != 0) {
            return valueComparison;
          }
          return a.key.id.compareTo(b.key.id);
        }),
    );
    nbSavoirFaire = getTalentValueById(125);
    affinite = aff.affinite(this);
  }

  void addSkillNatif(List<Talent> listeTalent) {
    for (Talent talent in listeTalent) {
      bool found = false;
      for (var existingTalent in _talents.keys) {
        if (existingTalent.id == talent.id) {
          _talents[existingTalent] = _talents[existingTalent]! + talent.level;
          found = true;
          break;
        }
      }

      if (!found) {
        _talents[talent] = talent.level;
      }
    }
  }

  void addSkillJowel(List<Joyaux> listeJoyaux) {
    for (Joyaux jowel in listeJoyaux) {
      for (Talent talent in lSkill) {
        if (jowel.nameSkill == talent.name) {
          bool found = false;
          for (var existingTalent in _talents.keys) {
            if (existingTalent.id == talent.id) {
              _talents[existingTalent] =
                  _talents[existingTalent]! + jowel.level;
              found = true;
              break;
            }
          }

          if (!found) {
            _talents[talent] = jowel.level;
          }
        }
      }
    }
  }

  int getTalentValueById(int keyId) {
    for (var entry in _talents.entries) {
      if (entry.key.id == keyId) {
        return entry.value;
      }
    }
    return 0;
  }

  Talent getTalentById(int keyId) {
    for (var entry in _talents.entries) {
      if (entry.key.id == keyId) {
        return entry.key;
      }
    }
    return Talent.getBase();
  }
}
