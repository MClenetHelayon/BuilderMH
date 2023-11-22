import 'package:builder_mhrs/manager/color/colorManager.dart';
import 'package:builder_mhrs/object/weapon/Arme.dart';
import 'package:builder_mhrs/object/weapon/tranchant/Lancecanon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ListViewScreen extends StatefulWidget {
  final Arme w;
  const ListViewScreen(
    this.w, {
    Key? key,
  }) : super(key: key);

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  @override
  Widget build(BuildContext context) {
    Arme w = widget.w;
    return Card(
        color: getSecondary(),
        child: Column(children: [
          Card(
              color: getThird(),
              child: Column(children: [
                Center(
                    child: Text(AppLocalizations.of(context)!.recap,
                        style: const TextStyle(fontWeight: FontWeight.bold))),
                const Divider(color: Colors.black),
              ])),
          Card(
              color: getThird(),
              child: Column(children: [
                Center(
                    child: Text(AppLocalizations.of(context)!.slot,
                        style: const TextStyle(fontWeight: FontWeight.bold))),
                const Divider(color: Colors.black),
              ])),
          Card(
              color: getPrimary(),
              child: Column(children: [
                Card(
                    color: getThird(),
                    child: Column(children: [
                      Center(
                          child: Text(AppLocalizations.of(context)!.tSlot,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold))),
                      const Divider(color: Colors.black),
                    ])),
                Card(
                    color: getThird(),
                    child: Column(children: [
                      Center(
                          child: Text(AppLocalizations.of(context)!.tAttack,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold))),
                      const Divider(color: Colors.black),
                    ])),
                Card(
                    color: getThird(),
                    child: Column(children: [
                      Center(
                          child: Text(AppLocalizations.of(context)!.tAffinite,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold))),
                      const Divider(color: Colors.black),
                    ])),
                if (w.element != 0 && w.element >= 5)
                  Card(
                      color: getThird(),
                      child: Column(children: [
                        Center(
                            child: Text(AppLocalizations.of(context)!.tElement,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold))),
                        const Divider(color: Colors.black),
                      ])),
                if (w.element != 0 && w.element <= 6)
                  Card(
                      color: getThird(),
                      child: Column(children: [
                        Center(
                            child: Text(
                                AppLocalizations.of(context)!.tAffliction,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold))),
                        const Divider(color: Colors.black),
                      ])),
                if (w is Lancecanon)
                  Card(
                      color: getThird(),
                      child: Column(children: [
                        Center(
                            child: Text(AppLocalizations.of(context)!.tShelling,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold))),
                        const Divider(color: Colors.black),
                      ])),
                if (w is Tranchant)
                  Card(
                      color: getThird(),
                      child: Column(children: [
                        Center(
                            child: Text(AppLocalizations.of(context)!.tSharp,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold))),
                        const Divider(color: Colors.black),
                      ])),
                Card(
                    color: getThird(),
                    child: Column(children: [
                      Center(
                          child: Text(AppLocalizations.of(context)!.tCalam,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold))),
                      const Divider(color: Colors.black),
                    ])),
              ]))
        ]));
  }
}
