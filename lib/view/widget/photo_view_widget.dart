import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:test_level_project/common/style/dimens.dart';
import 'package:test_level_project/model/capture_result_model.dart';

@immutable
class PhotoViewWidget extends HookWidget {
  final CaptureResultModel image;

  const PhotoViewWidget({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prevScale = useState(1.0);
    final scale = useState(1.0);
    return GestureDetector(
      // Zoom In & Out
      onScaleUpdate: (details) => scale.value = prevScale.value * details.scale,
      onScaleEnd: (_) => prevScale.value = scale.value,
      child: Container(
        margin: edgeInsetsAll(12),
        child: Transform.scale(
          scale: scale.value,
          child: Image.memory(
            image.data!,
            scale: MediaQuery.of(context).devicePixelRatio,
          ),
        ),
      ),
    );
  }
}
