import 'dart:async';
import 'dart:convert';
import 'package:builder_mhrs/manager/color/colorManager.dart';
import 'package:builder_mhrs/manager/img/imgManager.dart';
import 'package:builder_mhrs/manager/img/rampage.dart';
import 'package:builder_mhrs/manager/widget/boxShadow.dart';
import 'package:builder_mhrs/manager/widget/filter/getCheckbox.dart';
import 'package:builder_mhrs/manager/widget/filter/getSearchBar.dart';
import 'package:builder_mhrs/object/JoyauCalam.dart';
import 'package:builder_mhrs/object/Stuff.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ListViewScreen extends StatefulWidget {
  final int slot;
  final String categ;
  const ListViewScreen(
    this.slot,
    this.categ, {
    Key? key,
  }) : super(key: key);

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<JoyauxCalam> lcalamJowel = [], lFilteredCalam = [];
  bool slot3 = false,
      slot2 = false,
      slot1 = false,
      activeShow3 = false,
      activeShow2 = false,
      activeShow1 = false;
  TextEditingController tc = TextEditingController();

  @override
  void initState() {
    super.initState();
    changeShow();
    loadCalamJowel();
  }

  Future<void> loadCalamJowel() async {
    String jsonText =
        await rootBundle.loadString('database/mhrs/calamityJowel.json');
    List<dynamic> jsonResponse = json.decode(jsonText);
    setState(() {
      lcalamJowel = jsonResponse
          .map((calamJowel) => JoyauxCalam.fromJson(calamJowel, Stuff.local))
          .toList();
      getFilteredCalamJowels();
    });
  }

  void changeShow() {
    setState(() {
      if (widget.slot == 3) {
        slot3 = true;
        activeShow3 = true;
      }
      if (widget.slot >= 2) {
        slot2 = true;
        activeShow2 = true;
      }
      if (widget.slot >= 1) {
        slot1 = true;
        activeShow1 = true;
      }
    });
  }

  void getFilteredCalamJowels() {
    List<JoyauxCalam> filteredCalamJowel = [];
    if (lcalamJowel.isNotEmpty) {
      filteredCalamJowel.add(lcalamJowel[0]);
    }
    if (slot3) {
      filteredCalamJowel.addAll(
          lcalamJowel.where((calamJowel) => calamJowel.slot == 3).toList());
    }
    if (slot2) {
      filteredCalamJowel.addAll(
          lcalamJowel.where((calamJowel) => calamJowel.slot == 2).toList());
    }
    if (slot1) {
      filteredCalamJowel.addAll(
          lcalamJowel.where((calamJowel) => calamJowel.slot == 1).toList());
    }
    if (widget.categ != "GS" && widget.categ != "CB") {
      filteredCalamJowel.removeWhere((calamJowel) => calamJowel.id == 3);
      filteredCalamJowel.removeWhere((calamJowel) => calamJowel.id == 4);
    }
    if (widget.categ != "DB") {
      filteredCalamJowel.removeWhere((calamJowel) => calamJowel.id == 5);
      filteredCalamJowel.removeWhere((calamJowel) => calamJowel.id == 31);
    }
    if (widget.categ != "MRTO") {
      filteredCalamJowel.removeWhere((calamJowel) => calamJowel.id == 30);
    }
    if (widget.categ != "HH") {
      filteredCalamJowel.removeWhere((calamJowel) => calamJowel.id == 6);
    }
    if (widget.categ != "LNC") {
      filteredCalamJowel.removeWhere((calamJowel) => calamJowel.id == 33);
    }
    if (widget.categ != "SA") {
      filteredCalamJowel.removeWhere((calamJowel) => calamJowel.id == 7);
    }
    if (widget.categ != "IG") {
      filteredCalamJowel.removeWhere((calamJowel) => calamJowel.id == 32);
    }
    if (widget.categ != "ARC") {
      filteredCalamJowel.removeWhere((calamJowel) => calamJowel.id == 8);
    }
    if (widget.categ != "LBG" &&
        widget.categ != "HBG" &&
        widget.categ != "GL") {
      filteredCalamJowel.removeWhere((calamJowel) => calamJowel.id == 9);
    }
    lFilteredCalam = filteredCalamJowel;
  }

  void searchFilter(String keyword) {
    getFilteredCalamJowels();
    List<JoyauxCalam> filteredCalamJowel = [];
    if (keyword.isEmpty || keyword == '') {
      filteredCalamJowel = lFilteredCalam;
    } else {
      filteredCalamJowel = lFilteredCalam
          .where((deco) =>
              deco.name.toLowerCase().contains(keyword.toLowerCase()) ||
              deco.slot == 0)
          .toList();
    }
    setState(() {
      lFilteredCalam = filteredCalamJowel;
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
                  itemCount: lFilteredCalam.length,
                  itemBuilder: (context, index) {
                    JoyauxCalam calamJowel = lFilteredCalam[index];
                    if (index == 0) {
                      return Card(
                          margin: const EdgeInsets.only(
                              top: 5, left: 10, right: 10),
                          child: TextButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(fourth)),
                              onPressed: () {
                                Navigator.of(context).pop(calamJowel);
                              },
                              child: ListTile(
                                  title:
                                      Center(child: Text(calamJowel.name)))));
                    } else {
                      return Card(
                          margin: const EdgeInsets.only(
                              top: 5, left: 10, right: 10),
                          child: TextButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(fourth)),
                              onPressed: () {
                                Navigator.of(context).pop(calamJowel);
                              },
                              child: ListTile(
                                  title: Center(
                                      child: Text(
                                          "${AppLocalizations.of(context)!.joyau} ${calamJowel.name}")),
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
                                              image: AssetImage(slotCalam(
                                                  calamJowel.slot))))),
                                  subtitle: Column(children: [
                                    Center(
                                        child: Text(
                                            "${AppLocalizations.of(context)!.talent} : ${calamJowel.talentName}"))
                                  ]))));
                    }
                  }))
        ]));
  }

  Widget BlockFilter() {
    return Card(
        color: third,
        margin: const EdgeInsets.all(5),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          checkboxDeco(ramp3, slot3, activeShow3, (bool check) {
            setState(() {
              slot3 = check;
              getFilteredCalamJowels();
            });
          }),
          checkboxDeco(ramp2, slot2, activeShow2, (bool check) {
            setState(() {
              slot2 = check;
              getFilteredCalamJowels();
            });
          }),
          checkboxDeco(ramp1, slot1, activeShow1, (bool check) {
            setState(() {
              slot1 = check;
              getFilteredCalamJowels();
            });
          })
        ]));
  }
}
