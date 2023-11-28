import 'package:builder_mhrs/object/Stuff.dart';
import 'package:flutter/material.dart';

class Screen {
  late double width;
  late double height;
  late Stuff stuff;
  late BuildContext context;
  Screen(this.width, this.height, this.stuff, this.context);
}
