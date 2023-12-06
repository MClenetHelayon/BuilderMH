import 'package:builder_mhrs/controller/color/colorManager.dart';
import 'package:builder_mhrs/controller/text/color.dart';
import 'package:builder_mhrs/model/Screen.dart';
import 'package:builder_mhrs/model/weapon/Arme.dart';
import 'package:builder_mhrs/vue/page/boost.dart';
import 'package:builder_mhrs/vue/page/equipement.dart';
import 'package:builder_mhrs/vue/page/exportedImage.dart' as expImg;
import 'package:builder_mhrs/vue/page/info.dart';
import 'package:builder_mhrs/vue/menu/header-drawer.dart';
import 'package:builder_mhrs/vue/menu/stat-drawer.dart';
import 'package:builder_mhrs/vue/page/setting.dart';
import 'package:builder_mhrs/provider/app_state.dart';
import 'package:builder_mhrs/provider/stuff_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:screenshot/screenshot.dart';

import 'controller/exported/androidManager.dart';
import 'controller/exported/windowsManager.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Homepage();
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Uint8List? bytes;
  DrawerSections currentPage = DrawerSections.equipement;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget container;
    //la creation de l'objet screen n'est utile que pour debug l'image facilement
    final stuffProvider = Provider.of<StuffProvider>(context, listen: false);
    final s = stuffProvider.stuff!;
    final screen = Screen(1100, 750, s, context);
    //permet de definir la page en cours
    switch (currentPage) {
      //page principal, le builder
      case DrawerSections.equipement:
        container =
            //expImg.buildCard(screen);
            const BuilderPage();
        break;
      //page parametres, sert surtout pour chnager de langues
      case DrawerSections.parametres:
        container = SettingsPage(
            onLanguageChanged: (Locale newLocale) =>
                Provider.of<AppState>(context, listen: false)
                    .changeLanguage(newLocale));
        break;
      //page gestion des Talents / des boosts actif ou non
      case DrawerSections.boost:
        container = const BoostPage();
      //page info ... inutile pour l'instant je la converse qu'au cas ou elle servirai
      case DrawerSections.info:
        container = const InfoPage();
        break;
      default:
        container = const BuilderPage();
    }
    return Scaffold(
        appBar: AppBar(backgroundColor: fifth, actions: [
          //sert a créer le 2e drawer
          Builder(
              builder: (context) => IconButton(
                  iconSize: 80,
                  icon: white((AppLocalizations.of(context)!.stat)),
                  onPressed: () => Scaffold.of(context).openEndDrawer()))
        ]),
        body: container,
        drawer: Drawer(
            child: SingleChildScrollView(
                child: Column(children: [
          //facilite l'insertion de l'image
          const HeaderDrawer(),
          //liste tout les items du menu
          DrawerList(),
        ]))),
        endDrawer: const Drawer(
            backgroundColor: secondary,
            child: SingleChildScrollView(
                child: Column(children: [StatDrawer()]))));
  }

  Widget DrawerList() {
    return Container(
        padding: const EdgeInsets.only(top: 15),
        child: Column(children: [
          MenuItem(1, AppLocalizations.of(context)!.set, Icons.home,
              currentPage == DrawerSections.equipement ? true : false),
          InkWell(
              onTap: () async {
                final stuffProvider =
                    Provider.of<StuffProvider>(context, listen: false);
                final s = stuffProvider.stuff!;
                final screen = Screen(1100, 750, s, context);
                final controller = ScreenshotController();
                final bytes = await controller.captureFromWidget(
                  Material(child: expImg.buildCard(screen)),
                  pixelRatio: 3.0, // Facteur de mise à l'échelle de la capture
                  targetSize: s.weapon is Fusarbalete
                      ? const Size(1350, 800)
                      : const Size(
                          1100, 750), // Dimensions souhaitées de l'image
                );
                setState(() => this.bytes = bytes);

                //downloadImageWeb(bytes);
                //downloadImageWindows(bytes);
                await downloadImageAndroid(bytes);
                Navigator.of(context).pop();
                Fluttertoast.showToast(
                    msg: "L'image a été téléchargé !",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER);
              },
              child: Container(
                  padding: const EdgeInsets.all(10.0),
                  color: currentPage == DrawerSections.exporter
                      ? third
                      : Colors.transparent,
                  child: Row(children: [
                    const Expanded(
                        child: Icon(Icons.image_outlined,
                            size: 20, color: Colors.black)),
                    Expanded(
                        child: Text(AppLocalizations.of(context)!.buildcard,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16)))
                  ]))),
          MenuItem(2, AppLocalizations.of(context)!.boost, Icons.add,
              currentPage == DrawerSections.boost ? true : false),
          const Divider(color: Colors.black),
          MenuItem(3, AppLocalizations.of(context)!.param, Icons.settings,
              currentPage == DrawerSections.parametres ? true : false),
          MenuItem(4, AppLocalizations.of(context)!.info, Icons.help,
              currentPage == DrawerSections.info ? true : false),
        ]));
  }

  Widget MenuItem(int id, String title, IconData icon, bool isActive) {
    return Material(
        color: isActive ? third : Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
            setState(() {
              switch (id) {
                case 1:
                  currentPage = DrawerSections.equipement;
                  break;
                case 2:
                  currentPage = DrawerSections.boost;
                case 3:
                  currentPage = DrawerSections.parametres;
                  break;
                case 4:
                  currentPage = DrawerSections.info;
                  break;
              }
            });
          },
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(children: [
                Expanded(child: Icon(icon, size: 20, color: Colors.black)),
                Expanded(
                    child: Text(title,
                        style:
                            const TextStyle(color: secondary, fontSize: 16))),
              ])),
        ));
  }
}

enum DrawerSections {
  equipement,
  exporter,
  boost,
  parametres,
  info,
}
