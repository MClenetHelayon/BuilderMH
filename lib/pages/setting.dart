import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../loadscreen.dart';
import '../object/Stuff.dart';
import '../provider/app_state.dart';

class SettingsPage extends StatefulWidget {
  final Function(Locale) onLanguageChanged;

  const SettingsPage({Key? key, required this.onLanguageChanged})
      : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void _changeLanguage(Locale newLocale) {
    final appState = Provider.of<AppState>(context, listen: false);
    appState.changeLanguage(newLocale);

    _reloadAppWrapper(); // Rechargez l'écran d'accueil
  }

  Future<void> _reloadAppWrapper() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoadScreen()),
    );
  }

  final List<Map<String, dynamic>> _languageOptions = [
    {'code': 'fr', 'flag': '🇫🇷', 'name': 'Français'},
    {'code': 'en', 'flag': '🇺🇸', 'name': 'English'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.param),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Langue',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Consumer<AppState>(
              builder: (context, appState, child) {
                return DropdownButtonFormField<Map<String, dynamic>>(
                  value: _languageOptions.firstWhere((option) =>
                      option['code'] == appState.currentLocale.languageCode),
                  onChanged: (newValue) {
                    appState.changeLanguage(Locale(newValue!['code']));
                    Stuff.local = newValue['code'];
                    _changeLanguage(Locale(newValue['code']));
                  },
                  items: _languageOptions.map((option) {
                    return DropdownMenuItem<Map<String, dynamic>>(
                      value: option,
                      child: Row(
                        children: [
                          Image.asset('images/drapeau/${option['code']}.jpg',
                              width: 50, height: 50),
                          SizedBox(width: 8),
                          Text(option['name']),
                        ],
                      ),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 12,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
