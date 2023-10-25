import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String getReculNorm(BuildContext context) {
  return AppLocalizations.of(context)!.lRecul;
}

String getReculG1(int lvl, int t, BuildContext context) {
  lvl += t;
  String vretour = AppLocalizations.of(context)!.aRecul;
  if (lvl >= 3) {
    vretour = AppLocalizations.of(context)!.lRecul;
  }
  return vretour;
}

String getReculG2(int lvl, int t, BuildContext context) {
  lvl += t;
  String vretour = AppLocalizations.of(context)!.hRecul;
  if (lvl >= 3) {
    vretour = AppLocalizations.of(context)!.aRecul;
  }
  if (lvl >= 4) {
    vretour = AppLocalizations.of(context)!.lRecul;
  }
  return vretour;
}

String getReculG3(int lvl, int t, BuildContext context) {
  lvl += t;
  String vretour = AppLocalizations.of(context)!.hRecul;
  if (lvl >= 4) {
    vretour = AppLocalizations.of(context)!.aRecul;
  }
  if (lvl >= 5) {
    vretour = AppLocalizations.of(context)!.lRecul;
  }
  return vretour;
}

String getReculSoin(int lvl, int t, BuildContext context) {
  lvl += t;
  String vretour = AppLocalizations.of(context)!.hRecul;
  if (lvl >= 3) {
    vretour = AppLocalizations.of(context)!.aRecul;
  }
  if (lvl >= 5) {
    vretour = AppLocalizations.of(context)!.lRecul;
  }
  return vretour;
}

String getReculG4(int lvl, int t, BuildContext context) {
  lvl += t;
  String vretour = AppLocalizations.of(context)!.vhRecul;
  if (lvl >= 5) {
    vretour = AppLocalizations.of(context)!.hRecul;
  }
  if (lvl >= 6) {
    vretour = AppLocalizations.of(context)!.aRecul;
  }
  if (lvl >= 7) {
    vretour = AppLocalizations.of(context)!.lRecul;
  }
  return vretour;
}

String getReculFrag2(int lvl, int t, BuildContext context) {
  lvl += t;
  String vretour = AppLocalizations.of(context)!.vhRecul;
  if (lvl >= 4) {
    vretour = AppLocalizations.of(context)!.hRecul;
  }
  if (lvl >= 7) {
    vretour = AppLocalizations.of(context)!.aRecul;
  }
  return vretour;
}

String getReculG5(int lvl, int t, BuildContext context) {
  lvl += t;
  String vretour = AppLocalizations.of(context)!.vhRecul;
  if (lvl >= 3) {
    vretour = AppLocalizations.of(context)!.hRecul;
  }
  if (lvl >= 5) {
    vretour = AppLocalizations.of(context)!.aRecul;
  }
  if (lvl >= 6) {
    vretour = AppLocalizations.of(context)!.lRecul;
  }
  return vretour;
}

String getReculG6(int lvl, int t, BuildContext context) {
  lvl += t;
  String vretour = AppLocalizations.of(context)!.vhRecul;
  if (lvl >= 5) {
    vretour = AppLocalizations.of(context)!.hRecul;
  }
  if (lvl >= 7) {
    vretour = AppLocalizations.of(context)!.aRecul;
  }
  return vretour;
}
