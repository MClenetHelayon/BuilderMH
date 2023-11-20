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
  List<Plastron> lchestplate = [], filteredChestplates = [];
  bool rcCheck = false;
  bool rmCheck = true;
  TextEditingController tc = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadChestplate();
    getFilteredChestplates();
    filteredChestplates = lchestplate;
  }

  Future<void> loadChestplate() async {
    String jsonText =
        await rootBundle.loadString('database/mhrs/armor/chest.json');
    List<dynamic> jsonResponse = json.decode(jsonText);
    String skillJsonText =
        await rootBundle.loadString('database/mhrs/skill.json');
    List<dynamic> skillList = json.decode(skillJsonText);
    setState(() {
      lchestplate = jsonResponse
          .map(
              (plastron) => Plastron.fromJson(plastron, skillList, Stuff.local))
          .toList();
      getFilteredChestplates();
    });
  }

  void getFilteredChestplates() {
    List<Plastron> fChest = [];

    if (rcCheck) {
      fChest.addAll(
          lchestplate.where((helmet) => helmet.categorie == 'expert').toList());
    }
    if (rmCheck) {
      fChest.addAll(
          lchestplate.where((helmet) => helmet.categorie == 'maitre').toList());
    }
    filteredChestplates = fChest;
  }

  void searchFilter(String keyword) {
    getFilteredChestplates();
    List<Plastron> fChest = [];
    if (keyword.isEmpty || keyword == '') {
      fChest = filteredChestplates;
    } else {
      fChest = filteredChestplates
          .where((armor) =>
              armor.name.toLowerCase().contains(keyword.toLowerCase()) ||
              armor.categorie == "none")
          .toList();
    }
    setState(() {
      filteredChestplates = fChest;
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
                              getFilteredChestplates();
                            });
                          }),
                          checkboxRank("RM", rmCheck, () {
                            setState(() {
                              resetRankChoice();
                              rmCheck = !rmCheck;
                              getFilteredChestplates();
                            });
                          })
                        ])),
                getSearchBar(tc, context, searchFilter),
              ])),
          Expanded(
              child: ListView.builder(
                  itemCount: filteredChestplates.length,
                  itemBuilder: (context, index) {
                    Plastron chestplate = filteredChestplates[index];
                    return Card(
                        margin:
                            const EdgeInsets.only(top: 5, left: 10, right: 10),
                        child: TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(getFourth()),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop(chestplate);
                            },
                            child: ListTile(
                                title: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [Text(chestplate.name)]),
                                subtitle: Column(children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(children: [
                                          Text(AppLocalizations.of(context)!
                                              .joyau),
                                          slotJowel(chestplate.slots)
                                        ])
                                      ]),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(children: [
                                          Text(AppLocalizations.of(context)!
                                              .talent),
                                          for (int i = 0; i < 4; i++)
                                            if (chestplate.talents.length > i)
                                              Text(
                                                  '${chestplate.talents[i].name} + ${chestplate.talents[i].level}'),
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
