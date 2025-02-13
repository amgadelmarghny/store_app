import 'package:flutter/services.dart';
import 'dart:ui' as ui;

Future<Uint8List> getImageFromRowData(String image, double width) async {
    // load the image row data
    var imageData = await rootBundle.load(image);
    // to change image size and make butter (change data structure)
    var imageCodec = await ui.instantiateImageCodec(
      imageData.buffer.asUint8List(),
      targetHeight: width.round(),
    );
    // to returm image frame(image info) from codec
    var iamgeFrame = await imageCodec.getNextFrame();
    // to return row image with the editions and make it png
    var imageBytData =
        await iamgeFrame.image.toByteData(format: ui.ImageByteFormat.png);
    return imageBytData!.buffer.asUint8List();
  }