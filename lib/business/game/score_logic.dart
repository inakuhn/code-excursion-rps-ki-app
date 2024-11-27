import 'package:python_ki_app/data/score.dart';

class ScoreLogic {
  final Score score;

  ScoreLogic({required this.score});

  /// TODO 📄 Aufgabe 4: playerWins()
  /// 🔹 Logik hinzufügen: Erhöhe playerScore in score.
  playerWins() {
    score.playerScore++;
  }
  /// TODO 📄 Aufgabe 5: computerWins()
  /// 🔹 Logik hinzufügen: Erhöhe computerScore in score.
  computerWins() {
    score.computerScore++;
  }


  /// TODO 📄 Aufgabe 6: resetScores()
  // 🔹 Logik hinzufügen: Setze beide Punktestände (playerScore und computerScore) auf 0.
  resetScores() {

  }
}
