enum GameMove {
  rock,
  paper,
  scissors;
}

GameMove stringToGameMove(String input) {
  return GameMove.values.firstWhere(
    (e) => e.name.toLowerCase() == input.toLowerCase(),
  );
}
