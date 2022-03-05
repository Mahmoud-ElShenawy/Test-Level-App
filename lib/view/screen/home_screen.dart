import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_level_project/common/routes/app_router_control.dart';
import 'package:test_level_project/common/routes/app_router_import.gr.dart';
import 'package:test_level_project/cubit/designs_cubit/designs_cubit.dart';
import 'package:test_level_project/view/custom_widget/action_button_extended_widget.dart';
import 'package:test_level_project/view/custom_widget/app_bar_widget.dart';
import 'package:test_level_project/view/widget/designs_list_widget.dart';

@immutable
class HomeScreen extends StatelessWidget {
  static const routeName = 'home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Home Screen',
        automaticallyImplyLeading: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ActionButtonExtendedWidget(
        label: 'Add New Design',
        icon: Icons.add,
        onPressed: () => routerPush(
          context: context,
          route: const CreateDesignRoute(),
        ),
      ),
      body: BlocBuilder<DesignsCubit, DesignsState>(
        buildWhen: (previous, current) =>
            previous != current && current is DesignsLoaded,
        builder: (context, state) {
          if (state is DesignsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is DesignsError) {
            return Center(
              child: Text(state.error),
            );
          } else if (state is DesignsLoaded) {
            return state.designs!.isNotEmpty
                ? DesignsListWidget(data: state.designs)
                : const Center(
                    child: Text('There is no designs'),
                  );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
