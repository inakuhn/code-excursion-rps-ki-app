import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:python_ki_app/data/game_move.dart';
import 'package:python_ki_app/ui/atom/rps_game_image.dart';
import 'package:python_ki_app/ui/atom/rps_navigation_button.dart';
import 'package:python_ki_app/ui/atom/rps_text.dart';
import 'package:python_ki_app/ui/screen/score_screen.dart';
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
          RPSText(
            text: widget.winnerName,
          ),
          Expanded(
            child: RPSGameImage(choice: widget.winnerGameMove),
          ),
          const RPSNavigationButton(
            buttonText: "Start new Game",
            routeName: WelcomeScreen.welcomeScreenRoute,
          ),
          /// TODO 📄 Aufgabe 7
          /// 🛠️ Füge einen RPSNavigationButton hinzu:
          // 🎯 Verknüpfe die Route: Setze die Route des Buttons auf die ScoreScreen.scoreRoute mit dem passenden routeName.
        ],
      ),
      backgroundColor: secondary,
    );
  }
}
