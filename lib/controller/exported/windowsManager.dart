import 'dart:io';

import 'package:builder_mhrs/controller/text/util/name-image.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';

Future<void> downloadImageWindows(Uint8List imageUint8List) async {
  if (Platform.isWindows) {

    try {
      final appDocDir = await getApplicationDocumentsDirectory();

      final file = File('${appDocDir.path}/${nameImage()}');

      await file.writeAsBytes(imageUint8List);

      print('Image enregistrée localement : ${file.path}');
    } catch (e) {
      print('Erreur lors de l\'enregistrement de l\'image : $e');
    }
  }
}
