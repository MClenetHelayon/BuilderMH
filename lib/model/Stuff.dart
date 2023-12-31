import 'package:builder_mhrs/model/Consommable.dart';
import 'package:builder_mhrs/model/armor/Florelet.dart';
import 'package:builder_mhrs/model/Joyau.dart';
import 'package:builder_mhrs/model/JoyauCalam.dart';
import 'package:builder_mhrs/model/Kinsect.dart';
import 'package:builder_mhrs/model/Talent.dart';
import 'package:builder_mhrs/controller/logic/stat.dart' as aff;
import 'package:builder_mhrs/model/armor/Bras.dart';
import 'package:builder_mhrs/model/armor/Casque.dart';
import 'package:builder_mhrs/model/armor/Ceinture.dart';
import 'package:builder_mhrs/model/armor/Jambe.dart';
import 'package:builder_mhrs/model/armor/Plastron.dart';
import 'package:builder_mhrs/model/armor/Talisman.dart';
import 'package:builder_mhrs/model/weapon/Arme.dart';

class Stuff {
  static bool scroll = true;
  static String local = 'fr';
  static List<Talent> lSkill = [];
  static List<Joyaux> ljowel = [];
  static Consommable consommable = Consommable.getBase();
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
  late Map<Talent, int> _talents = {};
  num affinite = 0;
  int nbSavoirFaire = 0;
  double critBoost = 1.25,
      critElem = 1,
      affBuilup = 1,
      sharpRaw = 0.5,
      sharpElem = 0.25;

  Stuff(this.helmet, this.torso, this.gant, this.boucle, this.pied, this.charm,
      this.weapon, this.joyauxCalam, this.florelet, this.kinsect);

  getAllTalents() => _talents;
  setSharpRaw(double value) => sharpRaw = value;
  setSharpElem(double value) => sharpElem = value;

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
