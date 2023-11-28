import 'dart:async';
import 'dart:convert';
import 'package:accordion/accordion.dart';
import 'package:builder_mhrs/manager/color/colorManager.dart';
import 'package:builder_mhrs/manager/widget/accordeonManager.dart';
import 'package:builder_mhrs/manager/widget/cardListManager.dart';
import 'package:builder_mhrs/manager/widget/filter/getCheckbox.dart';
import 'package:builder_mhrs/manager/widget/filter/getCombobox.dart';
import 'package:builder_mhrs/manager/widget/filter/getSearchBar.dart';
import 'package:builder_mhrs/object/Stuff.dart';
import 'package:builder_mhrs/object/Talent.dart';
import 'package:builder_mhrs/object/armor/Bras.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ListViewScreen extends StatefulWidget {
  const ListViewScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<Bras> lvambrace = [], filteredVambraces = [];
  List<Talent> lskill = [];
  Talent selectedSkill = Talent.getBase();
  bool rcCheck = false, rmCheck = true, isExpanded = false;
  TextEditingController tc = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadVambrace();
    getFilteredVambraces();
    filteredVambraces = lvambrace;
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
      lskill.add(Talent.getBase());
      lskill.addAll(skillList
          .map((skill) => Talent.getJson(skill, Stuff.local))
          .toList());
      // Triez la liste lskill par le nom du talent
      lskill.sort((a, b) => a.name.compareTo(b.name));

      // Exclure les éléments ayant les ID 147, 148 et 149
      lskill.removeWhere(
          (talent) => talent.id == 147 || talent.id == 148 || talent.id == 149);

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
                filterRank(),
                filterAccordeon(),
                getSearchBar(tc, context, searchFilter),
              ])),
          Expanded(
              child: ListView.builder(
                  itemCount: filteredVambraces.length,
                  itemBuilder: (context, index) {
                    Bras vambrace = filteredVambraces[index];
                    return getCardArmorPopup(vambrace, context);
                  }))
        ]));
  }

  Widget filterAccordeon() {
    return accordeon(AccordionSection(
        isOpen: isExpanded,
        onOpenSection: () => setState(() => isExpanded = true),
        contentVerticalPadding: 10,
        contentBackgroundColor: getThird(),
        contentBorderColor: getThird(),
        header: Text(AppLocalizations.of(context)!.moreFilters,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        content: Column(children: [
          filterComboSkill(lskill, selectedSkill, context, (int? newValue) {
            setState(() {
              selectedSkill =
                  lskill.firstWhere((skill) => skill.id == newValue!);
            });
          })
        ])));
  }

  Widget filterRank() {
    return Card(
        color: getThird(),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
        ]));
  }

  void resetRankChoice() {
    rcCheck = false;
    rmCheck = false;
    tc.text = "";
  }
}
