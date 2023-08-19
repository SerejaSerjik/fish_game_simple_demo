import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';
import 'package:game_template/src/components/fish.dart';
import 'package:game_template/src/components/joystick.dart';

class MyGame extends FlameGame with DragCallbacks {
  late final GameJoystick joystick;

  final FishComponent _fishComponent = FishComponent();

  SpriteAnimationComponent fishAnimation = SpriteAnimationComponent();

  @override
  Future<void> onLoad() async {
    var spriteSheet = await images.load('fish-spritesheet.png');
    final spriteSize = Vector2(236, 182);
    SpriteAnimationData spriteData = SpriteAnimationData.sequenced(
      amount: 13,
      stepTime: 0.2,
      textureSize: Vector2(236, 182),
    );
    fishAnimation =
        SpriteAnimationComponent.fromFrameData(spriteSheet, spriteData)
          ..x = 25
          ..y = 35
          ..size = spriteSize;
    add(fishAnimation);

    ParallaxComponent waterBg = await ParallaxComponent.load(
      [
        ParallaxImageData('1.png'),
        ParallaxImageData('2.png'),
        // ParallaxImageData('3.png'),
        // ParallaxImageData('4.png'),
        // ParallaxImageData('5.png'),
        // ParallaxImageData('6.png'),
      ],
      repeat: ImageRepeat.repeat,
      baseVelocity: Vector2(-50, 0),
      velocityMultiplierDelta: Vector2(1.6, 1.0),
    );

    add(waterBg);

    SpriteComponent background = SpriteComponent()
      ..sprite = await loadSprite('5.png')
      ..size = size;

    add(background);

    add(_fishComponent);

    joystick = GameJoystick();
    add(joystick);

    await super.onLoad();

    print('onLoad called');
  }

  @override
  void update(double dt) {
    super.update(dt);

    print('update called at delta time $dt');
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    print('render called');
  }
}
