import 'dart:async';
import 'dart:convert';
import 'package:builder_mhrs/manager/color/colorManager.dart';
import 'package:builder_mhrs/manager/img/deco.dart';
import 'package:builder_mhrs/manager/img/imgManager.dart';
import 'package:builder_mhrs/manager/widget/boxShadow.dart';
import 'package:builder_mhrs/manager/widget/filter/getCheckbox.dart';
import 'package:builder_mhrs/manager/widget/filter/getSearchBar.dart';
import 'package:builder_mhrs/object/Joyau.dart';
import 'package:builder_mhrs/object/Stuff.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ListViewScreen extends StatefulWidget {
  final int slot;
  const ListViewScreen(
    this.slot, {
    Key? key,
  }) : super(key: key);

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<Joyaux> ljowel = [], lFilteredDeco = [];
  bool show4 = false,
      show3 = false,
      show2 = false,
      show1 = false,
      activeShow4 = false,
      activeShow3 = false,
      activeShow2 = false,
      activeShow1 = false;
  TextEditingController tc = TextEditingController();

  @override
  void initState() {
    super.initState();
    changeShow();
    loadJowel();
  }

  Future<void> loadJowel() async {
    String jsonText = await rootBundle.loadString('database/mhrs/jowel.json');
    List<dynamic> jsonResponse = json.decode(jsonText);
    String skillJsonText =
        await rootBundle.loadString('database/mhrs/skill.json');
    List<dynamic> skillList = json.decode(skillJsonText);
    setState(() {
      ljowel = jsonResponse
          .map((jowel) => Joyaux.fromJson(jowel, skillList, Stuff.local))
          .toList();
      lFilteredDeco = getFilteredJowel(widget.slot);
    });
  }

  void changeShow() {
    setState(() {
      if (widget.slot == 4) {
        show4 = true;
        activeShow4 = true;
      }
      if (widget.slot >= 3) {
        show3 = true;
        activeShow3 = true;
      }
      if (widget.slot >= 2) {
        show2 = true;
        activeShow2 = true;
      }
      if (widget.slot >= 1) {
        show1 = true;
        activeShow1 = true;
      }
    });
  }

  List<Joyaux> getFilteredJowel(int slot) {
    List<Joyaux> filteredJowel = [];
    if (ljowel.isNotEmpty) {
      filteredJowel.add(ljowel[0]);
    }
    if (show4 && slot == 4) {
      filteredJowel.addAll(ljowel.where((jowel) => jowel.slot == 4).toList());
    }
    if (show3 && slot >= 3) {
      filteredJowel.addAll(ljowel.where((jowel) => jowel.slot == 3).toList());
    }
    if (show2 && slot >= 2) {
      filteredJowel.addAll(ljowel.where((jowel) => jowel.slot == 2).toList());
    }
    if (show1 && slot >= 1) {
      filteredJowel.addAll(ljowel.where((jowel) => jowel.slot == 1).toList());
    }
    return filteredJowel;
  }

  void searchFilter(String keyword) {
    getFilteredJowel(widget.slot);
    List<Joyaux> filteredJowel = [];
    if (keyword.isEmpty || keyword == '') {
      filteredJowel = lFilteredDeco;
    } else {
      filteredJowel = lFilteredDeco
          .where((deco) =>
              deco.name.toLowerCase().contains(keyword.toLowerCase()) ||
              deco.level == 0)
          .toList();
    }
    setState(() {
      lFilteredDeco = filteredJowel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: secondary,
        child: Column(children: [
          BlockFilter(),
          getSearchBar(tc, context, searchFilter),
          Expanded(
              child: ListView.builder(
                  itemCount: lFilteredDeco.length,
                  itemBuilder: (context, index) {
                    Joyaux jowel = lFilteredDeco[index];
                    if (index == 0) {
                      return Card(
                          margin: const EdgeInsets.only(
                              top: 5, left: 10, right: 10),
                          child: TextButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(fourth)),
                              onPressed: () {
                                Navigator.of(context).pop(jowel);
                              },
                              child: ListTile(
                                  title: Center(child: Text(jowel.name)))));
                    } else {
                      return Card(
                          margin: const EdgeInsets.only(
                              top: 5, left: 10, right: 10),
                          child: TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(fourth),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop(jowel);
                              },
                              child: ListTile(
                                  title: Center(child: Text(jowel.name)),
                                  leading: Container(
                                      height: 22,
                                      width: 22,
                                      margin: const EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: secondary,
                                          boxShadow: shadowDecoRamp(),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  slot(jowel.slot))))),
                                  subtitle: Center(
                                      child: Column(children: [
                                    Text(AppLocalizations.of(context)!.talent),
                                    Text('${jowel.nameSkill} +${jowel.level}')
                                  ])))));
                    }
                  }))
        ]));
  }

  Widget BlockFilter() {
    return Card(
        color: third,
        margin: const EdgeInsets.all(5),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          checkboxDeco(slot4, show4, activeShow4, (bool check) {
            setState(() {
              show4 = check;
              lFilteredDeco = getFilteredJowel(widget.slot);
            });
          }),
          checkboxDeco(slot3, show3, activeShow3, (bool check) {
            setState(() {
              show3 = check;
              lFilteredDeco = getFilteredJowel(widget.slot);
            });
          }),
          checkboxDeco(slot2, show2, activeShow2, (bool check) {
            setState(() {
              show2 = check;
              lFilteredDeco = getFilteredJowel(widget.slot);
            });
          }),
          checkboxDeco(slot1, show1, activeShow1, (bool check) {
            setState(() {
              show1 = check;
              lFilteredDeco = getFilteredJowel(widget.slot);
            });
          })
        ]));
  }
}
