import 'dart:math';

class Player {
  static int instanceCounter = 0;
  int hp;
  int damage;
  String name;
  int id;

  Player (this.name) {
    hp = 100 + new Random().nextInt(10);
    id = instanceCounter++;
    damage = 5 + new Random().nextInt(5);
  }

  String toString () {
    return "$runtimeType #$id - '$name' - hp: $hp, damage: $damage";
  }

  bool operator == (p) => this.id == p.id;
}
