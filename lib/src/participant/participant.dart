import 'dart:math';
import 'dart:io';

import '../name.dart';

/// Sets general behavior and attributes for [Participant] extended classes.
abstract class Participant {

  /// Keeps track of number of added instances of [Participant].
  static int instanceCounter = 0;

  /// Health points of this [Participant].
  int hp;

  /// Damage points of this [Participant].
  int damage;

  /// A name of this [Participant].
  String name;

  /// An identification of this [Participant].
  final int id;

  /// Original (starting) amount of health points.
  final int originalHp;

  static const int defaultHp = 100;
  static const double defaultHpRatio = 1.0;

  Participant ({this.name, double hpRatio = defaultHpRatio})
    : originalHp = (hpRatio * defaultHp).toInt(),
      id = ++instanceCounter {
    // Set damage to 5 up to 10.
    damage = 5 + new Random().nextInt(5 + 1);

    // Set the max health points of this participant.
    hp = originalHp;

    name ??= Name.generate();
  }

  @override
  String toString () {
    return "$name ($runtimeType #$id) [$hp/$originalHp]";
  }

  /// Generate information about this [Participant].
  String generateStats () {
    return "$runtimeType #$id - '$name' - hp: $hp/$originalHp, damage: $damage";
  }

  /// Compare this and another [Participant] based on theirs' [id]s.
  @override
  bool operator == (final Object p) => p is Participant && this.id == p.id;

  /// Attack to another [Participant].
  void attack (final Participant player) {
    int power = damage + ((new Random().nextInt(15) == 0) ? damage ~/ 2 : 0);

    stdout.writeln('$this is attacking $player with power of $power!');

    player.defend(power);
  }

  /// Automatic defend of this [Participant].
  void defend (final int damage) {
    // Chance to block attack 1/30.
    if (new Random().nextInt(30) == 0) {
      stdout.writeln('... Attack blocked.');
      return;
    }

    hp -= damage;
  }

  /// Automatic
  void rest () {}
}
