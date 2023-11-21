import 'dart:async';
import 'dart:convert';

import 'package:builder_mhrs/object/Kinsect.dart';
import 'package:builder_mhrs/object/Stuff.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  final int level;
  const ListViewScreen(
    this.level, {
    Key? key,
  }) : super(key: key);

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<Kinsect> lkinsect = [];

  @override
  void initState() {
    super.initState();
    loadKinsectJowel();
  }

  Future<String> loadKinsectData() async {
    return await rootBundle.loadString('database/mhrs/weapon/kinsect.json');
  }

  Future<void> loadKinsectJowel() async {
    String jsonText = await loadKinsectData();
    List<dynamic> jsonResponse = json.decode(jsonText);
    setState(() {
      lkinsect.add(Kinsect.getBase());
      lkinsect += jsonResponse
          .map((kinsect) => Kinsect.fromJson(kinsect, Stuff.local))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: lkinsect.length,
                  itemBuilder: (context, index) {
                    Kinsect kinsect = lkinsect[index];
                    if (index == 0) {
                      return Card(
                        margin:
                            const EdgeInsets.only(top: 5, left: 10, right: 10),
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 255, 255, 255)),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop(kinsect);
                          },
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  kinsect.name,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Card(
                          margin: const EdgeInsets.only(
                              top: 5, left: 10, right: 10),
                          child: TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color.fromARGB(255, 255, 255, 255)),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop(kinsect);
                            },
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    kinsect.name,
                                  ),
                                ],
                              ),
                              subtitle: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Attaque : ${kinsect.niveauKinsect[widget.level][0]}",
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Vitesse : ${kinsect.niveauKinsect[widget.level][1]}",
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Guérison : ${kinsect.niveauKinsect[widget.level][2]}",
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ));
                    }
                  }))
        ],
      ),
    );
  }

  AssetImage imgSlot(int slot) {
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
    return AssetImage(img);
  }
}
