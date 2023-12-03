import 'dart:convert';
import 'package:builder_mhrs/manager/text/color.dart';
import 'package:builder_mhrs/manager/widget/filter/getSearchBar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:builder_mhrs/manager/color/colorManager.dart';
import 'package:builder_mhrs/manager/mh/armor/florManager.dart';
import 'package:builder_mhrs/object/armor/Florelet.dart';
import 'package:builder_mhrs/object/Stuff.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<Florelet> lpetalas = [], lFilteredPetalas = [];
  TextEditingController tc = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadPetalas();
  }

  Future<void> loadPetalas() async {
    String jsonText =
        await rootBundle.loadString('database/mhrs/armor/petalas.json');
    List<dynamic> jsonResponse = json.decode(jsonText);
    setState(() {
      lpetalas.add(Florelet.getBase());
      lpetalas = jsonResponse
          .map((petalas) => Florelet.fromJson(petalas, Stuff.local))
          .toList();
      lFilteredPetalas = lpetalas;
    });
  }

  void searchFilter(String keyword) {
    lFilteredPetalas = lpetalas;
    List<Florelet> filteredFlor = [];
    if (keyword.isEmpty || keyword == '') {
      filteredFlor = lFilteredPetalas;
    } else {
      filteredFlor = lFilteredPetalas
          .where(
              (flor) => flor.name.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    }
    setState(() {
      lFilteredPetalas = filteredFlor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: secondary,
        child: Column(children: [
          getSearchBar(tc, context, searchFilter),
          Expanded(
              child: ListView.builder(
                  itemCount: lFilteredPetalas.length,
                  itemBuilder: (context, index) {
                    Florelet p = lFilteredPetalas[index];
                    return Card(
                        margin:
                            const EdgeInsets.only(top: 5, left: 10, right: 10),
                        child: TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(fourth)),
                            onPressed: () {
                              Navigator.of(context).pop(p);
                            },
                            child: ListTile(
                                title: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [boldBlack(p.name)]),
                                subtitle: Column(children: [
                                  nomStat(
                                      AppLocalizations.of(context)!.pBoostG),
                                  rowFlorListing(
                                      p.uVie, p.uStam, p.uAtt, p.uDef),
                                  nomStat(
                                      AppLocalizations.of(context)!.pBoostS),
                                  rowFlorListing(
                                      p.gVie, p.gStam, p.gAtt, p.gDef),
                                ]))));
                  }))
        ]));
  }

  Container nomStat(String nom) {
    return Container(margin: const EdgeInsets.all(5.0), child: Text(nom));
  }
}
