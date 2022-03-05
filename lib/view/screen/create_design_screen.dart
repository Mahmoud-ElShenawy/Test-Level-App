import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_level_project/common/style/dimens.dart';
import 'package:test_level_project/common/routes/app_router_control.dart';
import 'package:test_level_project/common/routes/app_router_import.gr.dart';
import 'package:test_level_project/cubit/designs_cubit/designs_cubit.dart';
import 'package:test_level_project/cubit/image_cubit/image_cubit.dart';
import 'package:test_level_project/model/designs_model.dart';
import 'package:test_level_project/view/custom_widget/action_button_widget.dart';
import 'package:test_level_project/view/custom_widget/expandable_fab_widget.dart';
import 'package:test_level_project/view/widget/draggable_widget.dart';

@immutable
class CreateDesignScreen extends StatefulWidget {
  static const routeName = 'create_design';

  const CreateDesignScreen({Key? key}) : super(key: key);

  @override
  State<CreateDesignScreen> createState() => _CreateDesignScreenState();
}

class _CreateDesignScreenState extends State<CreateDesignScreen> {
  final _boundaryKey = GlobalKey();
  double? pixelRatio;

  @override
  void initState() {
    super.initState();
    // This callback is run during a frame, just after the persistent frame callbacks to solve a problem
    // This will be called only once and after build process is done
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) => pixelRatio = devicePixelRatio(context),
    );
  }

  String? pickedImage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ExpandableFabWidget(
        distance: 112.0,
        children: [
          Container(),
          ActionButton(
            onPressed: () => BlocProvider.of<ImageCubit>(context, listen: false)
                .getImage(pixelRatio!, _boundaryKey)
                .then(
              (value) {
                BlocProvider.of<DesignsCubit>(context, listen: false).saveData(
                  DesignsModel(
                    designPath: pickedImage,
                    selectedImage: value,
                  ),
                );
              },
            ),
            icon: const Icon(Icons.save),
          ),
          ActionButton(
            onPressed: () =>
                BlocProvider.of<ImageCubit>(context, listen: false).pickImage(),
            icon: const Icon(Icons.upload),
          ),
        ],
      ),
      body: DraggableWidget(
        child: BlocBuilder<ImageCubit, ImageState>(
          buildWhen: (previous, current) =>
              previous != current && current is PickImageLoaded,
          builder: (context, state) {
            if (state is PickImageLoaded) {
              pickedImage = state.imagePath;
              return Image.file(
                File(state.imagePath!),
                width: screenWidth(context) * 0.3,
                height: screenHeight(context) * 0.3,
              );
            } else {
              return Container();
            }
          },
        ),
        onEyePressed: () => BlocProvider.of<ImageCubit>(context, listen: false)
            .getImage(pixelRatio!, _boundaryKey)
            .then(
              (value) => routerPush(
                context: context,
                route: const PhotoViewRoute(),
              ),
            ),
        boundaryKey: _boundaryKey,
      ),
    );
  }
}
