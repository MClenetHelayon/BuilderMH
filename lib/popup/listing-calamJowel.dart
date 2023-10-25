import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../manager/imgManager.dart';
import '../object/JoyauCalam.dart';
import '../object/Stuff.dart';

class ListViewScreen extends StatefulWidget {
  final int slot;
  final String categ;
  const ListViewScreen(
    this.slot,
    this.categ, {
    Key? key,
  }) : super(key: key);

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<JoyauxCalam> lcalamJowel = [];
  bool showSlot3 = true;
  bool showSlot2 = true;
  bool showSlot1 = true;

  @override
  void initState() {
    super.initState();
    loadCalamJowel();
  }

  Future<String> loadCalamJowelData() async {
    return await rootBundle.loadString('database/mhrs/calamityJowel.json');
  }

  Future<void> loadCalamJowel() async {
    String jsonText = await loadCalamJowelData();
    List<dynamic> jsonResponse = json.decode(jsonText);
    setState(() {
      lcalamJowel = jsonResponse
          .map((calamJowel) => JoyauxCalam.fromJson(calamJowel, Stuff.local))
          .toList();
    });
  }

  List<JoyauxCalam> getFilteredCalamJowels() {
    List<JoyauxCalam> filteredCalamJowel = [];
    if (lcalamJowel.isNotEmpty) {
      filteredCalamJowel.add(lcalamJowel[0]);
    }
    if (showSlot3 && widget.slot == 3) {
      filteredCalamJowel.addAll(
          lcalamJowel.where((calamJowel) => calamJowel.slot == 3).toList());
    }
    if (showSlot2 && widget.slot >= 2) {
      filteredCalamJowel.addAll(
          lcalamJowel.where((calamJowel) => calamJowel.slot == 2).toList());
    }
    if (showSlot1 && widget.slot >= 1) {
      filteredCalamJowel.addAll(
          lcalamJowel.where((calamJowel) => calamJowel.slot == 1).toList());
    }
    if (widget.categ != "GS" && widget.categ != "CB") {
      filteredCalamJowel.removeWhere((calamJowel) => calamJowel.id == 3);
      filteredCalamJowel.removeWhere((calamJowel) => calamJowel.id == 4);
    }
    if (widget.categ != "DB") {
      filteredCalamJowel.removeWhere((calamJowel) => calamJowel.id == 5);
      filteredCalamJowel.removeWhere((calamJowel) => calamJowel.id == 31);
    }
    if (widget.categ != "MRTO") {
      filteredCalamJowel.removeWhere((calamJowel) => calamJowel.id == 30);
    }
    if (widget.categ != "HH") {
      filteredCalamJowel.removeWhere((calamJowel) => calamJowel.id == 6);
    }
    if (widget.categ != "LNC") {
      filteredCalamJowel.removeWhere((calamJowel) => calamJowel.id == 33);
    }
    if (widget.categ != "SA") {
      filteredCalamJowel.removeWhere((calamJowel) => calamJowel.id == 7);
    }
    if (widget.categ != "IG") {
      filteredCalamJowel.removeWhere((calamJowel) => calamJowel.id == 32);
    }
    if (widget.categ != "ARC") {
      filteredCalamJowel.removeWhere((calamJowel) => calamJowel.id == 8);
    }
    if (widget.categ != "LBG" &&
        widget.categ != "HBG" &&
        widget.categ != "GL") {
      filteredCalamJowel.removeWhere((calamJowel) => calamJowel.id == 9);
    }
    return filteredCalamJowel;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(5),
            child: Column(
              children: [
                if (widget.slot == 3)
                  CheckboxListTile(
                    title: Text('${AppLocalizations.of(context)!.slot} 3'),
                    value: showSlot3,
                    onChanged: (checked) {
                      setState(() {
                        showSlot3 = checked ?? false;
                      });
                    },
                  ),
                if (widget.slot >= 2)
                  CheckboxListTile(
                    title: Text('${AppLocalizations.of(context)!.slot} 2'),
                    value: showSlot2,
                    onChanged: (checked) {
                      setState(() {
                        showSlot2 = checked ?? false;
                      });
                    },
                  ),
                if (widget.slot >= 1)
                  CheckboxListTile(
                    title: Text('${AppLocalizations.of(context)!.slot} 1'),
                    value: showSlot1,
                    onChanged: (checked) {
                      setState(() {
                        showSlot1 = checked ?? false;
                      });
                    },
                  ),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: getFilteredCalamJowels().length,
                  itemBuilder: (context, index) {
                    JoyauxCalam calamJowel = getFilteredCalamJowels()[index];
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
                            Navigator.of(context).pop(calamJowel);
                          },
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(calamJowel.name),
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
                              Navigator.of(context).pop(calamJowel);
                            },
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      "${AppLocalizations.of(context)!.joyau} ${calamJowel.name}"),
                                ],
                              ),
                              leading: Container(
                                height: 22,
                                width: 22,
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color:
                                        const Color.fromARGB(134, 96, 96, 96),
                                    boxShadow: const [
                                      BoxShadow(
                                          color:
                                              Color.fromARGB(255, 97, 97, 97),
                                          spreadRadius: 3,
                                          blurRadius: 2),
                                    ],
                                    image: DecorationImage(
                                      image: AssetImage(
                                          slotCalam(calamJowel.slot)),
                                    )),
                              ),
                              subtitle: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${AppLocalizations.of(context)!.talent} : ${calamJowel.talentName}",
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
}
