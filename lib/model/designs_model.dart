import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_level_project/db/constants.dart';

@immutable
class DesignsModel extends Equatable {
  final int? id;
  final String? designPath;
  final Uint8List? selectedImage;

  const DesignsModel({
    this.id,
    this.designPath,
    this.selectedImage,
  });

  Map<String, dynamic> toMap() => {
        columnID: id,
        columnDesignPath: designPath,
        columnSelectedImage: selectedImage,
      };

  factory DesignsModel.fromMap(Map<String, dynamic> map) {
    return DesignsModel(
      id: map[columnID],
      designPath: map[columnDesignPath],
      selectedImage: map[columnSelectedImage],
    );
  }

  @override
  List<Object?> get props => [
        id,
        designPath,
        selectedImage,
      ];
}
