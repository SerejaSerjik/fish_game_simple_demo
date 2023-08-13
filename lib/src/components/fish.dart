import 'dart:async';

import 'package:flame/components.dart';
import 'package:game_template/src/play_session/flame_game/game.dart';

enum MovementState {
  slideLeft,
  slideRight,
}

class FishComponent extends SpriteGroupComponent<MovementState>
    with HasGameRef<MyGame> {
  final double _spriteHeight = 100;

  final double speed = 3;

  FishComponent();

  @override
  FutureOr<void> onLoad() async {
    final Sprite fishLeft = await gameRef.loadSprite('fish.png');
    final Sprite fishRight = await gameRef.loadSprite('fish2.png');

    sprites = {
      MovementState.slideLeft: fishLeft,
      MovementState.slideRight: fishRight,
    };

    size = Vector2.all(140);
    position = gameRef.size / 2;
    anchor = Anchor.center;
    current = MovementState.slideLeft;

    return super.onLoad();
  }

  @override
  void update(double dt) {
    bool moveLeft = gameRef.joystick.relativeDelta[0] < 0;
    switch (gameRef.joystick.direction) {
      case JoystickDirection.down:
        if (y < gameRef.size.y) {
          y += speed * gameRef.joystick.delta.y * dt;
        }
      case JoystickDirection.up:
        if (y > 0) {
          y += speed * gameRef.joystick.delta.y * dt;
        }
      case JoystickDirection.right:
        if (x > 0) {
          x += speed * gameRef.joystick.delta.x * dt;
        }
      case JoystickDirection.left:
        if (x > 0) {
          x += speed * gameRef.joystick.delta.x * dt;
        }

      default:
    }

    if (moveLeft) {
      current = MovementState.slideLeft;
    } else {
      current = MovementState.slideRight;
    }

    super.update(dt);
  }
}
