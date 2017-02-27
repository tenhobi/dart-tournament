import 'dart:math';

import 'player.dart';

/// Warrior player with lower [damage], but higher [hp].
class Warriror extends Player {

  Warriror (String name) : super(name) {
    // Set the damage to 0.5 up to 0.8 times the default value.
    damage = (damage * (0.5 + (new Random().nextInt(3 + 1) / 10))).toInt();

    // Set the original health points to 1.8 up to 2.5 times the default value.
    originalHp = hp = (hp * (1.8 + (new Random().nextInt(7 + 1) / 10))).toInt();
  }
}
