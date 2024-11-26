import 'dart:math';

import 'package:python_ki_app/data/game_move.dart';

class GameSelection {
  GameMove? userSelection;
  GameMove computerSelection = generateComputerMove();

  GameSelection({this.userSelection});

  setUserSelection(GameMove userSelection) {
    this.userSelection = userSelection;
  }

  @override
  String toString() {
    return 'User: ${userSelection ?? "Not selected"}, Computer: ${computerSelection ?? "Not selected"}';
  }

  static GameMove generateComputerMove() {
    final randomIndex = Random().nextInt(GameMove.values.length);
    return GameMove.values[randomIndex];
  }
}
