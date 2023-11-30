import 'package:builder_mhrs/manager/color/colorManager.dart';
import 'package:builder_mhrs/manager/text/slot.dart';
import 'package:builder_mhrs/object/armor/Armure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget getCardArmorPopup(Armure armor, BuildContext context) {
  return Card(
      margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
      child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(fourth)),
          onPressed: () {
            Navigator.of(context).pop(armor);
          },
          child: ListTile(
              title: Center(
                  child: Text(armor.name,
                      style: const TextStyle(fontWeight: FontWeight.bold))),
              subtitle: Column(children: [
                Column(children: [
                  Text(AppLocalizations.of(context)!.joyau),
                  Center(child: slotJowel(armor.slots))
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
