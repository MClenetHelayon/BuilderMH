import 'package:builder_mhrs/manager/colorManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HeaderDrawer extends StatefulWidget {
  const HeaderDrawer({Key? key}) : super(key: key);

  @override
  State<HeaderDrawer> createState() => _HeaderDrawerState();
}

class _HeaderDrawerState extends State<HeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: getSecondary(),
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0, left: 20.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          margin: const EdgeInsets.only(bottom: 0.0),
          height: 100,
          width: 100,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage("images/logo.png"),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text("Builder MHRS",
            style: TextStyle(color: getFourth(), fontSize: 20)),
        Text(AppLocalizations.of(context)!.creator,
            style: TextStyle(color: getThird(), fontSize: 20)),
      ])
    );
  }
}
