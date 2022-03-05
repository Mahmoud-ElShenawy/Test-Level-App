import 'dart:typed_data';

import 'package:flutter/material.dart';

mixin ImageMixin {
  Future<Uint8List> getImage(double pixelRatio, GlobalKey boundaryKey);

  Future passImage(Uint8List? image);

  Future pickImage();
}
