import 'package:flame/components.dart';

import '../play_session/flame_game/game.dart';

class FishAnimationComponent extends SpriteAnimationComponent
    with HasGameRef<MyGame> {
  final double speed = 3;

  @override
  Future<void> onLoad() async {
    var spriteSheet = await gameRef.images.load('fish-spritesheet.png');
    final spriteSize = Vector2(236, 182);
    SpriteAnimationData spriteData = SpriteAnimationData.sequenced(
      amount: 13,
      stepTime: 0.2,
      textureSize: Vector2(236, 182),
    );
    animation = SpriteAnimation.fromFrameData(spriteSheet, spriteData);
    size = spriteSize;
    position = Vector2(50, 200);
    anchor = Anchor.center;
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

    if (gameRef.joystick.direction == JoystickDirection.left &&
        !this.isFlippedHorizontally) {
      this.flipHorizontally(); // Flip the fish to face left
    } else if (gameRef.joystick.direction == JoystickDirection.right &&
        this.isFlippedHorizontally) {
      this.flipHorizontally(); // Flip the fish back to face right
    }

    // if (moveLeft) {
    //   current = MovementState.slideLeft;
    // } else {
    //   current = MovementState.slideRight;
    // }
    super.update(dt);
  }
}
