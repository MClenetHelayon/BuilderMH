import 'package:builder_mhrs/manager/color/colorManager.dart';
import 'package:builder_mhrs/manager/img/general.dart';
import 'package:builder_mhrs/provider/stuff_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/dataloader.dart';
import 'homepage.dart';

class LoadScreen extends StatefulWidget {
  @override
  _LoadScreen createState() => _LoadScreen();
}

class _LoadScreen extends State<LoadScreen> {
  double _progress =
      0.0; // Pourcentage de progression de la barre de chargement
  @override
  void initState() {
    super.initState();
    _loadDataAndNavigate();
  }

  Future<void> _loadDataAndNavigate() async {
    final stuffProvider = Provider.of<StuffProvider>(context, listen: false);
    if (stuffProvider.stuff == null) {
      await loadArmorData(context);
    }
    for (int i = 0; i <= 100; i++) {
      await Future.delayed(const Duration(milliseconds: 10));
      setState(() {
        _progress = i / 100; // Mise à jour du pourcentage de progression
      });
    }

    await Future.delayed(
        const Duration(milliseconds: 90)); // Attendre 2 secondes

    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => App()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: secondary,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(logo,
                  height: 200, width: 200), // Remplacez par votre image
              const SizedBox(height: 20),
              LinearProgressIndicator(value: _progress) // Barre de chargement
            ])));
  }
}
