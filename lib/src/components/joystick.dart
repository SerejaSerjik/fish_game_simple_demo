import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

class GameJoystick extends JoystickComponent {
  GameJoystick()
      : super(
          knob: CircleComponent(
            radius: 30,
            paint: BasicPalette.red.paint(),
          ),
          margin: const EdgeInsets.only(left: 20, bottom: 20),
          background: CircleComponent(
            radius: 100,
            paint: BasicPalette.black.withAlpha(100).paint(),
          ),
        );
}
