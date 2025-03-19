import 'dart:math';

import 'package:flame_forge2d/flame_forge2d.dart';

class Pipe extends BodyComponent {
  final random = Random();
  final obstacleHeight = 25.0;
  final edgeBuffer = 2;
  final double height;
  final bool bottom;
  

  Pipe(this.height, this.bottom);

  @override
  Body createBody() {
    final worldRect = game.camera.visibleWorldRect;

    final topBodyDef = BodyDef(
      position: Vector2(worldRect.right + edgeBuffer, bottom ? worldRect.bottom - height : worldRect.top + height),
      gravityOverride: Vector2.zero(),
      linearVelocity: Vector2(-10, 0),
      type: BodyType.dynamic,
      fixedRotation: true,
      userData: this,
    );
    

    final shape = PolygonShape()
      ..setAsBoxXY(
        2.5,
        height,
      );

    final body = world.createBody(topBodyDef);
    body.createFixture(FixtureDef(shape));

    return body;
  }
}