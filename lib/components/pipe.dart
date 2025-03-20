import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flappy_bird/features/game/flappy_game_screen.dart';

class Pipe extends BodyComponent<FlappyGame> {
  final random = Random();
  final obstacleHeight = 25.0;
  final edgeBuffer = 2;
  final double height;
  final bool bottom;
  late SpriteComponent spriteComponent;

  Pipe(this.height, this.bottom);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final sprite = await Sprite.load('pole.png');
    spriteComponent = SpriteComponent(
      sprite: sprite,
      size: Vector2(6, height * 2),
      anchor: Anchor.center,
    );
    add(spriteComponent);
  }

  @override
  Body createBody() {
    final worldRect = game.camera.visibleWorldRect;

    final topBodyDef = BodyDef(
      position: Vector2(worldRect.right + edgeBuffer,
          bottom ? worldRect.bottom - height + 1 : worldRect.top + height - 1),
      gravityOverride: Vector2.zero(),
      linearVelocity: Vector2(-20, 0),
      type: BodyType.dynamic,
      fixedRotation: true,
      userData: this,
    );
    renderBody = false;

    final shape = PolygonShape()
      ..setAsBoxXY(
        2.5,
        height,
      );

    final body = world.createBody(topBodyDef);
    body.createFixture(FixtureDef(shape)
      ..filter.categoryBits = game.categoryPipe
      ..filter.maskBits = game.categoryBird);

    return body;
  }
}
