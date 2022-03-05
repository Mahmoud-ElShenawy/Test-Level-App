import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_level_project/common/style/colors.dart';
import 'package:test_level_project/cubit/image_cubit/image_cubit.dart';
import 'package:test_level_project/view/custom_widget/app_bar_widget.dart';
import 'package:test_level_project/view/widget/photo_view_widget.dart';

@immutable
class PhotoViewScreen extends StatelessWidget {
  static const routeName = 'photo_view';

  const PhotoViewScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      appBar: const AppBarWidget(
        backgroundColor: kBlack,
        automaticallyImplyLeading: true,
      ),
      body: BlocBuilder<ImageCubit, ImageState>(
        builder: (context, state) {
          if (state is CaptureImageLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ImageError) {
            return Center(
              child: Text(state.error),
            );
          } else if (state is CaptureImageLoaded) {
            return PhotoViewWidget(image: state.image!);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
