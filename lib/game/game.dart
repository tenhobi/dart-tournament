import 'dart:math';
import 'player.dart';
import 'magician.dart';
import 'name.dart';

class Game {
  List<Player> _playerList = [];

  Game ([int playerCount = 10]) {
    NameGenerator ng = new NameGenerator();

    for (int i = 0; i < playerCount; i++) {
      Player player;

      switch (new Random().nextInt(10)) {
        case 0:
          player = new Magician(ng.generate());
          break;
        default:
          player = new Player(ng.generate());
      }

      _playerList.add(player);
    }
  }

  String toString () {
    return _playerList.toString();
  }

  void loop () {

  }
}
