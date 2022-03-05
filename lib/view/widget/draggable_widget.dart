import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:test_level_project/common/config/assets.dart';
import 'package:test_level_project/common/style/dimens.dart';
import 'package:test_level_project/common/style/colors.dart';
import 'package:test_level_project/view/custom_widget/app_bar_widget.dart';

@immutable
class DraggableWidget extends HookWidget {
  final Widget? child;
  final Function()? onEyePressed;
  final GlobalKey? boundaryKey;

  const DraggableWidget({
    Key? key,
    required this.child,
    this.onEyePressed,
    this.boundaryKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initial Position
    final position = useState(
      Offset(
        screenWidth(context) * 0.35,
        screenHeight(context) * 0.4,
      ),
    );
    final prevScale = useState(1.0);
    final scale = useState(1.0);
    return GestureDetector(
      // Zoom In & Out
      onScaleUpdate: (details) => scale.value = prevScale.value * details.scale,
      onScaleEnd: (_) => prevScale.value = scale.value,
      child: Stack(
        children: [
          AppBarWidget(
            backgroundColor: kWhite,
            iconTheme: const IconThemeData(
              color: kBlack,
            ),
            automaticallyImplyLeading: true,
            actions: [
              IconButton(
                onPressed: onEyePressed,
                icon: const Icon(Icons.visibility),
              )
            ],
          ),
          RepaintBoundary(
            key: boundaryKey,
            child: Stack(
              children: [
                Positioned.fill(
                  top: 80,
                  child: Image.asset(
                    mugIMG,
                    fit: BoxFit.contain,
                  ),
                ),
                PositionedDirectional(
                  start: position.value.dx,
                  top: position.value.dy,
                  child: Draggable(
                    maxSimultaneousDrags: 1,
                    feedback: Transform.scale(
                      scale: scale.value,
                      child: child,
                    ),
                    childWhenDragging: Container(),
                    onDragEnd: (details) {
                      position.value = details.offset;
                    },
                    child: Transform.scale(
                      scale: scale.value,
                      child: child,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
