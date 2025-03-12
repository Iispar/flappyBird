
import 'package:flame/game.dart';
import 'package:flappy_bird/features/game/flappy_game_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 20,
          children: [
            Column(children: [
              Text("Welcome to the game!", style: TextStyle(fontSize: 48)),
            ]),
            ElevatedButton(
              child: Text(
                "Start",
                style: TextStyle(fontSize: 24),
              ),
              onPressed: () => Get.to(() => GameWidget(game: FlappyGame())),
            )]
        ),
      ),
    );
  }
}