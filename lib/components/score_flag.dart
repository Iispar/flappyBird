import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flappy_bird/features/game/flappy_game_screen.dart';

class ScoreFlag extends BodyComponent<FlappyGame> with ContactCallbacks {
  final edgeBuffer = 2;
  final double height;

  ScoreFlag(this.height);

  @override
  Body createBody() {
    final worldRect = game.camera.visibleWorldRect;

    final topBodyDef = BodyDef(
      position: Vector2(worldRect.right + edgeBuffer, 0),
      gravityOverride: Vector2.zero(),
      linearVelocity: Vector2(-20, 0),
      type: BodyType.dynamic,
      fixedRotation: true,
      userData: this,
    );
    renderBody = false;

    final shape = PolygonShape()
      ..setAsBoxXY(
        1,
        height,
      );

    final body = world.createBody(topBodyDef);
    body.createFixture(FixtureDef(shape)
      ..isSensor = true
      ..filter.categoryBits = game.categoryScore
      ..filter.maskBits = game.categoryBird);

    return body;
  }
}
