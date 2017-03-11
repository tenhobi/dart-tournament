import 'participant.dart';

/// Type of [Participant] that has lower [damage] and lower [hp]. Represents really unskilled [Participant].
class Peasant extends Participant {

  static int ohp = (Participant.defaultHp * 0.5).toInt();

  Peasant ({String name}) : super(name: name, hpRatio: 0.5) {
    // Set the damage to 0.5 times the default value.
    damage = (damage * 0.5).toInt();
  }
}
