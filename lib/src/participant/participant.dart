import 'dart:math';

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
  int id;

  /// Original (starting) amount of health points.
  int originalHp;

  Participant (this.name) {
    // Set health points to 100 up to 110.
    originalHp = hp = 100 + new Random().nextInt(10 + 1);

    // Set damage to 5 up to 10.
    damage = 5 + new Random().nextInt(5 + 1);

    id = instanceCounter++;
  }

  String toString () {
    return "$name ($runtimeType #$id) [$hp/$originalHp]";
  }

  /// Generate information about this [Participant].
  String generateStats () {
    return "$runtimeType #$id - '$name' - hp: $hp/$originalHp, damage: $damage";
  }

  /// Compare this and another [Participant] based on theirs' [id]s.
  bool operator == (Object p) => p is Participant && this.id == p?.id;

  /// Automatic defend of this [Participant].
  void defend (int damage) {
    // Chance to block attack 1/30.
    if (new Random().nextInt(30) == 0) {
      print("... Attack blocked.");
      return;
    }

    hp -= damage;
  }

  /// Attack to another [Participant].
  void attack (Participant player) {
    int power = damage + ((new Random().nextInt(15) == 0) ? damage ~/ 2 : 0);

    print("$this is attacking $player with power of $power!");

    player.defend(power);
  }
}
