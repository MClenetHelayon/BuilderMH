import 'dart:async';
import 'dart:convert';
import 'package:builder_mhrs/manager/color/colorManager.dart';
import 'package:builder_mhrs/manager/img/deco.dart';
import 'package:builder_mhrs/manager/img/imgManager.dart';
import 'package:builder_mhrs/manager/widget/filter/getCheckbox.dart';
import 'package:builder_mhrs/object/Joyau.dart';
import 'package:builder_mhrs/object/Stuff.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ListViewScreen extends StatefulWidget {
  final int slot;
  const ListViewScreen(
    this.slot, {
    Key? key,
  }) : super(key: key);

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<Joyaux> ljowel = [];
  bool show4 = false;
  bool show3 = false;
  bool show2 = false;
  bool show1 = false;

  @override
  void initState() {
    super.initState();
    loadJowel();
  }

  Future<String> loadJowelData() async {
    return await rootBundle.loadString('database/mhrs/jowel.json');
  }

  Future<String> loadSkillData() async {
    return await rootBundle.loadString('database/mhrs/skill.json');
  }

  Future<void> loadJowel() async {
    String jsonText = await loadJowelData();
    List<dynamic> jsonResponse = json.decode(jsonText);
    String skillJsonText = await loadSkillData();
    List<dynamic> skillList = json.decode(skillJsonText);
    setState(() {
      ljowel = jsonResponse
          .map((jowel) => Joyaux.fromJson(jowel, skillList, Stuff.local))
          .toList();
    });
  }

  List<Joyaux> getFilteredJowel(int slot) {
    List<Joyaux> filteredJowel = [];
    if (ljowel.isNotEmpty) {
      filteredJowel.add(ljowel[0]);
    }
    if (show4 && slot == 4) {
      filteredJowel.addAll(ljowel.where((jowel) => jowel.slot == 4).toList());
      show4 = true;
    }
    if (show3 && slot >= 3) {
      filteredJowel.addAll(ljowel.where((jowel) => jowel.slot == 3).toList());
      show3 = true;
    }
    if (show2 && slot >= 2) {
      filteredJowel.addAll(ljowel.where((jowel) => jowel.slot == 2).toList());
      show2 = true;
    }
    if (show1 && slot >= 1) {
      filteredJowel.addAll(ljowel.where((jowel) => jowel.slot == 1).toList());
      show1 = true;
    }
    return filteredJowel;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.black,
        child: Column(children: [
          Card(

            color: primary,
              margin: const EdgeInsets.all(5),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                checkboxDeco(slot4, show4, (bool check) {
                  setState(() {
                    show4 = check;
                  });
                }),
                checkboxDeco(slot3, show3, (bool check) {
                  setState(() {
                    show3 = check;
                  });
                }),
                checkboxDeco(slot2, show2, (bool check) {
                  setState(() {
                    show2 = check;
                  });
                }),
                checkboxDeco(slot1, show1, (bool check) {
                  setState(() {
                    show1 = check;
                  });
                })
              ])),
          Expanded(
              child: ListView.builder(
                  itemCount: getFilteredJowel(widget.slot).length,
                  itemBuilder: (context, index) {
                    Joyaux jowel = getFilteredJowel(widget.slot)[index];
                    if (index == 0) {
                      return Card(
                          margin: const EdgeInsets.only(
                              top: 5, left: 10, right: 10),
                          child: TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(fourth),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop(jowel);
                              },
                              child: ListTile(
                                  title: Center(child: Text(jowel.name)))));
                    } else {
                      return Card(
                          margin: const EdgeInsets.only(
                              top: 5, left: 10, right: 10),
                          child: TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(fourth),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop(jowel);
                              },
                              child: ListTile(
                                  title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [Text(jowel.name)]),
                                  leading: Container(
                                      height: 22,
                                      width: 22,
                                      margin: const EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: secondary,
                                          boxShadow: const [
                                            BoxShadow(
                                                color: secondary,
                                                spreadRadius: 3,
                                                blurRadius: 2)
                                          ],
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  slot(jowel.slot))))),
                                  subtitle: Column(children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(children: [
                                             Text(AppLocalizations.of(context)!.talent),
                                            Text(
                                                '${jowel.nameSkill} +${jowel.level}')
                                          ])
                                        ])
                                  ]))));
                    }
                  }))
        ]));
  }
}
