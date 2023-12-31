import 'dart:convert';
import 'package:builder_mhrs/model/armor/Florelet.dart';
import 'package:builder_mhrs/model/JoyauCalam.dart';
import 'package:builder_mhrs/model/Kinsect.dart';
import 'package:builder_mhrs/model/Stuff.dart';
import 'package:builder_mhrs/model/Talent.dart';
import 'package:builder_mhrs/model/armor/Bras.dart';
import 'package:builder_mhrs/model/armor/Casque.dart';
import 'package:builder_mhrs/model/armor/Ceinture.dart';
import 'package:builder_mhrs/model/armor/Jambe.dart';
import 'package:builder_mhrs/model/armor/Plastron.dart';
import 'package:builder_mhrs/model/armor/Talisman.dart';
import 'package:builder_mhrs/model/weapon/Arme.dart';
import 'package:builder_mhrs/model/weapon/tranchant/GrandeEpee.dart';
import 'package:builder_mhrs/provider/app_state.dart';
import 'package:builder_mhrs/provider/stuff_state.dart';
import 'package:devicelocale/devicelocale.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Future<void> loadArmorData(BuildContext context) async {
  String currentLocale;
  try {
    currentLocale = Provider.of<AppState>(context, listen: false)
        .currentLocale
        .languageCode
        .split(RegExp(r'[-_]'))
        .first;
    String? locale = await Devicelocale.currentLocale;
    locale = locale?.split(RegExp(r'[-_]')).first;
    if (currentLocale != locale) {
      Stuff.local = locale!;
      Provider.of<AppState>(context, listen: false)
          .changeLanguage(Locale(locale));
    }
  } catch (e) {
    currentLocale = 'en';
  }
  final stuffProvider = Provider.of<StuffProvider>(context, listen: false);
  if (stuffProvider.stuff == null) {
    String jsonTextCasque =
        await rootBundle.loadString('database/mhrs/armor/helmet.json');
    List<dynamic> jsonResponseCasque = json.decode(jsonTextCasque);
    String jsonTextPlastron =
        await rootBundle.loadString('database/mhrs/armor/chest.json');
    List<dynamic> jsonResponsePlastron = json.decode(jsonTextPlastron);
    String jsonTextBras =
        await rootBundle.loadString('database/mhrs/armor/arm.json');
    List<dynamic> jsonResponseBras = json.decode(jsonTextBras);
    String jsonTextCeinture =
        await rootBundle.loadString('database/mhrs/armor/waist.json');
    List<dynamic> jsonResponseCeinture = json.decode(jsonTextCeinture);
    String jsonTextJambiere =
        await rootBundle.loadString('database/mhrs/armor/legs.json');
    List<dynamic> jsonResponseJambiere = json.decode(jsonTextJambiere);
    String jsonTextPetalas =
        await rootBundle.loadString('database/mhrs/armor/petalas.json');
    List<dynamic> jsonResponsePetalas = json.decode(jsonTextPetalas);
    String jsonTextGS =
        await rootBundle.loadString('database/mhrs/weapon/gs.json');
    List<dynamic> jsonResponseGS = json.decode(jsonTextGS);
    String jsonTextCalamJowel =
        await rootBundle.loadString('database/mhrs/calamityJowel.json');
    List<dynamic> jsonResponseCalamJowel = json.decode(jsonTextCalamJowel);
    String skillJsonText =
        await rootBundle.loadString('database/mhrs/skill.json');
    List<dynamic> skillList = json.decode(skillJsonText);
    Casque helmet = jsonResponseCasque
        .map((casque) => Casque.fromJson(casque, skillList, Stuff.local))
        .toList()[0];
    Plastron chest = jsonResponsePlastron
        .map((plastron) => Plastron.fromJson(plastron, skillList, Stuff.local))
        .toList()[0];
    Bras gant = jsonResponseBras
        .map((bras) => Bras.fromJson(bras, skillList, Stuff.local))
        .toList()[0];
    Ceinture boucle = jsonResponseCeinture
        .map((ceinture) => Ceinture.fromJson(ceinture, skillList, Stuff.local))
        .toList()[0];
    Jambiere leg = jsonResponseJambiere
        .map((jambiere) => Jambiere.fromJson(jambiere, skillList, Stuff.local))
        .toList()[0];
    Florelet p = jsonResponsePetalas
        .map((petalas) => Florelet.fromJson(petalas, Stuff.local))
        .toList()[0];
    Arme weapon = jsonResponseGS
        .map((weapon) => GrandeEpee.fromJson(weapon, skillList, Stuff.local))
        .toList()[0];
    JoyauxCalam jc = jsonResponseCalamJowel
        .map((calam) => JoyauxCalam.fromJson(calam, Stuff.local))
        .toList()[0];
    Stuff s = Stuff(helmet, chest, gant, boucle, leg, Talisman.getBase(),
        weapon, jc, p, Kinsect.getBase());
    Stuff.lSkill =
        skillList.map((skill) => Talent.getJson(skill, Stuff.local)).toList();
    s.getListTalents();
    stuffProvider.setStuff(s);
  }
}
