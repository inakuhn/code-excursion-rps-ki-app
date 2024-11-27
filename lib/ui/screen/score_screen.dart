import 'package:flutter/material.dart';
import 'package:python_ki_app/business/game/score_logic.dart';
import 'package:python_ki_app/data/score.dart';
import 'package:python_ki_app/ui/atom/rps_navigation_button.dart';
import 'package:python_ki_app/ui/atom/rps_text.dart';
import 'package:python_ki_app/ui/molecule/rps_top_bar.dart';
import 'package:python_ki_app/ui/screen/welcome_screen.dart';

class ScoreScreen extends StatefulWidget {
  static const String scoreRoute = "/score_route";
  final ScoreLogic scoreLogic;

  const ScoreScreen({super.key, required this.scoreLogic});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  void resetScores() {
    setState(() {
      widget.scoreLogic.resetScores();
    });
  }

  @override
  Widget build(BuildContext context) {
    var secondary = Theme.of(context).colorScheme.secondary;
    return Scaffold(
      appBar: const RPSTopBar(title: "Score"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// TODO 📄 Aufgabe 8.1 Füge RPSText hinzu, um den Punktestand des Spielers darzustellen.
          /// 🔍 Tipp: Nutze widget.scoreLogic.score.playerScore
          RPSText(
            text: "Player: ${widget.scoreLogic.score.playerScore}",
          ),

          /// TODO 📄 Aufgabe 8.2 Füge RPSText hinzu, um den Punktestand des des Computers darzustellen.
          /// widget.scoreLogic.score.computerScore
          RPSText(
            text: "Computer: ${widget.scoreLogic.score.computerScore}",
          ),
          ElevatedButton(
            onPressed: () {
              resetScores();
            },
            child: const Text("Reset Scores"),
          ),

          /// TODO 📄 Aufgabe 8.3 🎮 Navigation zu einem neuen Spiel:
          // 🔍 Tipp: Verwende RPSNavigationButton und setze die Route auf WelcomeScreen.welcomeScreenRoute.
        ],
      ),
      backgroundColor: secondary,
    );
  }
}
