import 'dart:async';
import 'dart:convert';
import 'package:builder_mhrs/manager/colorManager.dart';
import 'package:builder_mhrs/manager/filter/getSearchBar.dart';
import 'package:builder_mhrs/manager/textManager.dart';
import 'package:builder_mhrs/object/Armure.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../manager/filter/getCheckbox.dart';
import '../object/Stuff.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<Casque> lhelmet = [], filteredHelmets = [];
  bool rcCheck = false;
  bool rmCheck = true;
  TextEditingController tc = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadHelmet();
    getFilteredHelmets();
    filteredHelmets = lhelmet;
  }

  Future<void> loadHelmet() async {
    String jsonText =
        await rootBundle.loadString('database/mhrs/armor/helmet.json');
    List<dynamic> jsonResponse = json.decode(jsonText);
    String skillJsonText =
        await rootBundle.loadString('database/mhrs/skill.json');
    List<dynamic> skillList = json.decode(skillJsonText);
    setState(() {
      lhelmet = jsonResponse
          .map((casque) => Casque.fromJson(casque, skillList, Stuff.local))
          .toList();
      getFilteredHelmets();
    });
  }

  void getFilteredHelmets() {
    List<Casque> fHelmet = [];
    if (rcCheck) {
      fHelmet.addAll(
          lhelmet.where((helmet) => helmet.categorie == 'expert').toList());
    }
    if (rmCheck) {
      fHelmet.addAll(
          lhelmet.where((helmet) => helmet.categorie == 'maitre').toList());
    }
    filteredHelmets = fHelmet;
  }

  void searchFilter(String keyword) {
    getFilteredHelmets();
    List<Casque> fHelmet = [];
    if (keyword.isEmpty || keyword == '') {
      fHelmet = filteredHelmets;
    } else {
      fHelmet = filteredHelmets
          .where((armor) =>
              armor.name.toLowerCase().contains(keyword.toLowerCase()) ||
              armor.categorie == "none")
          .toList();
    }
    setState(() {
      filteredHelmets = fHelmet;
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
                              getFilteredHelmets();
                            });
                          }),
                          checkboxRank("RM", rmCheck, () {
                            setState(() {
                              resetRankChoice();
                              rmCheck = !rmCheck;
                              getFilteredHelmets();
                            });
                          })
                        ])),
                getSearchBar(tc, context, searchFilter),
              ])),
          Expanded(
              child: ListView.builder(
                  itemCount: filteredHelmets.length,
                  itemBuilder: (context, index) {
                    Casque helmet = filteredHelmets[index];
                    return Card(
                        margin:
                            const EdgeInsets.only(top: 5, left: 10, right: 10),
                        child: TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(getFourth()),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop(helmet);
                            },
                            child: ListTile(
                                title: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(helmet.name),
                                    ]),
                                subtitle: Column(children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(children: [
                                          Text(AppLocalizations.of(context)!
                                              .joyau),
                                          slotJowel(helmet.slots)
                                        ])
                                      ]),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(children: [
                                           Text(AppLocalizations.of(context)!.talent),
                                          for (int i = 0; i < 4; i++)
                                            if (helmet.talents.length > i)
                                              Text(
                                                  '${helmet.talents[i].name} + ${helmet.talents[i].level}'),
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
