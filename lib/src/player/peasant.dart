import 'dart:math';

import 'player.dart';

/// Peasant player with lower damage and lower hp. Represents really unskilled player.
class Peasant extends Player {

  Peasant (String name) : super(name) {
    // Set the damage to 0.5 times the default value.
    damage = (damage * 0.5).toInt();

    // Set the original health points to 0.5 times the default value.
    originalHp = hp = (hp * 0.5).toInt();
  }
}
