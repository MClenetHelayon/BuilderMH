import 'package:flutter/material.dart';
import '../object/Stuff.dart';

class StuffProvider extends ChangeNotifier {
  Stuff? _stuff;

  Stuff? get stuff => _stuff;

  setStuff(Stuff newStuff) {
    _stuff = newStuff;
    notifyListeners();
  }

  
}
