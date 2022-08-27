class Player {
  static const x = "X";
  static const o = "O";
  static const empty = "";
}

class Game {
  static const boardlength = 9; //this would create a 3 by 3 blocks
  static const blocSize = 100.0;

  //creation of the empty board
  List<String>? board;

  static List<String>? initGameBoard() =>
      List.generate(boardlength, (index) => Player.empty);

  // builidng the winner check algorithm
  // we need to declare a scoreboard
  bool winnerCheck(
      String player, int index, List<int> scoreboard, int gridSize) {
    //declaration of row and column
    int row = index ~/ 3;
    int col = index % 3;
    int score = player == "X" ? 1 : -1;

    scoreboard[row] += score;
    scoreboard[gridSize + col] += score;
    if (row == col) scoreboard[2 * gridSize] += score;
    if (gridSize - 1 - col == row) scoreboard[2 * gridSize + 1] += score;

    if (scoreboard.contains(3) || scoreboard.contains(-3)) {
      return true;
    }
    // ignore: empty_statements
    ;
    return false;
  }
}
