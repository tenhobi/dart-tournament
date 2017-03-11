import 'dart:math';

import 'participant.dart';

/// Type of [Participant] that has higher [damage], but lower [hp].
class Magician extends Participant {

  Magician ([String name]) : super(name: name, hpRatio: 0.5 + (new Random().nextInt(5 + 1) / 10)) {
    // 3.0 to 4.0 times default damage
    damage = (damage * (3 + (new Random().nextInt(10 + 1) / 10))).toInt();
  }
}
