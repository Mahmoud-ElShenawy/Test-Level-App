import 'package:flutter/material.dart';

@immutable
class ActionButtonExtendedWidget extends StatelessWidget {
  final Function()? onPressed;
  final String? label;
  final IconData? icon;

  const ActionButtonExtendedWidget({
    Key? key,
    required this.onPressed,
    required this.label,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      label: Text(label!),
      icon: Icon(icon),
    );
  }
}
