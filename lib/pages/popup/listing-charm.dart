import 'dart:async';
import 'dart:convert';
import 'package:builder_mhrs/manager/color/colorManager.dart';
import 'package:builder_mhrs/manager/text/color.dart';
import 'package:builder_mhrs/manager/widget/cardListManager.dart';
import 'package:builder_mhrs/manager/widget/filter/getCombobox.dart';
import 'package:builder_mhrs/object/Stuff.dart';
import 'package:builder_mhrs/object/Talent.dart';
import 'package:builder_mhrs/object/armor/Talisman.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ListViewScreen extends StatefulWidget {
  final Talisman t;

  const ListViewScreen(
    this.t, {
    Key? key,
  }) : super(key: key);

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  int talentIndex1 = 0,
      talentLevel1 = 0,
      talentIndex2 = 0,
      talentLevel2 = 0,
      slot1 = 0,
      slot2 = 0,
      slot3 = 0;
  bool talent2Active = false, slot1Active = false, slot2Active = false;
  List<Talent> lskill = [];

  @override
  void initState() {
    super.initState();
    loadSkill();
  }

  Future<void> loadSkill() async {
    Talisman t = widget.t;
    String skillJsonText =
        await rootBundle.loadString('database/mhrs/skill.json');
    List<dynamic> skillList = json.decode(skillJsonText);
    setState(() {
      lskill.add(Talent.getBase());
      for (Map<String, dynamic> skill in skillList) {
        if (Talent.getJson(skill, Stuff.local).talisman) {
          lskill.add(Talent.getJson(skill, Stuff.local));
        }
      }
      if (t.slots.isNotEmpty) {
        slot1 = t.slots[0];
        if (t.slots[1] != 0) {
          slot1Active = true;
          slot2 = t.slots[1];
        }
        if (t.slots[2] != 0) {
          slot3 = t.slots[2];
          slot2Active = true;
        }
      }

      if (t.talents.isNotEmpty) {
        for (int i = 0; i < lskill.length; i++) {
          if (lskill[i].id == t.talents[0].id) {
            talentIndex1 = i;
            talentLevel1 = t.talents[0].level;
          }
          if (t.talents.length == 2) {
            talent2Active = true;
            if (lskill[i].id == t.talents[1].id) {
              talentIndex2 = i;
              talentLevel2 = t.talents[1].level;
            }
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: secondary,
        child: Column(children: [
          getCardCharmTalent(
              1,
              lskill,
              talentIndex1,
              talentLevel1,
              0,
              context,
              (newValue) => setState(() {
                    talentIndex1 = newValue!;
                    if (talentIndex1 != 0) {
                      talentLevel1 = lskill[(talentIndex1)].levelMax;
                      talent2Active = true;
                    } else {
                      talentLevel1 = 0;
                      talent2Active = false;
                    }
                  }),
              (newValue) => setState(() => talentLevel1 = newValue!)),
          if (talent2Active)
            getCardCharmTalent(
                2,
                lskill,
                talentIndex2,
                talentLevel2,
                talentIndex1,
                context,
                (newValue) => setState(() {
                      talentIndex2 = newValue!;
                      if (talentIndex2 != -1) {
                        talentLevel2 = lskill[(talentIndex2)].levelMax;
                      } else {
                        talentLevel2 = 0;
                      }
                    }),
                (newValue) => setState(() => talentLevel2 = newValue!)),
          Card(
              color: fourth,
              child: Column(children: [
                boldBlack(AppLocalizations.of(context)!.slots),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      comboCharmSlotLvl(
                          slot1,
                          4,
                          (newValue) => setState(() {
                                slot1 = newValue!;
                                if (slot1 != 0) {
                                  slot1Active = true;
                                } else {
                                  slot1Active = false;
                                  slot2 = 0;
                                  slot3 = 0;
                                }
                              })),
                      if (slot1Active)
                        comboCharmSlotLvl(
                            slot2,
                            slot1,
                            (newValue) => setState(() {
                                  slot2 = newValue!;
                                  if (slot2 != 0) {
                                    slot2Active = true;
                                  } else {
                                    slot2Active = false;
                                    slot3 = 0;
                                  }
                                })),
                      if (slot1Active && slot2Active)
                        comboCharmSlotLvl(slot3, slot2,
                            (newValue) => setState(() => slot3 = newValue!))
                    ])
              ])),
          TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(fourth)),
              onPressed: () {
                List<Talent> list = [];
                if (talentIndex1 != 0) {
                  list.add(
                      Talent.getTalent(lskill[talentIndex1], talentLevel1));
                }
                if (talentIndex2 != 0 && talent2Active) {
                  list.add(
                      Talent.getTalent(lskill[talentIndex2], talentLevel2));
                }
                Talisman t = Talisman(list, [slot1, slot2, slot3]);
                Navigator.of(context).pop(t);
              },
              child: boldOrange(AppLocalizations.of(context)!.valider)),
        ]));
  }
}
