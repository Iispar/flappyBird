import 'package:flappy_bird/features/game/flappy_game_screen.dart';
import 'package:flutter/material.dart';

class GameOverBoard extends StatelessWidget {
  final FlappyGame game;
  const GameOverBoard({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        title: const Text('Game Over!'),
        content: Text('Your Score: ${game.score}'),
        actions: [
          TextButton(
            onPressed: () {game.restart();},
            child: const Text('Restart'),
          ),
        ],
      ),
    );
  }
}
