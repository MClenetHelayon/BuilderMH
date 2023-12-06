import 'dart:async';
import 'dart:convert';
import 'package:builder_mhrs/controller/color/colorManager.dart';
import 'package:builder_mhrs/model/Kinsect.dart';
import 'package:builder_mhrs/model/Stuff.dart';
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

  Future<void> loadKinsectJowel() async {
    String jsonText =
        await rootBundle.loadString('database/mhrs/weapon/kinsect.json');
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
        color: secondary,
        child: Column(children: [
          Expanded(
              child: ListView.builder(
                  itemCount: lkinsect.length,
                  itemBuilder: (context, index) {
                    Kinsect kinsect = lkinsect[index];
                    if (index == 0) {
                      return Card(
                          margin: const EdgeInsets.only(
                              top: 5, left: 10, right: 10),
                          child: TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(fourth),
                              ),
                              onPressed: () =>
                                  Navigator.of(context).pop(kinsect),
                              child: ListTile(
                                  title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [Text(kinsect.name)]))));
                    } else {
                      return Card(
                          margin: const EdgeInsets.only(
                              top: 5, left: 10, right: 10),
                          child: TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(fourth),
                              ),
                              onPressed: () =>
                                  Navigator.of(context).pop(kinsect),
                              child: ListTile(
                                  title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [Text(kinsect.name)]),
                                  subtitle: Column(children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              "Attaque : ${kinsect.niveauKinsect[widget.level][0]}")
                                        ]),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              "Vitesse : ${kinsect.niveauKinsect[widget.level][1]}")
                                        ]),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              "Guérison : ${kinsect.niveauKinsect[widget.level][2]}")
                                        ])
                                  ]))));
                    }
                  }))
        ]));
  }
}
