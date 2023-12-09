import 'package:builder_mhrs/controller/img/imgManager.dart';
import 'package:builder_mhrs/controller/text/color.dart';
import 'package:builder_mhrs/controller/widget/printStatSimply.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String convertCalamName(String id, BuildContext context) {
  String vretour = "";
  switch (id) {
    case "all":
      vretour = AppLocalizations.of(context)!.all;
      break;
    case "1":
      vretour = slotCalam(1);
      break;
    case "2":
      vretour = slotCalam(2);
      break;
    case "3":
      vretour = slotCalam(3);
      break;
  }
  return vretour;
}

Widget getCalamForCombo(String id, BuildContext context) {
  Widget vretour = const Text('');
  if (id == "all") {
    vretour = black(convertCalamName(id, context));
  } else {
    vretour = statComboCalam(convertCalamName(id, context));
  }
  return vretour;
}
