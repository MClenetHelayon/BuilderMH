import 'dart:convert';
import 'package:builder_mhrs/object/Stuff.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';

import '../../object/Florelet.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<Florelet> lpetalas = [];

  @override
  void initState() {
    super.initState();
    loadPetalas();
  }

  Future<String> loadPetalasData() async {
    return await rootBundle.loadString('database/mhrs/armor/petalas.json');
  }

  Future<void> loadPetalas() async {
    String jsonText = await loadPetalasData();
    List<dynamic> jsonResponse = json.decode(jsonText);

    setState(() {
      for (Map<String, dynamic> petalas in jsonResponse) {
        Florelet f = Florelet.fromJson(petalas,Stuff.local);
        lpetalas.add(f);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: Expanded(
          child: ListView.builder(
              itemCount: lpetalas.length,
              itemBuilder: (context, index) {
                Florelet petalas = lpetalas[index];
                return Card(
                    margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 255, 255, 255)),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(petalas);
                      },
                      child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                petalas.name,
                              ),
                            ],
                          ),
                          subtitle: Column(children: [
                            Container(
                                margin: const EdgeInsets.only(bottom: 10.0),
                                child: const Text("Boost Général")),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 10.0),
                                    child: statDef("images/elementaire/Vie.png",
                                        petalas.uVie),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10.0),
                                    child: statDef(
                                        "images/elementaire/Stam.png",
                                        petalas.uStam),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10.0),
                                    child: statDef(
                                        "images/elementaire/Attaque.webp",
                                        petalas.uAtt),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10.0),
                                    child: statDef(
                                        "images/elementaire/Defense.png",
                                        petalas.uDef),
                                  ),
                                ]),
                            Container(
                                margin: const EdgeInsets.only(
                                    bottom: 10.0, top: 10.0),
                                child: const Text("Boost par Spectroiseau")),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 10.0),
                                    child: statDef("images/elementaire/Vie.png",
                                        petalas.gVie),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10.0),
                                    child: statDef(
                                        "images/elementaire/Stam.png",
                                        petalas.gStam),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10.0),
                                    child: statDef(
                                        "images/elementaire/Attaque.webp",
                                        petalas.gAtt),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10.0),
                                    child: statDef(
                                        "images/elementaire/Defense.png",
                                        petalas.gDef),
                                  ),
                                ])
                          ])),
                    ));
              })),
    );
  }

  Widget statDef(String image, int value) {
    return Row(
      children: [
        Image.asset(image, height: 16, width: 16),
        const SizedBox(width: 5),
        Text(value.toString()),
      ],
    );
  }
}
