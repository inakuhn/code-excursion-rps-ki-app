import 'package:flutter/material.dart';

class RSPTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Color backgroundColor;
  final TextStyle? titleStyle;

  const RSPTopBar({
    super.key,
    required this.title,
    this.actions,
    this.backgroundColor = Colors.blue,
    this.titleStyle,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56.0); // Standard AppBar height

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      title: Text(
        title,
        style: titleStyle ?? Theme.of(context).textTheme.bodyLarge,
      ),
      actions: actions,
    );
  }
}
