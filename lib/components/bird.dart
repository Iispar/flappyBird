import 'dart:math';

import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flappy_bird/features/game/flappy_game_screen.dart';

class Bird extends BodyComponent<FlappyGame> with ContactCallbacks {
  final double speed = 5;
  final double amplitude = 1;
  late Vector2 initialPosition;
  double elapsedTime = 0;
  @override
  Body createBody() {
    final bodyDef = BodyDef(
        position: Vector2(0, 0),
        type: BodyType.dynamic,
        userData: this,
        fixedRotation: true);

    final shape = PolygonShape()..setAsBoxXY(2.5, 2.5);
    final fixtureDef = FixtureDef(shape);
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  void onTap() {
    body.linearVelocity = Vector2.zero();
    body.applyLinearImpulse(Vector2(0, -1200));
  }

  void reset() {
    body.setTransform(Vector2(0, 0), 0);
    body.linearVelocity = Vector2.zero();
  }

  @override
  void beginContact(Object other, Contact contact) {
    game.gameOver();
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    initialPosition = body.position.clone();
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (!game.gameActive.value) {
      elapsedTime += dt;
      double offsetY = sin(elapsedTime * speed) * amplitude;
      body.setTransform(
          Vector2(initialPosition.x, initialPosition.y + offsetY), body.angle);
    }
  }
}
