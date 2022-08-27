import 'package:flutter/material.dart';
import 'package:three_games/games/pickgames_page,.dart';
import 'package:three_games/games/tic_tac_toe_game/game_data.dart';
import 'package:three_games/utilities/color.dart';

class TicTactoeGameScreen extends StatefulWidget {
  const TicTactoeGameScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TicTactoeGameScreenState createState() => _TicTactoeGameScreenState();
}

class _TicTactoeGameScreenState extends State<TicTactoeGameScreen> {
  //adding the necessary variables
  String lastValue = "X";
  bool gameOver = false;
  int turn = 0; // to check the draw
  String result = "";
  List<int> scoreboard = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  ]; //the score are for the different combination of the game [Row1,2,3, Col1,2,3, Diagonal1,2];
  //let's declare a new Game components

  Game game = Game();

  //let's initi the GameBoard
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    game.board = Game.initGameBoard();
    print(game.board);
  }

  @override
  Widget build(BuildContext context) {
    double boardWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: MainColor.primaryColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 1,
          centerTitle: true,
          title: const Text(
            'Tc-Tac-Toe',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PickGamePage()));
            },
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "It's $lastValue turn".toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 58,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            //now we will make the game board
            //but first we will create a Game class that will contains all the data and method that we will need
            SizedBox(
              width: boardWidth,
              height: boardWidth,
              child: GridView.count(
                crossAxisCount: Game.boardlength ~/
                    3, // the ~/ operator allows you to evide to integer and return an Int as a result
                padding: const EdgeInsets.all(16.0),
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                children: List.generate(Game.boardlength, (index) {
                  return InkWell(
                    onTap: gameOver
                        ? null
                        : () {
                            //when we click we need to add the new value to the board and refrech the screen
                            //we need also to toggle the player
                            //now we need to apply the click only if the field is empty
                            //now let's create a button to repeat the game

                            if (game.board![index] == "") {
                              setState(() {
                                game.board![index] = lastValue;
                                turn++;
                                gameOver = game.winnerCheck(
                                    lastValue, index, scoreboard, 3);

                                if (gameOver) {
                                  result = "$lastValue is the Winner";
                                } else if (!gameOver && turn == 9) {
                                  result = "It's a Draw!";
                                  gameOver = true;
                                }
                                if (lastValue == "X") {
                                  lastValue = "O";
                                } else {
                                  lastValue = "X";
                                }
                              });
                            }
                          },
                    child: Container(
                      width: Game.blocSize,
                      height: Game.blocSize,
                      decoration: BoxDecoration(
                        color: MainColor.secondaryColor,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Center(
                        child: Text(
                          game.board![index],
                          style: TextStyle(
                            color: game.board![index] == "X"
                                ? Colors.blue
                                : Colors.pink,
                            fontSize: 64.0,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Text(
              result,
              style: const TextStyle(color: Colors.white, fontSize: 54.0),
            ),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  //erase the board
                  game.board = Game.initGameBoard();
                  lastValue = "X";
                  gameOver = false;
                  turn = 0;
                  result = "";
                  scoreboard = [0, 0, 0, 0, 0, 0, 0, 0];
                });
              },
              icon: const Icon(Icons.replay),
              label: const Text("Repeat the Game"),
            ),
          ],
        ));
    //the first step is organise our project folder structure
  }
}
