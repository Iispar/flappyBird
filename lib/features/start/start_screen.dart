import 'package:flame/game.dart';
import 'package:flappy_bird/components/game_over_board.dart';
import 'package:flappy_bird/components/score_board.dart';
import 'package:flappy_bird/features/game/flappy_game_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartScreen extends StatelessWidget {
  final FocusNode _focusNode = FocusNode();

  StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue[50],
        body: KeyboardListener(
          focusNode: _focusNode,
          autofocus: true,
          onKeyEvent: (event) {
            Get.to(() => GameWidget(
                  game: FlappyGame(),
                  overlayBuilderMap: {
                    'Results': (context, game) =>
                        GameOverBoard(game: game as FlappyGame),
                    'Score': (context, game) =>
                        ScoreBoard(game: game as FlappyGame),
                  },
                ));
          },
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 20,
                children: [
                  Column(children: [
                    Text("Welcome to Flappy Bird!",
                        style: TextStyle(fontSize: 48)),
                  ]),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 30, 76, 157),
                      foregroundColor: Colors.white,
                    ),
                    child: Text(
                      "Start",
                      style: TextStyle(fontSize: 24),
                    ),
                    onPressed: () => Get.to(() => GameWidget(
                          game: FlappyGame(),
                          overlayBuilderMap: {
                            'Results': (context, game) =>
                                GameOverBoard(game: game as FlappyGame),
                            'Score': (context, game) =>
                                ScoreBoard(game: game as FlappyGame),
                          },
                        )),
                  )
                ]),
          ),
        ));
  }
}
