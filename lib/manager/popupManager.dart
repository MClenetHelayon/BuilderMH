import 'package:flutter/material.dart';
import '../popup/listing-casque.dart' as ListCasque;
import '../popup/listing-bras.dart' as ListBras;
import '../popup/listing-plastron.dart' as ListPlastron;
import '../popup/listing-jambiere.dart' as ListJambiere;
import '../popup/listing-ceinture.dart' as ListCeinture;
import '../popup/listing-petalas.dart' as ListPetalas;
import '../popup/listing-jowel.dart' as ListJoyaux;
import '../popup/listing-calamJowel.dart' as ListJoyauxCalam;
import '../popup/listing-arme.dart' as ListArme;
import '../popup/listing-charm.dart' as ListCharm;
import '../popup/listing-kinsect.dart' as ListKinsect;
import '../object/weapon/Arme.dart';
import '../object/Armure.dart';
import '../object/Florelet.dart';
import '../object/Joyau.dart';
import '../object/JoyauCalam.dart';
import '../object/Kinsect.dart';
import '../object/Stuff.dart';
import '../object/Talisman.dart';

void close(context) {
  Navigator.of(context).pop();
}

Future<Kinsect?> kinsect(BuildContext context, int level) {
  return showDialog<Kinsect>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(children: [
            const Text("Kinsect"),
            const Spacer(),
            CloseButton(
                color: Colors.red,
                onPressed: () {
                  close(context);
                })
          ]),
          backgroundColor: const Color.fromARGB(255, 170, 170, 170),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height,
            child: ListKinsect.ListViewScreen(level),
          ),
        );
      });
}

Future<JoyauxCalam?> calamJoyau(BuildContext context, int slot, String categ) {
  return showDialog<JoyauxCalam>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(children: [
            const Text("Joyau Calamité"),
            const Spacer(),
            CloseButton(
                color: Colors.red,
                onPressed: () {
                  close(context);
                })
          ]),
          backgroundColor: const Color.fromARGB(255, 170, 170, 170),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height,
            child: ListJoyauxCalam.ListViewScreen(slot, categ),
          ),
        );
      });
}

Future<Joyaux?> joyau(BuildContext context, int slot) {
  return showDialog<Joyaux>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(children: [
            const Text("Joyau"),
            const Spacer(),
            CloseButton(
                color: Colors.red,
                onPressed: () {
                  close(context);
                })
          ]),
          backgroundColor: const Color.fromARGB(255, 170, 170, 170),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height,
            child: ListJoyaux.ListViewScreen(slot),
          ),
        );
      });
}

Future<Armure?> armor(BuildContext context, int i) {
  var value;
  switch (i) {
    case 0:
      value = const ListCasque.ListViewScreen();
    case 1:
      value = const ListPlastron.ListViewScreen();
    case 2:
      value = const ListBras.ListViewScreen();
    case 3:
      value = const ListCeinture.ListViewScreen();
    case 4:
      value = const ListJambiere.ListViewScreen();
  }
  return showDialog<Armure>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              const Text("Casque"),
              const Spacer(),
              CloseButton(
                color: Colors.red,
                onPressed: () {
                  close(context);
                },
              ),
            ],
          ),
          backgroundColor: const Color.fromARGB(255, 170, 170, 170),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height,
            child: value,
          ),
        );
      });
}

Future<Arme?> arme(BuildContext context, Stuff s) {
  return showDialog<Arme>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              const Text("Arme"),
              const Spacer(),
              CloseButton(
                color: Colors.red,
                onPressed: () {
                  close(context);
                },
              ),
            ],
          ),
          backgroundColor: const Color.fromARGB(255, 170, 170, 170),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height,
            child: ListArme.ListViewScreen(s,context),
          ),
        );
      });
}

Future<Florelet?> flor(BuildContext context) {
  return showDialog<Florelet>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              const Text("Florelet"),
              const Spacer(),
              CloseButton(
                color: Colors.red,
                onPressed: () {
                  close(context);
                },
              ),
            ],
          ),
          backgroundColor: const Color.fromARGB(255, 170, 170, 170),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height,
            child: const ListPetalas.ListViewScreen(),
          ),
        );
      });
}

Future<Talisman?> charm(BuildContext context) {
  return showDialog<Talisman>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              const Text("Talisman"),
              const Spacer(),
              CloseButton(
                color: Colors.red,
                onPressed: () {
                  close(context);
                },
              ),
            ],
          ),
          backgroundColor: const Color.fromARGB(255, 170, 170, 170),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height,
            child: const ListCharm.ListViewScreen(),
          ),
        );
      });
}
