import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_level_project/common/routes/app_router_control.dart';
import 'package:test_level_project/common/routes/app_router_import.gr.dart';
import 'package:test_level_project/common/style/colors.dart';
import 'package:test_level_project/cubit/designs_cubit/designs_cubit.dart';
import 'package:test_level_project/cubit/image_cubit/image_cubit.dart';
import 'package:test_level_project/model/designs_model.dart';

@immutable
class DesignsListWidget extends StatelessWidget {
  final List<DesignsModel>? data;

  const DesignsListWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data?.length ?? 0,
      shrinkWrap: true,
      itemBuilder: (context, index) => Dismissible(
        key: UniqueKey(),
        background: Container(color: kRed),
        onDismissed: (direction) =>
            BlocProvider.of<DesignsCubit>(context, listen: false)
                .deleteDesign(data![index].id),
        child: Center(
          child: Stack(
            children: [
              Image.memory(
                data![index].selectedImage!,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
              PositionedDirectional(
                end: 5,
                top: 10,
                child: IconButton(
                  onPressed: () =>
                      BlocProvider.of<ImageCubit>(context, listen: false)
                          .passImage(data![index].selectedImage!)
                          .then(
                            (value) => routerPush(
                              context: context,
                              route: const PhotoViewRoute(),
                            ),
                          ),
                  icon: const Icon(Icons.visibility),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
