import 'dart:math';

import 'participant.dart';

/// Type of [Participant] that has lower [damage], but higher [hp].
class Warriror extends Participant {

  Warriror ([String name]) : super(name: name, hpRatio: 1.8 + (new Random().nextInt(7 + 1) / 10)) {
    // Set the damage to 0.5 up to 0.8 times the default value.
    damage = (damage * (0.5 + (new Random().nextInt(3 + 1) / 10))).toInt();
  }
}
