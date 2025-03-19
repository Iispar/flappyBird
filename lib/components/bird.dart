import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flappy_bird/features/game/flappy_game_screen.dart';

class Bird extends BodyComponent<FlappyGame> with ContactCallbacks {
  
  @override
  Body createBody() {
    final bodyDef = BodyDef(
        position: Vector2(0, 0),
        type: BodyType.dynamic,
        userData: this,
        gravityScale: Vector2(0, 6));

    final shape = PolygonShape()..setAsBoxXY(2.5, 2.5);
    final fixtureDef = FixtureDef(shape);
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  void onTap() {
    body.applyLinearImpulse(Vector2(0, -1000));
  }

  void reset() {
    body.setTransform(Vector2(0, 0), 0);
    body.linearVelocity = Vector2.zero();
    body.angularVelocity = 0;
    body.setFixedRotation(true);
  }

  @override
  void beginContact(Object other, Contact contact) {
    game.gameOver();
  }
}
