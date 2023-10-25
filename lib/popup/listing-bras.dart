import 'dart:async';
import 'dart:convert';
import 'package:builder_mhrs/object/Armure.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';

import '../object/Stuff.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<Bras> lvambrace = [];
  bool showNoviceVambraces = true;
  bool showExpertVambraces = true;
  bool showMaitreVambraces = true;

  @override
  void initState() {
    super.initState();
    loadVambrace();
  }

  Future<String> loadVambraceData() async {
    return await rootBundle.loadString('database/mhrs/armor/arm.json');
  }

  Future<String> loadSkillData() async {
    return await rootBundle.loadString('database/mhrs/skill.json');
  }

  Future<void> loadVambrace() async {
    String jsonText = await loadVambraceData();
    List<dynamic> jsonResponse = json.decode(jsonText);
    String skillJsonText = await loadSkillData();
    List<dynamic> skillList = json.decode(skillJsonText);
    setState(() {
      lvambrace = jsonResponse
          .map((vambrace) => Bras.fromJson(vambrace, skillList, Stuff.local))
          .toList();
    });
  }

  List<Bras> getFilteredVambraces() {
    List<Bras> filteredVambraces = [];

    if (showExpertVambraces) {
      filteredVambraces.addAll(lvambrace
          .where((vambrace) => vambrace.categorie == 'expert')
          .toList());
    }
    if (showMaitreVambraces) {
      filteredVambraces.addAll(lvambrace
          .where((vambrace) => vambrace.categorie == 'maitre')
          .toList());
    }
    return filteredVambraces;
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
                CheckboxListTile(
                  title: const Text('Novices'),
                  value: showNoviceVambraces,
                  onChanged: (checked) {
                    setState(() {
                      showNoviceVambraces = checked ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Experts'),
                  value: showExpertVambraces,
                  onChanged: (checked) {
                    setState(() {
                      showExpertVambraces = checked ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Maîtres'),
                  value: showMaitreVambraces,
                  onChanged: (checked) {
                    setState(() {
                      showMaitreVambraces = checked ?? false;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: getFilteredVambraces().length,
                  itemBuilder: (context, index) {
                    Bras vambrace = getFilteredVambraces()[index];
                    return Card(
                        margin:
                            const EdgeInsets.only(top: 5, left: 10, right: 10),
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 255, 255, 255)),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop(vambrace);
                          },
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  vambrace.name,
                                ),
                              ],
                            ),
                            leading: Text('R${vambrace.rarete}'),
                            subtitle: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(children: [
                                      const Text("Joyau"),
                                      getFilteredVambraces()[index]
                                              .slots
                                              .isEmpty
                                          ? const Text('- / - / -')
                                          : Row(
                                              children: [
                                                for (int i = 0; i < 3; i++)
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 8),
                                                    child: Text(
                                                        getFilteredVambraces()[
                                                                        index]
                                                                    .slots
                                                                    .length >
                                                                i
                                                            ? '${getFilteredVambraces()[index].slots[i].toString()} /'
                                                            : i != 2
                                                                ? '- /'
                                                                : '-'),
                                                  ),
                                              ],
                                            ),
                                    ]),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(children: [
                                      const Text("Talent"),
                                      for (int i = 0; i < 4; i++)
                                        if (vambrace.talents.length > i)
                                          Text(
                                              '${vambrace.talents[i].name} + ${vambrace.talents[i].level}'),
                                    ])
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ));
                  }))
        ],
      ),
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
