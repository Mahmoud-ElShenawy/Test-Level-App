import 'package:flutter/material.dart';

@immutable
class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  final bool? automaticallyImplyLeading;
  final Color? backgroundColor;
  final List<Widget>? actions;
  final IconThemeData? iconTheme;

  const AppBarWidget({
    Key? key,
    this.title = '',
    this.automaticallyImplyLeading = false,
    this.backgroundColor,
    this.actions,
    this.iconTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title!),
      automaticallyImplyLeading: automaticallyImplyLeading!,
      backgroundColor: backgroundColor,
      actions: actions,
      iconTheme: iconTheme,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
