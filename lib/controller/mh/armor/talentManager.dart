import 'package:builder_mhrs/controller/widget/printStatSimply.dart';
import 'package:flutter/material.dart';

talentIfHere(var value) {
  switch (value.talents.length) {
    case 0:
      return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [talent("Aucun Talent")]);
    case 1:
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        talent("${value.talents[0].name} +${value.talents[0].level}"),
      ]);
    case 2:
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        talent("${value.talents[0].name} +${value.talents[0].level}"),
        talent("${value.talents[1].name} +${value.talents[1].level}"),
      ]);
    case 3:
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            talent("${value.talents[0].name} +${value.talents[0].level}"),
            talent("${value.talents[1].name} +${value.talents[1].level}"),
          ]),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            talent("${value.talents[2].name} +${value.talents[2].level}"),
          ])
        ],
      );
    case 4:
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          talent("${value.talents[0].name} +${value.talents[0].level}"),
          talent("${value.talents[1].name} +${value.talents[1].level}"),
        ]),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          talent("${value.talents[2].name} +${value.talents[2].level}"),
          talent("${value.talents[3].name} +${value.talents[3].level}"),
        ])
      ]);
    case 5:
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          talent("${value.talents[0].name} +${value.talents[0].level}"),
          talent("${value.talents[1].name} +${value.talents[1].level}"),
          talent("${value.talents[2].name} +${value.talents[2].level}"),
        ]),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          talent("${value.talents[3].name} +${value.talents[3].level}"),
          talent("${value.talents[4].name} +${value.talents[4].level}"),
        ])
      ]);
    default:
      return talent("Aucun Talent");
  }
}
