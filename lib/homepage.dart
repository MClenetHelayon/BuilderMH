import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:screenshot/screenshot.dart';

import 'manager/exported/androidManager.dart';
import 'manager/exported/windowsManager.dart';

import 'object/Screen.dart';

import 'header-drawer.dart';

import 'pages/setting.dart';
import 'pages/equipement.dart';
import 'pages/info.dart';
import 'pages/exportedImage.dart' as expImg;
import 'provider/app_state.dart';
import 'provider/stuff_state.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Homepage();
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
    final stuffProvider = Provider.of<StuffProvider>(context, listen: false);
    final s = stuffProvider.stuff!;
    final screen = Screen(1100, 750, s, context);
    switch (currentPage) {
      case DrawerSections.equipement:
        container =
            expImg.buildCard(screen)
            //BuilderPage()
            ;
        break;
      case DrawerSections.parametres:
        container = SettingsPage(
          onLanguageChanged: (Locale newLocale) {
            Provider.of<AppState>(context, listen: false)
                .changeLanguage(newLocale);
          },
        );
        break;
      case DrawerSections.info:
        container = const InfoPage();
        break;
      default:
        container = const BuilderPage();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 50, 50, 5),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderDrawer(),
              DrawerList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget DrawerList() {
    return Container(
        padding: const EdgeInsets.only(
          top: 15,
        ),
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
                targetSize: Size(1100, 750), // Dimensions souhaitées de l'image
              );
              setState(() => this.bytes = bytes);

              //downloadImageWeb(bytes);
              //downloadImageWindows(bytes);
              await downloadImageAndroid(bytes);
              Navigator.of(context).pop();
              Fluttertoast.showToast(
                msg: "L'image a été téléchargé !",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
              );
            },
            child: Container(
              padding: const EdgeInsets.all(10.0),
              color: currentPage == DrawerSections.exporter
                  ? Colors.grey
                  : Colors.transparent,
              child: Row(
                children: [
                  const Expanded(
                    child: Icon(
                      Icons.image_outlined,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      AppLocalizations.of(context)!.buildcard,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          MenuItem(2, AppLocalizations.of(context)!.param, Icons.settings,
              currentPage == DrawerSections.parametres ? true : false),
          MenuItem(3, AppLocalizations.of(context)!.info, Icons.help,
              currentPage == DrawerSections.info ? true : false),
        ]));
  }

  Widget MenuItem(int id, String title, IconData icon, bool isActive) {
    return Material(
        color: isActive ? Colors.grey : Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
            setState(() {
              switch (id) {
                case 1:
                  currentPage = DrawerSections.equipement;
                  break;
                case 2:
                  currentPage = DrawerSections.parametres;
                  break;
                case 3:
                  currentPage = DrawerSections.info;
                  break;
              }
            });
          },
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(children: [
                Expanded(
                    child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                )),
                Expanded(
                    child: Text(
                  title,
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                )),
              ])),
        ));
  }
}

enum DrawerSections {
  equipement,
  exporter,
  parametres,
  info,
}
