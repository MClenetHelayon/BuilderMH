import 'dart:async';
import 'dart:convert';
import 'package:builder_mhrs/manager/textManager.dart';
import 'package:builder_mhrs/object/Armure.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../manager/colorManager.dart';
import '../manager/filter/getCheckbox.dart';
import '../manager/filter/getSearchBar.dart';
import '../object/Stuff.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<Bras> lvambrace = [], filteredVambraces = [];
  bool rcCheck = false;
  bool rmCheck = true;
  TextEditingController tc = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadVambrace();
  }

  Future<void> loadVambrace() async {
    String jsonText =
        await rootBundle.loadString('database/mhrs/armor/arm.json');
    List<dynamic> jsonResponse = json.decode(jsonText);
    String skillJsonText =
        await rootBundle.loadString('database/mhrs/skill.json');
    List<dynamic> skillList = json.decode(skillJsonText);
    setState(() {
      lvambrace = jsonResponse
          .map((vambrace) => Bras.fromJson(vambrace, skillList, Stuff.local))
          .toList();
      getFilteredVambraces();
    });
  }

  void getFilteredVambraces() {
    List<Bras> fVambraces = [];

    if (rcCheck) {
      fVambraces.addAll(lvambrace
          .where((vambrace) => vambrace.categorie == 'expert')
          .toList());
    }
    if (rmCheck) {
      fVambraces.addAll(lvambrace
          .where((vambrace) => vambrace.categorie == 'maitre')
          .toList());
    }
    filteredVambraces = fVambraces;
  }

  void searchFilter(String keyword) {
    getFilteredVambraces();
    List<Bras> fVambraces = [];
    if (keyword.isEmpty || keyword == '') {
      fVambraces = filteredVambraces;
    } else {
      fVambraces = filteredVambraces
          .where((armor) =>
              armor.name.toLowerCase().contains(keyword.toLowerCase()) ||
              armor.categorie == "none")
          .toList();
    }
    setState(() {
      filteredVambraces = fVambraces;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: getSecondary(),
        child: Column(children: [
          Card(
              color: getSecondary(),
              child: Column(children: [
                Card(
                    color: getThird(),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          checkboxRank("RC", rcCheck, () {
                            setState(() {
                              resetRankChoice();
                              rcCheck = !rcCheck;
                              getFilteredVambraces();
                            });
                          }),
                          checkboxRank("RM", rmCheck, () {
                            setState(() {
                              resetRankChoice();
                              rmCheck = !rmCheck;
                              getFilteredVambraces();
                            });
                          })
                        ])),
                getSearchBar(tc, context, searchFilter),
              ])),
          Expanded(
              child: ListView.builder(
                  itemCount: filteredVambraces.length,
                  itemBuilder: (context, index) {
                    Bras vambrace = filteredVambraces[index];
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
                                    children: [Text(vambrace.name)]),
                                subtitle: Column(children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(children: [
                                          Text(AppLocalizations.of(context)!.joyau),
                                          slotJowel(vambrace.slots),
                                        ]),
                                      ]),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(children: [
                                         Text(AppLocalizations.of(context)!.talent),
                                          for (int i = 0; i < 4; i++)
                                            if (vambrace.talents.length > i)
                                              Text(
                                                  '${vambrace.talents[i].name} + ${vambrace.talents[i].level}'),
                                        ])
                                      ])
                                ]))));
                  }))
        ]));
  }

  void resetRankChoice() {
    rcCheck = false;
    rmCheck = false;
    tc.text = "";
  }
}
