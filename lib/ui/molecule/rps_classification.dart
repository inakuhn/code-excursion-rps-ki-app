import 'package:flutter/material.dart';
import 'package:python_ki_app/data/game_move.dart';

class RPSClassification extends StatelessWidget implements PreferredSizeWidget {
  final Map<GameMove, double>? classification;

  const RPSClassification({
    super.key,
    this.classification,
  });

  @override
  Size get preferredSize =>
      const Size.fromHeight(56.0); // Standard AppBar height

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (classification != null)
          ...(classification!.entries.toList()
                ..sort(
                  (a, b) => a.value.compareTo(b.value),
                ))
              .reversed
              .take(3)
              .map(
                (e) => Container(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  color: Theme.of(context).colorScheme.primary,
                  child: Row(
                    children: [
                      Text(
                        e.key.name,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary),
                      ),
                      const Spacer(),
                      Text(
                        e.value.toStringAsFixed(2),
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary),
                      ),
                    ],
                  ),
                ),
              ),
      ],
    );
  }
}
