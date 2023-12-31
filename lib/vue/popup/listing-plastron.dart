import 'dart:async';
import 'dart:convert';
import 'package:accordion/accordion.dart';
import 'package:builder_mhrs/controller/color/colorManager.dart';
import 'package:builder_mhrs/controller/widget/accordeonManager.dart';
import 'package:builder_mhrs/controller/widget/cardListManager.dart';
import 'package:builder_mhrs/controller/widget/filter/getCheckbox.dart';
import 'package:builder_mhrs/controller/widget/filter/getCombobox.dart';
import 'package:builder_mhrs/controller/logic/armor.dart';
import 'package:builder_mhrs/controller/widget/filter/getSearchBar.dart';
import 'package:builder_mhrs/model/Stuff.dart';
import 'package:builder_mhrs/model/Talent.dart';
import 'package:builder_mhrs/model/armor/Plastron.dart';
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
  List<Plastron> lchestplate = [], filteredChestplates = [];
  List<Talent> lskill = [];
  Talent selectedSkill = Talent.getBase();
  bool rcCheck = false, rmCheck = true, isExpanded = false;
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
      lskill.add(Talent.getBase());
      lskill.addAll(skillList
          .map((skill) => Talent.getJson(skill, Stuff.local))
          .toList());
      // Triez la liste lskill par le nom du talent
      lskill.sort((a, b) => a.name.compareTo(b.name));

      // Exclure les éléments ayant les ID 147, 148 et 149
      lskill.removeWhere(
          (talent) => talent.id == 147 || talent.id == 148 || talent.id == 149);

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
    setState(() => filteredChestplates = fChest);
  }

  @override
  Widget build(BuildContext context) {
    List<Plastron> fChest = getLPlastron(filteredChestplates, selectedSkill);
    return Card(
        color: secondary,
        child: Column(children: [
          Card(
              color: secondary,
              child: Column(children: [
                filterRank(),
                filterAccordeon(),
                getSearchBar(tc, context, searchFilter),
              ])),
          Expanded(
              child: ListView.builder(
                  itemCount: fChest.length,
                  itemBuilder: (context, index) {
                    Plastron chestplate = fChest[index];
                    return getCardArmorPopup(chestplate, context);
                  }))
        ]));
  }

  Widget filterAccordeon() {
    return accordeon(AccordionSection(
        isOpen: isExpanded,
        onOpenSection: () => setState(() => isExpanded = true),
        contentVerticalPadding: 10,
        contentBackgroundColor: third,
        contentBorderColor: third,
        header: Text(AppLocalizations.of(context)!.moreFilters,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        content: Column(children: [
          filterComboSkill(
              lskill,
              selectedSkill,
              context,
              (int? newValue) => setState(() => selectedSkill =
                  lskill.firstWhere((skill) => skill.id == newValue!)))
        ])));
  }

  Widget filterRank() {
    return Card(
        color: third,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          checkboxRank(
              "RC",
              rcCheck,
              () => setState(() {
                    resetRankChoice();
                    rcCheck = !rcCheck;
                    getFilteredChestplates();
                  })),
          checkboxRank(
              "RM",
              rmCheck,
              () => setState(() {
                    resetRankChoice();
                    rmCheck = !rmCheck;
                    getFilteredChestplates();
                  }))
        ]));
  }

  void resetRankChoice() {
    rcCheck = false;
    rmCheck = false;
    tc.text = "";
  }
}
