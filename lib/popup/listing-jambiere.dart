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
  List<Jambiere> lleg = [], filteredLegs = [];
  bool rcCheck = false;
  bool rmCheck = true;
  TextEditingController tc = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadLeg();
  }

  Future<void> loadLeg() async {
    String jsonText =
        await rootBundle.loadString('database/mhrs/armor/legs.json');
    List<dynamic> jsonResponse = json.decode(jsonText);
    String skillJsonText =
        await rootBundle.loadString('database/mhrs/skill.json');
    List<dynamic> skillList = json.decode(skillJsonText);
    setState(() {
      lleg = jsonResponse
          .map(
              (jambiere) => Jambiere.fromJson(jambiere, skillList, Stuff.local))
          .toList();
      getFilteredLegs();
    });
  }

  void getFilteredLegs() {
    List<Jambiere> fLegs = [];
    if (rcCheck) {
      fLegs.addAll(lleg.where((leg) => leg.categorie == 'expert').toList());
    }
    if (rmCheck) {
      fLegs.addAll(lleg.where((leg) => leg.categorie == 'maitre').toList());
    }
    filteredLegs = fLegs;
  }

  void searchFilter(String keyword) {
    getFilteredLegs();
    List<Jambiere> fLegs = [];
    if (keyword.isEmpty || keyword == '') {
      fLegs = filteredLegs;
    } else {
      fLegs = filteredLegs
          .where((armor) =>
              armor.name.toLowerCase().contains(keyword.toLowerCase()) ||
              armor.categorie == "none")
          .toList();
    }
    setState(() {
      filteredLegs = fLegs;
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
                              getFilteredLegs();
                            });
                          }),
                          checkboxRank("RM", rmCheck, () {
                            setState(() {
                              resetRankChoice();
                              rmCheck = !rmCheck;
                              getFilteredLegs();
                            });
                          })
                        ])),
                getSearchBar(tc, context, searchFilter),
              ])),
          Expanded(
              child: ListView.builder(
                  itemCount: filteredLegs.length,
                  itemBuilder: (context, index) {
                    Jambiere leg = filteredLegs[index];
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
                                    children: [Text(leg.name)]),
                                subtitle: Column(children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(children: [
                                          Text(AppLocalizations.of(context)!.joyau),
                                          slotJowel(leg.slots)
                                        ])
                                      ]),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(children: [
                                         Text(AppLocalizations.of(context)!.talent),
                                          for (int i = 0; i < 4; i++)
                                            if (leg.talents.length > i)
                                              Text(
                                                  '${leg.talents[i].name} + ${leg.talents[i].level}'),
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
