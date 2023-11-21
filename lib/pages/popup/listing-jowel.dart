import 'dart:async';
import 'dart:convert';
import 'package:builder_mhrs/object/Joyau.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';

import '../../object/Stuff.dart';

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
  bool show4 = true;
  bool show3 = true;
  bool show2 = true;
  bool show1 = true;

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
          .map((jowel) => Joyaux.fromJson(jowel, skillList,Stuff.local))
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
    }
    if (show3 && slot >= 3) {
      filteredJowel.addAll(ljowel.where((jowel) => jowel.slot == 3).toList());
    }
    if (show2 && slot >= 2) {
      filteredJowel.addAll(ljowel.where((jowel) => jowel.slot == 2).toList());
    }
    if (show1 && slot >= 1) {
      filteredJowel.addAll(ljowel.where((jowel) => jowel.slot == 1).toList());
    }
    return filteredJowel;
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
                if (widget.slot == 4)
                  CheckboxListTile(
                    title: const Text('Emplacement 4'),
                    value: show4,
                    onChanged: (checked) {
                      setState(() {
                        show4 = checked ?? false;
                      });
                    },
                  ),
                if (widget.slot >= 3)
                  CheckboxListTile(
                    title: const Text('Emplacement 3'),
                    value: show3,
                    onChanged: (checked) {
                      setState(() {
                        show3 = checked ?? false;
                      });
                    },
                  ),
                if (widget.slot >= 2)
                  CheckboxListTile(
                    title: const Text('Emplacement 2'),
                    value: show2,
                    onChanged: (checked) {
                      setState(() {
                        show2 = checked ?? false;
                      });
                    },
                  ),
                if (widget.slot >= 1)
                  CheckboxListTile(
                    title: const Text('Emplacement 1'),
                    value: show1,
                    onChanged: (checked) {
                      setState(() {
                        show1 = checked ?? false;
                      });
                    },
                  )
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: getFilteredJowel(widget.slot).length,
                  itemBuilder: (context, index) {
                    Joyaux jowel = getFilteredJowel(widget.slot)[index];
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
                            Navigator.of(context).pop(jowel);
                          },
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  jowel.name,
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
                              Navigator.of(context).pop(jowel);
                            },
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    jowel.name,
                                  ),
                                ],
                              ),
                              leading: Container(
                                height: 22,
                                width: 22,
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: const Color.fromARGB(135, 42, 42, 42),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color.fromARGB(255, 97, 97, 97), spreadRadius: 3, blurRadius: 2),
                                    ],
                                    image: DecorationImage(
                                      image: imgSlot(jowel.slot),
                                    )),
                              ),
                              subtitle: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(children: [
                                        const Text("Talent"),
                                        Text(
                                            '${jowel.nameSkill} +${jowel.level}'),
                                      ])
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
        img = "images/joyau/j1.png";
        break;
      case 2:
        img = "images/joyau/j2.png";
        break;
      case 3:
        img = "images/joyau/j3.png";
        break;
      case 4:
        img = "images/joyau/j4.png";
        break;
    }
    return AssetImage(img);
  }
}
