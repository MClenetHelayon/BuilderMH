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
  List<Jambiere> lleg = [];
  bool showNoviceLegs = true;
  bool showExpertLegs = true;
  bool showMaitreLegs = true;

  @override
  void initState() {
    super.initState();
    loadLeg();
  }

  Future<String> loadLegData() async {
    return await rootBundle.loadString('database/mhrs/armor/legs.json');
  }

  Future<String> loadSkillData() async {
    return await rootBundle.loadString('database/mhrs/skill.json');
  }

  Future<void> loadLeg() async {
    String jsonText = await loadLegData();
    List<dynamic> jsonResponse = json.decode(jsonText);
    String skillJsonText = await loadSkillData();
    List<dynamic> skillList = json.decode(skillJsonText);
    setState(() {
      lleg = jsonResponse
          .map(
              (jambiere) => Jambiere.fromJson(jambiere, skillList, Stuff.local))
          .toList();
    });
  }

  List<Jambiere> getFilteredLegs() {
    List<Jambiere> filteredLegs = [];

    if (showExpertLegs) {
      filteredLegs
          .addAll(lleg.where((leg) => leg.categorie == 'expert').toList());
    }
    if (showMaitreLegs) {
      filteredLegs
          .addAll(lleg.where((leg) => leg.categorie == 'maitre').toList());
    }
    return filteredLegs;
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
                  value: showNoviceLegs,
                  onChanged: (checked) {
                    setState(() {
                      showNoviceLegs = checked ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Experts'),
                  value: showExpertLegs,
                  onChanged: (checked) {
                    setState(() {
                      showExpertLegs = checked ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Maîtres'),
                  value: showMaitreLegs,
                  onChanged: (checked) {
                    setState(() {
                      showMaitreLegs = checked ?? false;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: getFilteredLegs().length,
                  itemBuilder: (context, index) {
                    Jambiere leg = getFilteredLegs()[index];
                    return Card(
                        margin:
                            const EdgeInsets.only(top: 5, left: 10, right: 10),
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 255, 255, 255)),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop(leg);
                          },
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  leg.name,
                                ),
                              ],
                            ),
                            leading: Text('R${leg.rarete}'),
                            subtitle: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(children: [
                                      const Text("Joyau"),
                                      getFilteredLegs()[index].slots.isEmpty
                                          ? const Text('- / - / -')
                                          : Row(
                                              children: [
                                                for (int i = 0; i < 3; i++)
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 8),
                                                    child: Text(getFilteredLegs()[
                                                                    index]
                                                                .slots
                                                                .length >
                                                            i
                                                        ? '${getFilteredLegs()[index].slots[i].toString()} /'
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
                                        if (leg.talents.length > i)
                                          Text(
                                              '${leg.talents[i].name} + ${leg.talents[i].level}'),
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
