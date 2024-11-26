import 'package:flutter/material.dart';

class RPSTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const RPSTopBar({
    super.key,
    required this.title,
    this.actions,
  });

  @override
  Size get preferredSize =>
      const Size.fromHeight(56.0); // Standard AppBar height

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
      ),
      actions: actions,
    );
  }
}
