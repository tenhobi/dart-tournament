import 'dart:math';

import 'player.dart';

class Magician extends Player {

  Magician (String name) : super(name) {

    // 2.0 to 3.0 times default damage
    damage = (damage * (2 + (new Random().nextInt(10) / 10))).toInt();

    // 0.5 to 1.0 times default hp
    hp = (hp * (0.5 + (new Random().nextInt(5) / 10))).toInt();
  }
}
