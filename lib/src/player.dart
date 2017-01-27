import 'dart:math';

class Player {
  static int instanceCounter = 0;
  int hp;
  int damage;
  String name;
  int id;
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

  String generateStats () {
    return "$runtimeType #$id - '$name' - hp: $hp/$originalHp, damage: $damage";
  }

  bool operator == (p) => this.id == p.id;

  void defend (int damage) {
    // Chance to block attack 1/30.
    if (new Random().nextInt(30) == 0) {
      print("... Attack blocked.");
      return;
    }

    hp -= damage;
  }

  void attack (Player player) {
    int power = damage + ((new Random().nextInt(15) == 0) ? damage ~/ 2 : 0);

    print("$this is attacking $player with power of $power!");

    player.defend(power);
  }
}
