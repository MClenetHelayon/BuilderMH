import 'package:builder_mhrs/object/Armure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../colorManager.dart';
import '../textManager.dart';

Widget getCardArmorPopup(Armure armor, BuildContext context) {
  return Card(
      margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
      child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(getFourth()),
          ),
          onPressed: () {
            Navigator.of(context).pop(armor);
          },
          child: ListTile(
              title:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(armor.name,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ]),
              subtitle: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Column(children: [
                    Text(AppLocalizations.of(context)!.joyau),
                    slotJowel(armor.slots)
                  ])
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Column(children: [
                    Text(AppLocalizations.of(context)!.talent),
                    for (int i = 0; i < 4; i++)
                      if (armor.talents.length > i)
                        Text(
                            '${armor.talents[i].name} + ${armor.talents[i].level}'),
                  ])
                ])
              ]))));
}
