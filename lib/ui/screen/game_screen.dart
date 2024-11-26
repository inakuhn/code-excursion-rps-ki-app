import 'dart:math';

import 'package:flutter/material.dart';
import 'package:python_ki_app/data/game_move.dart';
import 'package:python_ki_app/ui/atom/game_image.dart';
import 'package:python_ki_app/ui/molecule/rps_top_bar.dart';
import 'package:python_ki_app/ui/screen/welcome_screen.dart';
import 'package:python_ki_app/ui/screen/winner_screen.dart';

class GameScreen extends StatefulWidget {
  static const String gameRoute = "/game_route";

  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    final playerChoice = ModalRoute.of(context)!.settings.arguments as GameMove;
    final random = Random();
    var choice = GameMove.values[random.nextInt(3)];
    return Scaffold(
      appBar: const RPSTopBar(title: "RPS App"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              child: Container(
                  color: Theme.of(context).colorScheme.secondary,
                  child: GameImage(
                    choice: playerChoice,
                  ))),
          Expanded(
              child: Container(
            color: Theme.of(context).colorScheme.primary,
            child: GameImage(
              choice: choice,
              shouldAnimate: true,
              onAnimationComplete: () async {
                await Navigator.of(context).popAndPushNamed(
                    WinnerScreen.winnerRoute, // The new route to push
                    arguments: {
                      WinnerScreen.winnerRPSArg: choice,
                      WinnerScreen.winnerPlayerArg: "Computer"
                    });
              },
            ),
          )),
        ],
      ),
    );
  }
}
