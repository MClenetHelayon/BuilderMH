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
  List<Plastron> lchestplate = [];
  bool showNoviceChestplates = true;
  bool showExpertChestplates = true;
  bool showMaitreChestplates = true;

  @override
  void initState() {
    super.initState();
    loadChestplate();
  }

  Future<String> loadChestplateData() async {
    return await rootBundle.loadString('database/mhrs/armor/chest.json');
  }

  Future<String> loadSkillData() async {
    return await rootBundle.loadString('database/mhrs/skill.json');
  }

  Future<void> loadChestplate() async {
    String jsonText = await loadChestplateData();
    List<dynamic> jsonResponse = json.decode(jsonText);
    String skillJsonText = await loadSkillData();
    List<dynamic> skillList = json.decode(skillJsonText);
    setState(() {
      lchestplate = jsonResponse
          .map(
              (plastron) => Plastron.fromJson(plastron, skillList, Stuff.local))
          .toList();
    });
  }

  List<Plastron> getFilteredChestplates() {
    List<Plastron> filteredChestplates = [];

    if (showExpertChestplates) {
      filteredChestplates.addAll(
          lchestplate.where((helmet) => helmet.categorie == 'expert').toList());
    }
    if (showMaitreChestplates) {
      filteredChestplates.addAll(
          lchestplate.where((helmet) => helmet.categorie == 'maitre').toList());
    }
    return filteredChestplates;
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
                  value: showNoviceChestplates,
                  onChanged: (checked) {
                    setState(() {
                      showNoviceChestplates = checked ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Experts'),
                  value: showExpertChestplates,
                  onChanged: (checked) {
                    setState(() {
                      showExpertChestplates = checked ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Maîtres'),
                  value: showMaitreChestplates,
                  onChanged: (checked) {
                    setState(() {
                      showMaitreChestplates = checked ?? false;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: getFilteredChestplates().length,
                  itemBuilder: (context, index) {
                    Plastron chestplate = getFilteredChestplates()[index];
                    return Card(
                        margin:
                            const EdgeInsets.only(top: 5, left: 10, right: 10),
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 255, 255, 255)),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop(chestplate);
                          },
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  chestplate.name,
                                ),
                              ],
                            ),
                            leading: Text('R${chestplate.rarete}'),
                            subtitle: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(children: [
                                      const Text("Joyau"),
                                      chestplate.slots.isEmpty
                                          ? const Text('- / - / -')
                                          : Row(
                                              children: [
                                                for (int i = 0; i < 3; i++)
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 8),
                                                    child: Text(chestplate
                                                                .slots.length >
                                                            i
                                                        ? '${chestplate.slots[i].toString()} /'
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
                                        if (chestplate.talents.length > i)
                                          Text(
                                              '${chestplate.talents[i].name} + ${chestplate.talents[i].level}'),
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
