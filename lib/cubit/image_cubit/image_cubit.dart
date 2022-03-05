import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:test_level_project/common/config/assets.dart';
import 'package:test_level_project/cubit/image_cubit/image_mixin.dart';
import 'package:test_level_project/di/di_imports.dart';
import 'package:test_level_project/model/capture_result_model.dart';
import 'package:test_level_project/util/capture_image.dart';

part 'image_state.dart';

@injectable
class ImageCubit extends Cubit<ImageState> with ImageMixin {
  ImageCubit() : super(CaptureImageInitial());

  XFile? _pickedImage;

  @override
  Future<Uint8List> getImage(double pixelRatio, GlobalKey boundaryKey) async {
    Uint8List image = Uint8List.fromList([]);
    try {
      emit(CaptureImageLoading());
      final data = await captureImage(pixelRatio, boundaryKey);
      emit(CaptureImageLoaded(image: data));
      return image = data.data!;
    } catch (e) {
      logger.e('Error to Get Captured Image: ${e.toString()}');
      emit(const ImageError(error: 'Sorry, Something wrong is happened'));
      return image;
    }
  }

  @override
  Future passImage(Uint8List? image) async {
    emit(CaptureImageLoaded(image: CaptureResultModel(data: image)));
  }

  @override
  Future pickImage() async {
    try {
      _pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
      emit(PickImageLoaded(_pickedImage?.path ?? ''));
    } catch (e) {
      logger.e('Error to Pick an Image: ${e.toString()}');
      emit(const ImageError(
          error: 'Sorry, Something wrong is happened when picking an image'));
    }
  }

}
