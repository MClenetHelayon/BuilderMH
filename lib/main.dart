import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'langage.dart';

import 'provider/app_state.dart';
import 'provider/stuff_state.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppState()),
        ChangeNotifierProvider(create: (context) => StuffProvider()),
      ],
      child: Language(),
    ),
  );
}


