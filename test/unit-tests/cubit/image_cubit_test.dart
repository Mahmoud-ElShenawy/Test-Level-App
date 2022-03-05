import 'dart:typed_data';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_level_project/cubit/image_cubit/image_cubit.dart';
import 'package:test_level_project/model/capture_result_model.dart';

void main() {
  late ImageCubit imageCubit;

  final Uint8List image = Uint8List.fromList([1, 2, 3, 4, 5]);

  setUp(() {
    // Create Cubit Object
    imageCubit = ImageCubit();
  });

  blocTest<ImageCubit, ImageState>(
    'Pass Image',
    build: () => imageCubit,
    act: (cubit) => cubit.passImage(image),
    expect: () => [
      CaptureImageLoaded(image: CaptureResultModel(data: image)),
    ],
  );
}
