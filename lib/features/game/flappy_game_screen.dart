import 'dart:async';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flappy_bird/components/bird.dart';
import 'package:flappy_bird/components/game_bounds.dart';
import 'package:flappy_bird/components/pipe.dart';
import 'dart:async' as dart_async;

class FlappyGame extends Forge2DGame {
  FlappyGame();

  removeOutOfBoundsObstacles() {
    world.children.whereType<Pipe>().forEach((obstacle) {
      if (obstacle.body.position.x < camera.visibleWorldRect.left) {
        world.remove(obstacle);
      }
    });
  }

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    world.add(GameBounds());
    world.add(Bird());
    world.add(Pipe(-24));
    world.add(Pipe(24));

      dart_async.Timer.periodic(const Duration(milliseconds: 2500), (timer) {

      world.add(Pipe(-24));
      world.add(Pipe(24));
    });
  }
}
