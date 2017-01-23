import 'dart:math';

import 'player.dart';

class Warriror extends Player {

  Warriror (String name) : super(name) {

    // 0.5 to 0.8 times default damage
    damage = (damage * (0.5 + (new Random().nextInt(3) / 10))).toInt();

    // 2.0 to 3.0 times default hp
    hp = (hp * (2 + (new Random().nextInt(10) / 10))).toInt();
  }
}
