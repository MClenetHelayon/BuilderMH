import 'dart:async';
import 'dart:convert';
import 'package:builder_mhrs/controller/color/colorManager.dart';
import 'package:builder_mhrs/controller/text/localization/arme/kinsect/getBoostKinsect.dart';
import 'package:builder_mhrs/controller/text/localization/arme/kinsect/getTypeAttaque.dart';
import 'package:builder_mhrs/controller/text/localization/arme/kinsect/getTypeKinsect.dart';
import 'package:builder_mhrs/model/Kinsect.dart';
import 'package:builder_mhrs/model/Stuff.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ListViewScreen extends StatefulWidget {
  final int level;

  const ListViewScreen(
    this.level, {
    Key? key,
  }) : super(key: key);

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<Kinsect> lkinsect = [];

  @override
  void initState() {
    super.initState();
    loadKinsectJowel();
  }

  Future<void> loadKinsectJowel() async {
    String jsonText =
        await rootBundle.loadString('database/mhrs/weapon/kinsect.json');
    List<dynamic> jsonResponse = json.decode(jsonText);
    setState(() {
      lkinsect.add(Kinsect.getBase());
      lkinsect += jsonResponse
          .map((kinsect) => Kinsect.fromJson(kinsect, Stuff.local))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: secondary,
        child: Column(children: [
          Expanded(
              child: ListView.builder(
                  itemCount: lkinsect.length,
                  itemBuilder: (context, index) {
                    Kinsect k = lkinsect[index];
                    if (index == 0) {
                      return Card(
                          margin: const EdgeInsets.only(
                              top: 5, left: 10, right: 10),
                          child: TextButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(fourth)),
                              onPressed: () => Navigator.of(context).pop(k),
                              child: ListTile(
                                  title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [Text(k.name)]))));
                    } else {
                      return Card(
                          margin: const EdgeInsets.only(
                              top: 5, left: 10, right: 10),
                          child: TextButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(fourth)),
                              onPressed: () => Navigator.of(context).pop(k),
                              child: ListTile(
                                  title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [Text(k.name)]),
                                  subtitle: Column(children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Center(
                                              child: Text(
                                                  "${AppLocalizations.of(context)!.kinAttaque} : ${k.niveauKinsect[widget.level][0]}")),
                                          Center(
                                              child: Text(
                                                  "${AppLocalizations.of(context)!.kinVitesse} : ${k.niveauKinsect[widget.level][1]}"))
                                        ]),
                                    Center(
                                        child: Text(
                                            "${AppLocalizations.of(context)!.kinSoin} : ${k.niveauKinsect[widget.level][2]}")),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Center(
                                              child: Text(getTypeAttack(
                                                  k.typeAttaque, context))),
                                          Center(
                                              child: Text(getBoostKinsect(
                                                  k.bonusKinsect, context)))
                                        ]),
                                    Center(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                          Text(getTypeKinsect(
                                              k.typeKinsect[0], context)),
                                          if (k.typeKinsect.length > 1)
                                            Center(
                                                child: Text(k.typeKinsect
                                                            .length >
                                                        1
                                                    ? getTypeKinsectSecondaire(
                                                            k.typeKinsect[1],
                                                            context) +
                                                        (k.typeKinsect.length >
                                                                2
                                                            ? " / ${getTypeKinsectSecondaire(k.typeKinsect[2], context)}"
                                                            : "")
                                                    : ""))
                                        ]))
                                  ]))));
                    }
                  }))
        ]));
  }
}
