import 'package:builder_mhrs/manager/color/colorManager.dart';
import 'package:builder_mhrs/manager/mh/statManager.dart';
import 'package:builder_mhrs/manager/mh/weapon/ammoManager.dart';
import 'package:builder_mhrs/object/Stuff.dart';
import 'package:builder_mhrs/object/weapon/Arc.dart';
import 'package:builder_mhrs/object/weapon/Arme.dart';
import 'package:builder_mhrs/object/weapon/tranchant/CornedeChasse.dart';
import 'package:builder_mhrs/object/weapon/tranchant/Insectoglaive.dart';
import 'package:builder_mhrs/provider/stuff_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class StatDrawer extends StatefulWidget {
  const StatDrawer({Key? key}) : super(key: key);

  @override
  State<StatDrawer> createState() => _StatDrawerState();
}

class _StatDrawerState extends State<StatDrawer> {
  @override
  initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
        overlays: [SystemUiOverlay.bottom]);
  }

  @override
  Widget build(BuildContext context) {
    final stuffProvider = Provider.of<StuffProvider>(context, listen: false);
    Stuff s = stuffProvider.stuff!;
    return Container(
        color: secondary,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          g(s, context),
          if (s.weapon.niveau == "maitre") calamJowel(s, context),
          recapTalent(s, context),
          if (s.weapon is Arc) gArc(s, context),
          if (s.weapon is CorneDeChasse)
            Card(
                margin: const EdgeInsets.all(5),
                color: primary,
                child: simplyMusic(s.weapon as CorneDeChasse, context, false)),
          if (s.weapon is Insectoglaive && s.kinsect.id != 9999)
            gKinsect(s, context),
          if (s.weapon is Fusarbalete) getPrintBarreAmmo(s, context)
        ]));
  }
}
