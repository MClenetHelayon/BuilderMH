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
  List<Casque> lhelmet = [];
  bool showNoviceHelmets = true;
  bool showExpertHelmets = true;
  bool showMaitreHelmets = true;

  @override
  void initState() {
    super.initState();
    loadHelmet();
  }

  Future<String> loadHelmetData() async {
    return await rootBundle.loadString('database/mhrs/armor/helmet.json');
  }

  Future<String> loadSkillData() async {
    return await rootBundle.loadString('database/mhrs/skill.json');
  }

  Future<void> loadHelmet() async {
    String jsonText = await loadHelmetData();
    List<dynamic> jsonResponse = json.decode(jsonText);
    String skillJsonText = await loadSkillData();
    List<dynamic> skillList = json.decode(skillJsonText);
    setState(() {
      lhelmet = jsonResponse
          .map((casque) => Casque.fromJson(casque, skillList, Stuff.local))
          .toList();
    });
  }

  List<Casque> getFilteredHelmets() {
    List<Casque> filteredHelmets = [];

    if (showExpertHelmets) {
      filteredHelmets.addAll(
          lhelmet.where((helmet) => helmet.categorie == 'expert').toList());
    }
    if (showMaitreHelmets) {
      filteredHelmets.addAll(
          lhelmet.where((helmet) => helmet.categorie == 'maitre').toList());
    }
    return filteredHelmets;
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
                  value: showNoviceHelmets,
                  onChanged: (checked) {
                    setState(() {
                      showNoviceHelmets = checked ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Experts'),
                  value: showExpertHelmets,
                  onChanged: (checked) {
                    setState(() {
                      showExpertHelmets = checked ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Maîtres'),
                  value: showMaitreHelmets,
                  onChanged: (checked) {
                    setState(() {
                      showMaitreHelmets = checked ?? false;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: getFilteredHelmets().length,
                  itemBuilder: (context, index) {
                    Casque helmet = getFilteredHelmets()[index];
                    return Card(
                        margin:
                            const EdgeInsets.only(top: 5, left: 10, right: 10),
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 255, 255, 255)),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop(helmet);
                          },
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  helmet.name,
                                ),
                              ],
                            ),
                            leading: Text('R${helmet.rarete}'),
                            subtitle: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(children: [
                                      const Text("Joyau"),
                                      getFilteredHelmets()[index].slots.isEmpty
                                          ? const Text('- / - / -')
                                          : Row(
                                              children: [
                                                for (int i = 0; i < 3; i++)
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 8),
                                                    child: Text(
                                                        getFilteredHelmets()[
                                                                        index]
                                                                    .slots
                                                                    .length >
                                                                i
                                                            ? '${getFilteredHelmets()[index].slots[i].toString()} /'
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
                                        if (helmet.talents.length > i)
                                          Text(
                                              '${helmet.talents[i].name} + ${helmet.talents[i].level}'),
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
