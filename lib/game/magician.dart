import 'player.dart';

class Magician extends Player {
  Magician (String name) : super(name) {
    print("in Magician");
    damage = 50;
  }
}
