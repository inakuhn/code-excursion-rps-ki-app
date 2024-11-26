import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:python_ki_app/data/game_move.dart';
import 'package:python_ki_app/ui/atom/game_image.dart';
import 'package:python_ki_app/ui/screen/welcome_screen.dart';

import '../molecule/rps_top_bar.dart';

class WinnerScreen extends StatefulWidget {
  static const String winnerRoute = "/winner_route";
  final String winnerName;
  final GameMove winnerGameMove;

  const WinnerScreen(
      {super.key, required this.winnerName, required this.winnerGameMove});

  @override
  State<WinnerScreen> createState() => _WinnerScreenState();
}

class _WinnerScreenState extends State<WinnerScreen> {
  @override
  Widget build(BuildContext context) {
    var secondary = Theme.of(context).colorScheme.secondary;
    return Scaffold(
      appBar: const RPSTopBar(title: "Winner"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            widget.winnerName,
            style: Theme.of(context)
                .textTheme
                .displayLarge
                ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
          ),
          Expanded(
            child: GameImage(choice: widget.winnerGameMove),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: OutlinedButton(
                onPressed: () async {
                  await Navigator.of(context).popAndPushNamed(
                    WelcomeScreen.welcomeScreenRoute, // The new route to push
                  );
                },
                child: const Text("Start Game")),
          ),
        ],
      ),
      backgroundColor: secondary,
    );
  }
}
