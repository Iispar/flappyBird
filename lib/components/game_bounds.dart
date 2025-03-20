import 'package:flame/extensions.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flappy_bird/features/game/flappy_game_screen.dart';

class GameBounds extends BodyComponent<FlappyGame> {
  @override
  Body createBody() {
    final bodyDef = BodyDef(
      type: BodyType.static,
      position: Vector2.zero(),
      userData: this
    );

    Body gameBoundsBody = world.createBody(bodyDef);

    final gameRect = game.camera.visibleWorldRect;
    final gameBoundsVectors = [
      gameRect.topLeft.toVector2(),
      gameRect.topRight.toVector2(),
      gameRect.bottomRight.toVector2(),
      gameRect.bottomLeft.toVector2(),
    ];

    for (int i = 0; i < gameBoundsVectors.length; i += 2) {
      gameBoundsBody.createFixture(FixtureDef(
        EdgeShape()
          ..set(
            gameBoundsVectors[i],
            gameBoundsVectors[(i + 1) % gameBoundsVectors.length],
          ),
      )
      ..filter.categoryBits = game.categoryBackground
      ..filter.maskBits = game.categoryBird
      );
    }

    return gameBoundsBody;
  }
}