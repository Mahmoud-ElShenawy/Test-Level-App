import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:test_level_project/model/capture_result_model.dart';
import 'dart:ui' as ui;

Future<CaptureResultModel> captureImage(
  double pixelRatio,
  GlobalKey boundaryKey,
) async {
  final boundary =
      boundaryKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
  final image = await boundary.toImage(pixelRatio: pixelRatio);
  final data = await image.toByteData(format: ui.ImageByteFormat.png);
  return CaptureResultModel(
    data: data?.buffer.asUint8List(),
    width: image.width,
    height: image.height,
  );
}
