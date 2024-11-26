
import 'package:flutter/material.dart';

class RPSText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const RPSText({
    super.key,
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          Theme.of(context)
              .textTheme
              .displayLarge
              ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
    );
  }
}