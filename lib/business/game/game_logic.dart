import 'dart:math';

import 'package:python_ki_app/data/game_move.dart';
import 'package:python_ki_app/data/game_selection.dart';

class GameLogic {
  final gameSelection =
      GameSelection(computerSelection: generateComputerMove());

  static GameMove generateComputerMove() {
    final randomIndex = Random().nextInt(GameMove.values.length);
    return GameMove.values[randomIndex];
  }

  userSelection(GameMove gameMove) {
    gameSelection.setUserSelection(gameMove);
  }

  String winnerName() {
    return "Computer";
  }

  GameMove winnerGameMove() {
    return gameSelection.computerSelection;
  }
}
