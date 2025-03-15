import 'package:flappy_bird/features/game/flappy_game_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScoreBoard extends StatelessWidget {
  final FlappyGame game;
  const ScoreBoard({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Obx(() => 
      Text("${game.score}")
    );
  }
}
