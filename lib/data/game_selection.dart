
import 'package:python_ki_app/data/game_move.dart';

class GameSelection {
  GameMove? userSelection;
  GameMove computerSelection;

  GameSelection({this.userSelection, required this.computerSelection});

  setUserSelection(GameMove userSelection) {
    this.userSelection = userSelection;
  }

  @override
  String toString() {
    return 'User: ${userSelection ?? "Not selected"}, Computer: ${computerSelection ?? "Not selected"}';
  }
}
