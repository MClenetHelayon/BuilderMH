import 'package:builder_mhrs/manager/colorManager.dart';
import 'package:builder_mhrs/manager/weapon/ammoManager.dart';
import 'package:builder_mhrs/object/Stuff.dart';
import 'package:builder_mhrs/object/weapon/Arme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'manager/statManager.dart';
import 'object/weapon/Arc.dart';
import 'object/weapon/tranchant/CornedeChasse.dart';
import 'object/weapon/tranchant/Insectoglaive.dart';
import 'provider/stuff_state.dart';

class StatDrawer extends StatefulWidget {
  const StatDrawer({Key? key}) : super(key: key);

  @override
  State<StatDrawer> createState() => _StatDrawerState();
}

class _StatDrawerState extends State<StatDrawer> {
  @override
  Widget build(BuildContext context) {
    final stuffProvider = Provider.of<StuffProvider>(context, listen: false);
    Stuff s = stuffProvider.stuff!;
    return Container(
        color: getSecondary(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          g(s, context),
          if (s.weapon.niveau == "maitre") calamJowel(s, context),
          recapTalent(s, context),
          if (s.weapon is Arc) gArc(s, context),
          if (s.weapon is CorneDeChasse) gCorne(s, context),
          if (s.weapon is Insectoglaive && s.kinsect.id != 9999)
            gKinsect(s, context),
          if (s.weapon is Fusarbalete) getPrintBarreAmmo(s, context)
        ]));
  }
}
