import 'dart:async';
import 'dart:convert';
import 'package:accordion/accordion.dart';
import 'package:builder_mhrs/object/Armure.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../manager/colorManager.dart';
import '../manager/filter/getCheckbox.dart';
import '../manager/filter/getCombobox.dart';
import '../manager/filter/getSearchBar.dart';
import '../manager/popup/accordeonManager.dart';
import '../manager/popup/cardListManager.dart';
import '../object/Stuff.dart';
import '../object/Talent.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<Ceinture> lbelt = [], filteredBelts = [];  List<Talent> lskill = [];  Talent selectedSkill = Talent.getBase();
  bool rcCheck = false, rmCheck = true, isExpanded = false;
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
          .toList();      lskill.add(Talent.getBase());
      lskill.addAll(skillList
          .map((skill) => Talent.getJson(skill, Stuff.local))
          .toList());
      // Triez la liste lskill par le nom du talent
      lskill.sort((a, b) => a.name.compareTo(b.name));

      // Exclure les éléments ayant les ID 147, 148 et 149
      lskill.removeWhere(
          (talent) => talent.id == 147 || talent.id == 148 || talent.id == 149);

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
                filterRank(),
                filterAccordeon(),
                getSearchBar(tc, context, searchFilter),
              ])),
          Expanded(
              child: ListView.builder(
                  itemCount: filteredBelts.length,
                  itemBuilder: (context, index) {
                    Ceinture belt = filteredBelts[index];
                    return getCardArmorPopup(belt, context);
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
        content: Column(children: [          filterComboSkill(lskill, selectedSkill, context, (int? newValue) {
            setState(() {
              selectedSkill =
                  lskill.firstWhere((skill) => skill.id == newValue!);
            });
          })])));
  }

  Widget filterRank() {
    return Card(
        color: getThird(),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
        ]));
  }
  void resetRankChoice() {
    rcCheck = false;
    rmCheck = false;
    tc.text = "";
  }
}
