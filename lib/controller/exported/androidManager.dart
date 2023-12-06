import 'dart:typed_data';
import 'package:image_gallery_saver/image_gallery_saver.dart';

Future<void> downloadImageAndroid(Uint8List imageUint8List) async {
  await ImageGallerySaver.saveImage(
    Uint8List.fromList(imageUint8List),
    quality: 100,
  );
}
