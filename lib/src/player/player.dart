import 'dart:math';

class Player {

  /// Keeps track of number of added instances.
  static int instanceCounter = 0;

  /// Health points of this player.
  int hp;

  /// Damage points of this player.
  int damage;

  /// A name of this player.
  String name;

  /// An identification of this player.
  int id;

  /// Original (starting) amount of health points.
  int originalHp;

  Player (this.name) {
    // Set health points to 100 up to 110.
    originalHp = hp = 100 + new Random().nextInt(10 + 1);

    // Set damage to 5 up to 10.
    damage = 5 + new Random().nextInt(5 + 1);

    id = instanceCounter++;
  }

  String toString () {
    return "$name ($runtimeType #$id) [$hp/$originalHp]";
  }

  /// Generate player line for static table.
  String generateStats () {
    return "$runtimeType #$id - '$name' - hp: $hp/$originalHp, damage: $damage";
  }

  /// Compare 2 player based on theirs' IDs.
  bool operator == (p) => this.id == p?.id;

  /// Automatic defend of the player.
  void defend (int damage) {
    // Chance to block attack 1/30.
    if (new Random().nextInt(30) == 0) {
      print("... Attack blocked.");
      return;
    }

    hp -= damage;
  }

  /// Attack to another player.
  void attack (Player player) {
    int power = damage + ((new Random().nextInt(15) == 0) ? damage ~/ 2 : 0);

    print("$this is attacking $player with power of $power!");

    player.defend(power);
  }
}
