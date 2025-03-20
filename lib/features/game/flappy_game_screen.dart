import 'dart:async';
import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flappy_bird/components/background.dart';
import 'package:flappy_bird/components/bird.dart';
import 'package:flappy_bird/components/game_bounds.dart';
import 'package:flappy_bird/components/pipe.dart';
import 'dart:async' as dart_async;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class FlappyGame extends Forge2DGame with TapCallbacks, KeyboardEvents {
  FlappyGame()
      : super(
            camera:
                CameraComponent.withFixedResolution(width: 800, height: 600));
  final random = Random();
  int gapHeight = 10;
  Bird bird = Bird();
  int safetyBuffer = 20;
  RxInt score = 0.obs;
  RxBool gameActive = false.obs;
  RxBool resultsActive = false.obs;

  removeOutOfBoundsObstacles() {
    world.children.whereType<Pipe>().forEach((obstacle) {
      if (obstacle.body.position.x < camera.visibleWorldRect.left) {
        world.remove(obstacle);
      }
    });
  }

  createPipes() {
    final worldRect = camera.visibleWorldRect;
    double height = safetyBuffer +
        random.nextDouble() *
            (worldRect.bottom - worldRect.top - safetyBuffer * 2);
    double heightTop = (height - gapHeight) / 2;
    double heightBottom = (worldRect.height - height - gapHeight) / 2;
    world.add(Pipe(heightTop, false));
    world.add(Pipe(heightBottom, true));
  }

  gameOver() {
    resultsActive.value = true;
    pauseEngine();
    overlays.add("Results");
  }

  restart() {
    if (gameActive.value) gameActive.value = false;
    resultsActive.value = false;
    world.gravity = Vector2(0, 0);
    world.children.whereType<Pipe>().toList().forEach(world.remove);
    score.value = 0;

    bird.reset();

    resumeEngine();
    overlays.remove('Results');
  }

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();

    final backgroundImage = await images.load('background.png');
    await world.add(Background(sprite: Sprite(backgroundImage)));

    world.gravity = Vector2(0, 0);
    world.add(GameBounds());
    world.add(bird);
    overlays.add("Score");

    dart_async.Timer.periodic(const Duration(milliseconds: 2000), (timer) {
      if (gameActive.value && !resultsActive.value) {
        createPipes();
        score += 1;
      }
    });
  }

  @override
  void onTapDown(TapDownEvent event) {
    if (!gameActive.value) startGame();
    bird.onTap();
  }

  void startGame() {
    world.gravity = Vector2(0, 160);
    gameActive.value = true;
  }

  @override
  KeyEventResult onKeyEvent(
    KeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    final isKeyDown = event is KeyDownEvent;
    final isSpace = keysPressed.contains(LogicalKeyboardKey.space);

    if (isSpace && isKeyDown) {
      if (!gameActive.value) startGame();
      bird.onTap();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }
}
