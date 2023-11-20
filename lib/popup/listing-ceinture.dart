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
  List<Ceinture> lbelt = [], filteredBelts = [];
  bool rcCheck = false;
  bool rmCheck = true;
  TextEditingController tc = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadBelt();
    getFilteredBelts();
    filteredBelts = lbelt;
  }

  Future<void> loadBelt() async {
    String jsonText =
        await rootBundle.loadString('database/mhrs/armor/waist.json');
    List<dynamic> jsonResponse = json.decode(jsonText);
    String skillJsonText =
        await rootBundle.loadString('database/mhrs/skill.json');
    List<dynamic> skillList = json.decode(skillJsonText);
    setState(() {
      lbelt = jsonResponse
          .map(
              (ceinture) => Ceinture.fromJson(ceinture, skillList, Stuff.local))
          .toList();
      getFilteredBelts();
    });
  }

  void getFilteredBelts() {
    List<Ceinture> fBelts = [];

    if (rcCheck) {
      fBelts.addAll(lbelt.where((belt) => belt.categorie == 'expert').toList());
    }
    if (rmCheck) {
      fBelts.addAll(lbelt.where((belt) => belt.categorie == 'maitre').toList());
    }
    filteredBelts = fBelts;
  }

  void searchFilter(String keyword) {
    getFilteredBelts();
    List<Ceinture> fBelts = [];
    if (keyword.isEmpty || keyword == '') {
      fBelts = filteredBelts;
    } else {
      fBelts = filteredBelts
          .where((armor) =>
              armor.name.toLowerCase().contains(keyword.toLowerCase()) ||
              armor.categorie == "none")
          .toList();
    }
    setState(() {
      filteredBelts = fBelts;
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
                              getFilteredBelts();
                            });
                          }),
                          checkboxRank("RM", rmCheck, () {
                            setState(() {
                              resetRankChoice();
                              rmCheck = !rmCheck;
                              getFilteredBelts();
                            });
                          })
                        ])),
                getSearchBar(tc, context, searchFilter),
              ])),
          Expanded(
              child: ListView.builder(
                  itemCount: filteredBelts.length,
                  itemBuilder: (context, index) {
                    Ceinture belt = filteredBelts[index];
                    return Card(
                        margin:
                            const EdgeInsets.only(top: 5, left: 10, right: 10),
                        child: TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(getFourth()),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop(belt);
                            },
                            child: ListTile(
                                title: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [Text(belt.name)]),
                                subtitle: Column(children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(children: [
                                          Text(AppLocalizations.of(context)!.joyau),
                                          slotJowel(belt.slots)
                                        ]),
                                      ]),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(children: [
                                     Text(AppLocalizations.of(context)!.talent),
                                          for (int i = 0; i < 4; i++)
                                            if (belt.talents.length > i)
                                              Text(
                                                  '${belt.talents[i].name} + ${belt.talents[i].level}'),
                                        ])
                                      ]),
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
