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
  List<Ceinture> lbelt = [];
  bool showNoviceBelts = true;
  bool showExpertBelts = true;
  bool showMaitreBelts = true;

  @override
  void initState() {
    super.initState();
    loadBelt();
  }

  Future<String> loadBeltData() async {
    return await rootBundle.loadString('database/mhrs/armor/waist.json');
  }

  Future<String> loadSkillData() async {
    return await rootBundle.loadString('database/mhrs/skill.json');
  }

  Future<void> loadBelt() async {
    String jsonText = await loadBeltData();
    List<dynamic> jsonResponse = json.decode(jsonText);
    String skillJsonText = await loadSkillData();
    List<dynamic> skillList = json.decode(skillJsonText);
    setState(() {
      lbelt = jsonResponse
          .map(
              (ceinture) => Ceinture.fromJson(ceinture, skillList, Stuff.local))
          .toList();
    });
  }

  List<Ceinture> getFilteredBelts() {
    List<Ceinture> filteredBelts = [];

    if (showExpertBelts) {
      filteredBelts
          .addAll(lbelt.where((belt) => belt.categorie == 'expert').toList());
    }
    if (showMaitreBelts) {
      filteredBelts
          .addAll(lbelt.where((belt) => belt.categorie == 'maitre').toList());
    }
    return filteredBelts;
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
                  value: showNoviceBelts,
                  onChanged: (checked) {
                    setState(() {
                      showNoviceBelts = checked ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Experts'),
                  value: showExpertBelts,
                  onChanged: (checked) {
                    setState(() {
                      showExpertBelts = checked ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Maîtres'),
                  value: showMaitreBelts,
                  onChanged: (checked) {
                    setState(() {
                      showMaitreBelts = checked ?? false;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: getFilteredBelts().length,
                  itemBuilder: (context, index) {
                    Ceinture belt = getFilteredBelts()[index];
                    return Card(
                        margin:
                            const EdgeInsets.only(top: 5, left: 10, right: 10),
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 255, 255, 255)),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop(belt);
                          },
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  belt.name,
                                ),
                              ],
                            ),
                            leading: Text('R${belt.rarete}'),
                            subtitle: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(children: [
                                      const Text("Joyau"),
                                      getFilteredBelts()[index].slots.isEmpty
                                          ? const Text('- / - / -')
                                          : Row(
                                              children: [
                                                for (int i = 0; i < 3; i++)
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 8),
                                                    child: Text(getFilteredBelts()[
                                                                    index]
                                                                .slots
                                                                .length >
                                                            i
                                                        ? '${getFilteredBelts()[index].slots[i].toString()} /'
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
                                        if (belt.talents.length > i)
                                          Text(
                                              '${belt.talents[i].name} + ${belt.talents[i].level}'),
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
