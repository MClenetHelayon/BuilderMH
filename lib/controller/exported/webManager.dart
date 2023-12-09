/*import 'package:flutter/services.dart';
import 'dart:html' as html;
import '../util/name-image.dart';

void downloadImageWeb(Uint8List imageUint8List) {
  if (html.window != null) {
    final blob = html.Blob([Uint8List.fromList(imageUint8List)]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..target = 'download'
      ..download = nameImage() // Nom du fichier de téléchargement
      ..click();
    html.Url.revokeObjectUrl(url);
  }
}*/
