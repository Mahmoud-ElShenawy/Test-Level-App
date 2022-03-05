import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class CaptureResultModel extends Equatable {
  final Uint8List? data;
  final int? width;
  final int? height;

  const CaptureResultModel({
    this.data,
    this.width,
    this.height,
  });

  @override
  List<Object?> get props => [
        data,
        width,
        height,
      ];
}
