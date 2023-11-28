import 'package:builder_mhrs/manager/color/colorManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BoostPage extends StatelessWidget {
  const BoostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: getSecondary(),
        body: Column(children: [
          Row(children: [Text(AppLocalizations.of(context)!.boost)])
        ]));
  }
}
