import 'dart:math';

class Player {
  static int instanceCounter = 0;
  int _hp;
  int damage;
  String _name;
  int _id;

  Player (this._name) {
    print("in Player");
    _hp = 100 + new Random().nextInt(10);
    _id = instanceCounter++;
    damage = 5 + new Random().nextInt(5);
  }

  String toString () {
    return "Player#${_id} '${_name}' $_hp / $damage";
  }
}
