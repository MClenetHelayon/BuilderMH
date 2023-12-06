// ignore_for_file: library_prefixes

import 'package:builder_mhrs/manager/color/colorManager.dart';
import 'package:builder_mhrs/object/armor/Florelet.dart';
import 'package:builder_mhrs/object/Joyau.dart';
import 'package:builder_mhrs/object/JoyauCalam.dart';
import 'package:builder_mhrs/object/Kinsect.dart';
import 'package:builder_mhrs/object/Stuff.dart';
import 'package:builder_mhrs/object/Transcendance.dart';
import 'package:builder_mhrs/object/armor/Armure.dart';
import 'package:builder_mhrs/object/armor/Talisman.dart';
import 'package:builder_mhrs/object/weapon/Arme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:builder_mhrs/pages/popup/listing-casque.dart' as ListCasque;
import 'package:builder_mhrs/pages/popup/listing-bras.dart' as ListBras;
import 'package:builder_mhrs/pages/popup/listing-plastron.dart' as ListPlastron;
import 'package:builder_mhrs/pages/popup/listing-jambiere.dart' as ListJambiere;
import 'package:builder_mhrs/pages/popup/listing-ceinture.dart' as ListCeinture;
import 'package:builder_mhrs/pages/popup/listing-petalas.dart' as ListPetalas;
import 'package:builder_mhrs/pages/popup/listing-jowel.dart' as ListJoyaux;
import 'package:builder_mhrs/pages/popup/listing-calamJowel.dart'
    as ListJoyauxCalam;
import 'package:builder_mhrs/pages/popup/listing-arme.dart' as ListArme;
import 'package:builder_mhrs/pages/popup/listing-charm.dart' as ListCharm;
import 'package:builder_mhrs/pages/popup/listing-kinsect.dart' as ListKinsect;
import 'package:builder_mhrs/pages/popup/listing-augment.dart' as ListAugment;

void close(context) {
  Navigator.of(context).pop();
}

Future<Kinsect?> kinsect(BuildContext context, int level) {
  return showDialog<Kinsect>(
      context: context,
      builder: (context) {
        return somePopup(context, AppLocalizations.of(context)!.insect,
            ListKinsect.ListViewScreen(level));
      });
}

Future<JoyauxCalam?> calamJoyau(BuildContext context, int slot, String categ) {
  return showDialog<JoyauxCalam>(
      context: context,
      builder: (context) {
        return somePopup(context, AppLocalizations.of(context)!.calamJowel,
            ListJoyauxCalam.ListViewScreen(slot, categ));
      });
}

Future<Joyaux?> joyau(BuildContext context, int slot) {
  return showDialog<Joyaux>(
      context: context,
      builder: (context) {
        return somePopup(context, AppLocalizations.of(context)!.joyau,
            ListJoyaux.ListViewScreen(slot));
      });
}

Future<Armure?> armor(BuildContext context, int i) {
  var value;
  String title = "";
  switch (i) {
    case 0:
      title = AppLocalizations.of(context)!.helmet;
      value = const ListCasque.ListViewScreen();
    case 1:
      title = AppLocalizations.of(context)!.chest;
      value = const ListPlastron.ListViewScreen();
    case 2:
      title = AppLocalizations.of(context)!.gloves;
      value = const ListBras.ListViewScreen();
    case 3:
      title = AppLocalizations.of(context)!.waist;
      value = const ListCeinture.ListViewScreen();
    case 4:
      title = AppLocalizations.of(context)!.legs;
      value = const ListJambiere.ListViewScreen();
  }
  return showDialog<Armure>(
      context: context,
      builder: (context) {
        return somePopup(context, title, value);
      });
}

Future<Arme?> arme(BuildContext context, Stuff s) {
  return showDialog<Arme>(
      context: context,
      builder: (context) {
        return somePopup(context, AppLocalizations.of(context)!.arme,
            ListArme.ListViewScreen(s, context));
      });
}

Future<Florelet?> flor(BuildContext context) {
  return showDialog<Florelet>(
      context: context,
      builder: (context) {
        return somePopup(context, AppLocalizations.of(context)!.petalas,
            const ListPetalas.ListViewScreen());
      });
}

Future<Talisman?> charm(BuildContext context, Stuff s) {
  return showDialog<Talisman>(
      context: context,
      builder: (context) {
        return somePopup(context, AppLocalizations.of(context)!.tali,
            ListCharm.ListViewScreen(s.charm));
      });
}

Future<List<Transcendance>?> transcendance(BuildContext context, Arme w) {
  return showDialog<List<Transcendance>>(
      context: context,
      builder: (context) {
        return somePopup(context, AppLocalizations.of(context)!.trans,
            ListAugment.ListViewScreen(w));
      });
}

Widget somePopup(BuildContext context, String txt, Widget popup) {
  return AlertDialog(
      insetPadding: const EdgeInsets.all(10),
      contentPadding: const EdgeInsets.only(left: 10, right: 10),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      title: Row(children: [
        Text(txt,
            style: const TextStyle(fontWeight: FontWeight.bold, color: fourth)),
        const Spacer(),
        CloseButton(color: fifth, onPressed: () => close(context))
      ]),
      backgroundColor: primary,
      content: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: popup));
}
