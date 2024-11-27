import 'package:python_ki_app/business/game/score_logic.dart';
import 'package:python_ki_app/data/game_move.dart';
import 'package:python_ki_app/data/game_selection.dart';
import 'package:python_ki_app/data/players.dart';

class GameLogic {
  final GameSelection gameSelection;
  final ScoreLogic scoreLogic;

  GameLogic({required this.scoreLogic, required this.gameSelection});

  /// TODO 📄 Aufgabe 1: 🧠Logik für winner()
  // 🔄 Füge die Logik hinzu, um zu bestimmen, wer gewinnt:
  // ✊ Stein schlägt Schere.
  // ✋ Papier schlägt Stein.
  // ✌️ Schere schlägt Papier.
  // 🤝 Unentschieden: Wenn die Spielzüge gleich sind, gib Players.tie zurück.
  // 🏅 Gib Players.player, Players.computer oder Players.tie zurück.
  Players winner() {
    if (gameSelection.computerSelection == gameSelection.userSelection) {
      return Players.tie;
    } else if (doesUserSteinSchlaegtComputerSchere() ||
        doesUserPapierSchlaegtComputerStein() ||
        doesUserSchereSchlaegtComputerPapier()) {
      return Players.player;
    }
    return Players.computer;
  }

  bool doesUserSteinSchlaegtComputerSchere() {
    return gameSelection.userSelection == GameMove.rock &&
        gameSelection.computerSelection == GameMove.scissors;
  }

  bool doesUserPapierSchlaegtComputerStein() {
    return gameSelection.userSelection == GameMove.paper &&
        gameSelection.computerSelection == GameMove.rock;
  }

  bool doesUserSchereSchlaegtComputerPapier() {
    return gameSelection.userSelection == GameMove.scissors &&
        gameSelection.computerSelection == GameMove.paper;
  }

  /// TODO 📄 Aufgabe 2: 📛 winnerName()
  // 🎯 Passe die Methode an, damit sie den Namen des Gewinners basierend auf winner() zurückgibt:
  // 🎉 Wenn Spieler gewinnt: Gib "Player" zurück.
  // 🤖 Wenn Computer gewinnt: Gib "Computer" zurück.
  // 🤝 Bei Unentschieden: Gib "Tie" zurück.
  String winnerName() {
    switch (winner()) {
      case Players.computer:
        return "Computer";
      case Players.player:
        return "Player";
      case Players.tie:
        return "Tie";
    }
  }

  /// TODO 📄 Aufgabe 3: 🎲 winnerGameMove()
  // 🎯 Passe die Methode an, damit sie den Spielzug des Gewinners auf Basis von winner() zurückgibt:
  // 🧩 Wenn winner() Players.player zurückgibt: Gib gameSelection.userSelection zurück.
  // 🖥️ Wenn winner() Players.computer zurückgibt: Gib gameSelection.computerSelection zurück.
  // 🤝 Bei Unentschieden: Gib einen der Spielzüge zurück (z. B. gameSelection.userSelection).
  GameMove winnerGameMove() {
    switch (winner()) {
      case Players.computer:
        return gameSelection.computerSelection;
      case Players.player:
        return gameSelection.userSelection!;
      case Players.tie:
        return gameSelection.computerSelection;
    }
  }

  /// 📥 userSelection(): Speichert die Auswahl des Spielers.
  userSelection(GameMove gameMove) {
    gameSelection
        .setUserSelection(gameMove); //Speichert die Auswahl des Spielers.
  }
}
