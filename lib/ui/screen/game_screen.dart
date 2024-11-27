import 'package:flutter/material.dart';
import 'package:python_ki_app/business/game/game_logic.dart';
import 'package:python_ki_app/data/game_selection.dart';
import 'package:python_ki_app/ui/atom/rps_game_image.dart';
import 'package:python_ki_app/ui/molecule/rps_top_bar.dart';
import 'package:python_ki_app/ui/screen/winner_screen.dart';

class GameScreen extends StatefulWidget {
  static const String gameRoute = "/game_route";
  final GameSelection gameSelection;

  const GameScreen({super.key, required this.gameSelection});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RPSTopBar(title: "RPS App"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              child: Container(
                  color: Theme.of(context).colorScheme.secondary,
                  child: RPSGameImage(
                    choice: widget.gameSelection.userSelection!,
                  ))),
          Expanded(
              child: Container(
            color: Theme.of(context).colorScheme.primary,
            child: RPSGameImage(
              choice: widget.gameSelection.computerSelection,
              shouldRandomAnimate: true,
              onAnimationComplete: () async {
                await Navigator.of(context).popAndPushNamed(
                  WinnerScreen.winnerRoute, // The new route to push
                );
              },
            ),
          )),
        ],
      ),
    );
  }
}
