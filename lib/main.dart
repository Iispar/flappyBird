import 'package:flame_audio/flame_audio.dart';
import 'package:flappy_bird/features/start/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  await FlameAudio.audioCache.load('flap.mp3');
  await FlameAudio.audioCache.load('score.mp3');
  runApp(GameApp());
}

class GameApp extends StatelessWidget {
  
  const GameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: StartScreen(),
    );
  }
}
