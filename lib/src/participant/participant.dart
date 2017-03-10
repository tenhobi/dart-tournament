import 'dart:math';
import 'dart:io';

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
  int originalHp;

  Participant (this.name) : id = instanceCounter++ {
    // Set damage to 5 up to 10.
    damage = 5 + new Random().nextInt(5 + 1);

    // Set health points to 100 up to 110.
    originalHp = hp = 100 + new Random().nextInt(10 + 1);
  }

  String toString () {
    return "$name ($runtimeType #$id) [$hp/$originalHp]";
  }

  /// Generate information about this [Participant].
  String generateStats () {
    return "$runtimeType #$id - '$name' - hp: $hp/$originalHp, damage: $damage";
  }

  /// Compare this and another [Participant] based on theirs' [id]s.
  bool operator == (final Object p) => p is Participant && this.id == p.id;

  /// Automatic defend of this [Participant].
  void defend (final int damage) {
    // Chance to block attack 1/30.
    if (new Random().nextInt(30) == 0) {
      stdout.writeln("... Attack blocked.");
      return;
    }

    hp -= damage;
  }

  /// Attack to another [Participant].
  void attack (final Participant player) {
    int power = damage + ((new Random().nextInt(15) == 0) ? damage ~/ 2 : 0);

    stdout.writeln("$this is attacking $player with power of $power!");

    player.defend(power);
  }
}
