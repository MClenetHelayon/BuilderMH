import 'package:builder_mhrs/manager/color/colorManager.dart';
import 'package:builder_mhrs/manager/text/color.dart';
import 'package:builder_mhrs/object/Stuff.dart';
import 'package:builder_mhrs/object/Talent.dart';
import 'package:builder_mhrs/provider/stuff_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class BoostPage extends StatefulWidget {
  const BoostPage({Key? key}) : super(key: key);

  @override
  State<BoostPage> createState() => _BoostPageState();
}

class _BoostPageState extends State<BoostPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final stuffProvider = Provider.of<StuffProvider>(context, listen: false);
    Stuff s = stuffProvider.stuff!;
    return Scaffold(
        backgroundColor: getSecondary(),
        body: Column(children: [
          Card(
              margin: const EdgeInsets.all(5),
              color: getPrimary(),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [boldOrange(AppLocalizations.of(context)!.boost)])),
          Card(
              color: getPrimary(),
              child: Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(s.getAllTalents().entries.length,
                          (index) {
                        Talent t =
                            s.getAllTalents().entries.elementAt(index).key;
                        return Card(
                            color: getThird(),
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    t.invertActif();
                                  });
                                },
                                child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: getThird()),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              margin: const EdgeInsets.all(5),
                                              child: black(t.name)),
                                          Card(
                                              color: getFifth(),
                                              margin: const EdgeInsets.all(5),
                                              child: Container(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: boldBlack(
                                                      t.actif ? "On" : "Off")))
                                        ]))));
                      }))))
        ]));
  }
}
