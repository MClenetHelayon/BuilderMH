import 'package:builder_mhrs/manager/color/colorManager.dart';
import 'package:builder_mhrs/manager/text/color.dart';
import 'package:builder_mhrs/manager/text/slot.dart';
import 'package:builder_mhrs/manager/widget/filter/getCombobox.dart';
import 'package:builder_mhrs/object/Talent.dart';
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
                  child: boldBlack(armor.name)),
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
                            '${armor.talents[i].name} + ${armor.talents[i].level}')
                  ])
                ])
              ]))));
}
  Widget getCardCharmTalent(int i,List<Talent> lskill,int talentIndex,int talentLevel,int otherTalent,BuildContext context, Function(int?) onChanged1, Function(int?) onChanged2) {
    return  Card(
              color: fourth,
              child: Column(children: [
                boldBlack("${AppLocalizations.of(context)!.talent} $i"),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (lskill.isNotEmpty)
                        comboCharmSkill(lskill, talentIndex, true, otherTalent,onChanged1),
                      if (lskill.isNotEmpty)
                        comboCharmSkillLvl(talentIndex, talentLevel,onChanged2)
                    ])
              ]));
  }