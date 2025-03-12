import 'dart:math';

import 'package:flame_forge2d/flame_forge2d.dart';

class Pipe extends BodyComponent {
  final random = Random();
  final obstacleHeight = 25.0;
  final edgeBuffer = 2;
  final double y;

  Pipe(this.y);

  @override
  Body createBody() {
    final halfObstacleHeight = obstacleHeight / 2;
    final worldRect = game.camera.visibleWorldRect;

    final topBodyDef = BodyDef(
      position: Vector2(worldRect.right + edgeBuffer, y ),
      gravityOverride: Vector2.zero(),
      linearVelocity: Vector2(-10, 0),
      type: BodyType.dynamic,
      userData: this,
    );
    

    final shape = PolygonShape()
      ..setAsBoxXY(
        2,
        halfObstacleHeight,
      );

    final body = world.createBody(topBodyDef);
    body.createFixture(FixtureDef(shape));

    return body;
  }
}