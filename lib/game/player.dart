import 'dart:math';

class Player {
  static int instanceCounter = 0;
  int hp;
  int damage;
  String name;
  int id;
  int originalHp;

  Player (this.name) {
    originalHp = hp = 100 + new Random().nextInt(10);
    id = instanceCounter++;
    damage = 5 + new Random().nextInt(5);
  }

  String toString () {
    return "$runtimeType #$id - '$name' - hp: $hp/$originalHp, damage: $damage";
  }

  bool operator == (p) => this.id == p.id;

  void defend (int damage) {
    // Blocked
    if (new Random().nextInt(30) == 0) {
      return;
    }

    // Luck chance of take only 50 % of the incoming damage.
    int takenDamage = ((1 - (new Random().nextInt(50) / 100)) * damage).toInt();
    hp -= takenDamage;
  }

  void attack (Player player) {
    int power = damage + ((new Random().nextInt(15) == 0) ? damage ~/ 2 : 0);
    player.defend(power);
  }
}
