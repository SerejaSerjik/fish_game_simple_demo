import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';
import 'package:game_template/src/components/fish.dart';
import 'package:game_template/src/components/joystick.dart';

import '../../components/fish_animation.dart';

class MyGame extends FlameGame with DragCallbacks {
  late final GameJoystick joystick;

  // final FishComponent _fishComponent = FishComponent();

  final FishAnimationComponent _fishAnimation = FishAnimationComponent();

  @override
  Future<void> onLoad() async {
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

    // add(_fishComponent);

    joystick = GameJoystick();
    add(joystick);

    add(_fishAnimation);

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
