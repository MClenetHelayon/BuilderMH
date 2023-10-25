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
      color: const Color.fromARGB(255, 50, 50, 50),
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0, left: 20.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 0.0),
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage("images/logo.png"),),
              ),
            ),
            const SizedBox(height: 10,),
            const Text("Builder MHRS",style: TextStyle(color: Colors.white,fontSize: 20),),
            Text(AppLocalizations.of(context)!.creator,style: const TextStyle(color: Colors.grey,fontSize: 20),),
          ]
      ),
    );
  }
}
