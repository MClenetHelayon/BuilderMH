import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  Locale _currentLocale = const Locale('fr');
  Locale get currentLocale => _currentLocale;

  void changeLanguage(Locale newLocale) {
    _currentLocale = newLocale;
    notifyListeners();
  }
}
