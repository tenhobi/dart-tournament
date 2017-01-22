import 'player.dart';
import 'name.dart';

class Game {
  List<Player> _playerList = [];

  Game ([int playerCount = 2]) {
    NameGenerator ng = new NameGenerator();

    for (int i = 0; i < playerCount; i++) {
      _playerList.add(new Player(ng.generate(), 5));
    }
  }

  String toString () {
    return _playerList.toString();
  }
}
