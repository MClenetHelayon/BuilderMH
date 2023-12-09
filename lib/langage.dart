import 'loadscreen.dart';
import 'l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/app_state.dart';

class Language extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        return MaterialApp(
          title: 'Meta Lab',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: l10n.localDelegate,
          supportedLocales: l10n.support,
          locale: appState.currentLocale, // Utilisez la locale de l'AppState
          home: LoadScreen()
        );
      }
    );
  }
}