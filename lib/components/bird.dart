import 'package:flame/events.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flappy_bird/features/game/flappy_game_screen.dart';

class Bird extends BodyComponent<FlappyGame> with TapCallbacks, ContactCallbacks {
  @override
  Body createBody() {
    final bodyDef = BodyDef(
      position: Vector2(0, 0),
      type: BodyType.dynamic,
      userData: this,
    );

    final shape = PolygonShape()..setAsBoxXY(2.5, 2.5);
    final fixtureDef = FixtureDef(shape);
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  @override
  void onTapDown(TapDownEvent event) {
    body.applyLinearImpulse(Vector2(0, -500));
  }

  @override
  void beginContact(Object other, Contact contact) {
    print("U lost");
  }
}