import 'dart:async';
import 'dart:convert';
import 'package:builder_mhrs/object/Talent.dart';
import 'package:builder_mhrs/object/Talisman.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';

import '../../object/Stuff.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  int talentIndex1 = 0,
      talentLevel1 = 0,
      talentIndex2 = 0,
      talentLevel2 = 0,
      slot1 = 0,
      slot2 = 0,
      slot3 = 0;
  bool talent2Active = false, slot1Active = false, slot2Active = false;
  List<Talent> lskill = [];

  @override
  void initState() {
    super.initState();
    loadSkill();
  }

  Future<String> loadSkillData() async {
    return await rootBundle.loadString('database/mhrs/skill.json');
  }

  Future<void> loadSkill() async {
    String skillJsonText = await loadSkillData();
    List<dynamic> skillList = json.decode(skillJsonText);
    setState(() {
      lskill.add(Talent.getBase());
      for (Map<String, dynamic> skill in skillList) {
        if (Talent.getJson(skill,Stuff.local).talisman) {
          lskill.add(Talent.getJson(skill,Stuff.local));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.black,
        child: Column(
          children: [
            Card(
              color: const Color.fromARGB(255, 218, 218, 218),
              child: Column(children: [
                Text("Talent 1"),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (lskill.length > 0) TalentDropdown1(),
                      if (lskill.length > 0) LevelDropdown1(),
                    ])
              ]),
            ),
            if (talent2Active)
              Card(
                color: const Color.fromARGB(255, 218, 218, 218),
                child: Column(children: [
                  Text("Talent 2"),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if (lskill.length > 0) TalentDropdown2(),
                        if (lskill.length > 0) LevelDropdown2(),
                      ])
                ]),
              ),
            Card(
              color: const Color.fromARGB(255, 218, 218, 218),
              child: Column(children: [
                Text("Emplacements"),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SlotDropdown1(),
                      if (slot1Active) SlotDropdown2(),
                      if (slot1Active && slot2Active) SlotDropdown3(),
                    ])
              ]),
            ),
            TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 255, 255, 255)),
                ),
                onPressed: () {
                  Talent t1 = Talent.getBase();
                  Talent t2 = Talent.getBase();
                  List<Talent> list = [];
                  if (talentIndex1 != 0) {
                    t1 = Talent(
                        name: lskill[talentIndex1].name,
                        id: lskill[talentIndex1].id,
                        level: talentLevel1,
                        levelMax: lskill[talentIndex1].levelMax,
                        talisman: true);
                    list.add(t1);
                  }
                  if (talent2Active) {
                    if (talentIndex2 != 0) {
                      t2 = Talent(
                          name: lskill[talentIndex2].name,
                          id: lskill[talentIndex2].id,
                          level: talentLevel2,
                          levelMax: lskill[talentIndex2].levelMax,
                          talisman: true);
                      list.add(t2);
                    }
                  }
                  Talisman t = Talisman(list, [slot1, slot2, slot3]);
                  Navigator.of(context).pop(t);
                },
                child: Text("Valider"))
          ],
        ));
  }

  Widget TalentDropdown1() {
    return Container(
        margin: const EdgeInsets.all(5.0),
        child: DropdownButton<int>(
            value: talentIndex1,
            onChanged: (newValue) {
              setState(() {
                talentIndex1 = newValue!;
                if (talentIndex1 != 0) {
                  talentLevel1 = lskill[(talentIndex1)].levelMax;
                  talent2Active = true;
                } else {
                  talentLevel1 = 0;
                  talent2Active = false;
                }
              });
            },
            items: getDropdownItems1()));
  }

  Widget LevelDropdown1() {
    return Container(
        margin: const EdgeInsets.all(5.0),
        child: DropdownButton<int>(
          value: talentLevel1,
          onChanged: (newValue) {
            setState(() {
              talentLevel1 = newValue!;
            });
          },
          items: getDropdownLevel1(),
        ));
  }

  Widget TalentDropdown2() {
    return Container(
        margin: const EdgeInsets.all(5.0),
        child: DropdownButton<int>(
            value: talentIndex2,
            onChanged: (newValue) {
              setState(() {
                talentIndex2 = newValue!;
                if (talentIndex2 != -1) {
                  talentLevel2 = lskill[(talentIndex2)].levelMax;
                } else {
                  talentLevel2 = 0;
                }
              });
            },
            items: getDropdownItems2()));
  }

  Widget LevelDropdown2() {
    return Container(
        margin: const EdgeInsets.all(5.0),
        child: DropdownButton<int>(
          value: talentLevel2,
          onChanged: (newValue) {
            setState(() {
              talentLevel2 = newValue!;
            });
          },
          items: getDropdownLevel2(),
        ));
  }

  Widget SlotDropdown1() {
    return Container(
        margin: const EdgeInsets.all(5.0),
        child: DropdownButton<int>(
          value: slot1,
          onChanged: (newValue) {
            setState(() {
              slot1 = newValue!;
              if (slot1 != 0) {
                slot1Active = true;
              } else {
                slot1Active = false;
                slot2 = 0;
                slot3 = 0;
              }
            });
          },
          items: getDropdownSlot1(),
        ));
  }

  Widget SlotDropdown2() {
    return Container(
        margin: const EdgeInsets.all(5.0),
        child: DropdownButton<int>(
          value: slot2,
          onChanged: (newValue) {
            setState(() {
              slot2 = newValue!;
              if (slot2 != 0) {
                slot2Active = true;
              } else {
                slot2Active = false;
                slot3 = 0;
              }
            });
          },
          items: getDropdownSlot2(),
        ));
  }

  Widget SlotDropdown3() {
    return Container(
        margin: const EdgeInsets.all(5.0),
        child: DropdownButton<int>(
          value: slot3,
          onChanged: (newValue) {
            setState(() {
              slot3 = newValue!;
            });
          },
          items: getDropdownSlot3(),
        ));
  }

  List<DropdownMenuItem<int>> getDropdownItems1() {
    List<DropdownMenuItem<int>> items = [];
    for (int i = 0; i <= (lskill.length - 1); i++) {
      items.add(DropdownMenuItem(
        value: i,
        child: Text(lskill[i].name),
      ));
    }
    return items;
  }

  List<DropdownMenuItem<int>> getDropdownItems2() {
    List<DropdownMenuItem<int>> items = [];
    for (int i = 0; i <= (lskill.length - 1); i++) {
      if (lskill[i].id != talentIndex1 || lskill[i].id == -1) {
        items.add(DropdownMenuItem(
          value: i,
          child: Text(lskill[i].name),
        ));
      }
    }
    return items;
  }

  List<DropdownMenuItem<int>> getDropdownLevel1() {
    List<DropdownMenuItem<int>> items = [];
    if (talentIndex1 != -1) {
      for (int i = 1; i <= talentLevel1; i++) {
        items.add(DropdownMenuItem(
          value: i,
          child: Text('$i'),
        ));
      }
    } else {
      items.add(DropdownMenuItem(
        value: 0,
        child: Text('0'),
      ));
    }

    return items;
  }

  List<DropdownMenuItem<int>> getDropdownLevel2() {
    List<DropdownMenuItem<int>> items = [];
    if (talentIndex2 != -1) {
      for (int i = 1; i <= talentLevel2; i++) {
        items.add(DropdownMenuItem(
          value: i,
          child: Text('$i'),
        ));
      }
    } else {
      items.add(DropdownMenuItem(
        value: 0,
        child: Text('0'),
      ));
    }

    return items;
  }

  List<DropdownMenuItem<int>> getDropdownSlot1() {
    List<DropdownMenuItem<int>> items = [];
    int j = 4;
    for (int i = 0; i <= j; i++) {
      items.add(DropdownMenuItem(
        value: i,
        child: Text('$i'),
      ));
    }
    return items;
  }

  List<DropdownMenuItem<int>> getDropdownSlot2() {
    List<DropdownMenuItem<int>> items = [];
    int j = 4;
    if (slot1 != 0) {
      j = slot1;
    }
    for (int i = 0; i <= j; i++) {
      items.add(DropdownMenuItem(
        value: i,
        child: Text('$i'),
      ));
    }
    return items;
  }

  List<DropdownMenuItem<int>> getDropdownSlot3() {
    List<DropdownMenuItem<int>> items = [];
    int j = 4;
    if (slot2 != 0) {
      j = slot2;
    }
    for (int i = 0; i <= j; i++) {
      items.add(DropdownMenuItem(
        value: i,
        child: Text('$i'),
      ));
    }
    return items;
  }
}
