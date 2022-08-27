import 'package:flutter/material.dart';
import 'package:three_games/games/mathGame/math_game.dart';
import 'package:three_games/games/snake_game/snake_game.dart';
import 'package:three_games/widgets/reusable_buttons.dart';

import 'tic_tac_toe_game/x_and_o.dart';

class PickGamePage extends StatelessWidget {
  const PickGamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const SizedBox(
                height: 225,
              ),
              Buttons(
                text: 'Snake Game',
                width: 335,
                color: Colors.blueGrey[500],
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SnakeGame()),
                  );
                },
              ),
              const SizedBox(
                height: 50,
              ),
              Buttons(
                text: 'Tic-Tac-Toe Game',
                width: 335,
                color: Colors.indigo,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TicTactoeGameScreen()),
                  );
                },
              ),
              const SizedBox(
                height: 50,
              ),
              Buttons(
                text: 'Math Game',
                width: 335,
                color: Colors.blue[900],
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MathGame()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
