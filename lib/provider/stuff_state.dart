import 'package:builder_mhrs/model/Stuff.dart';
import 'package:flutter/material.dart';

class StuffProvider extends ChangeNotifier {
  Stuff? _stuff;

  Stuff? get stuff => _stuff;

  setStuff(Stuff newStuff) {
    _stuff = newStuff;
    notifyListeners();
  }

  
}
