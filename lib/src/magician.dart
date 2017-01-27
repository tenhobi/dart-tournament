import 'dart:math';

import 'player.dart';

class Magician extends Player {

  Magician (String name) : super(name) {
    // 3.0 to 4.0 times default damage
    damage = (damage * (3 + (new Random().nextInt(10 + 1) / 10))).toInt();

    // 0.5 to 1.0 times default hp
    originalHp = hp = (hp * (0.5 + (new Random().nextInt(5 + 1) / 10))).toInt();
  }
}
