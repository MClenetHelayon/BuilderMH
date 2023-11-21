import 'package:flutter/material.dart';

import '../color/colorManager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget getSearchBar(TextEditingController tc, BuildContext context,
    Function(String) searchFilter) {
  return Card(
      color: getThird(),
      margin: const EdgeInsets.all(2),
      child: TextField(
          controller: tc,
          decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.search,
              prefixIcon: const Icon(Icons.search)),
          onChanged: (query) => searchFilter(query)));
}
