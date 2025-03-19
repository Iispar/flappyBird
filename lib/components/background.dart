import 'dart:math';
import 'package:flame/components.dart';
import 'package:flappy_bird/features/game/flappy_game_screen.dart';

class Background extends SpriteComponent with HasGameReference<FlappyGame> {
  Background({required super.sprite})
      : super(
          anchor: Anchor.center,
          position: Vector2(0, 0),
        );

  @override
  void onMount() {
    super.onMount();

    size = Vector2.all(max(
      game.camera.visibleWorldRect.width,
      game.camera.visibleWorldRect.height,
    ));
  }
}
