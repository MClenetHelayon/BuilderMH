import 'package:builder_mhrs/manager/color/colorManager.dart';
import 'package:builder_mhrs/manager/img/simplyGeneral.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HeaderDrawer extends StatefulWidget {
  const HeaderDrawer({Key? key}) : super(key: key);

  @override
  State<HeaderDrawer> createState() => _HeaderDrawerState();
}

class _HeaderDrawerState extends State<HeaderDrawer> {
  @override
  initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
        overlays: [SystemUiOverlay.bottom]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: getSecondary(),
        width: double.infinity,
        height: 200,
        padding: const EdgeInsets.only(top: 20.0, left: 20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage(logo)))),
          const SizedBox(
            height: 10,
          ),
          Text("Builder MHRS",
              style: TextStyle(color: getFourth(), fontSize: 20)),
          Text(AppLocalizations.of(context)!.creator,
              style: TextStyle(color: getThird(), fontSize: 20)),
        ]));
  }
}
