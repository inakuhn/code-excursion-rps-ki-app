import 'dart:math';

import 'package:python_ki_app/data/game_move.dart';
import 'package:python_ki_app/data/game_selection.dart';

class GameLogic {
  final gameSelection =
      GameSelection(userSelection: generateComputerMove(), computerSelection: generateComputerMove());

  static GameMove generateComputerMove() {
    final randomIndex = Random().nextInt(GameMove.values.length);
    return GameMove.values[randomIndex];
  }


}
