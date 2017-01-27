import 'dart:math';
import 'dart:async';

import 'player.dart';
import 'magician.dart';
import 'warrior.dart';
import 'name.dart';

enum TournamentStatus {
  EMPTY,
  INPROGRESS,
  ENDED
}

class Tournament {
  List<Player> _playerList = [];
  int round = 0;
  TournamentStatus status;

  Tournament ([int playerCount = 30]) {
    NameGenerator ng = new NameGenerator();

    for (int i = 0; i < playerCount; i++) {
      Player player;

      switch (new Random().nextInt(4)) {
        case 0:
          player = new Magician(ng.generate());
          break;

        case 1:
          player = new Warriror(ng.generate());
          break;

        default:
          player = new Player(ng.generate());
      }

      _playerList.add(player);
    }

    if (_playerList.isEmpty) {
      status = TournamentStatus.EMPTY;
    }
  }

  void start () {
    switch (status) {
      case TournamentStatus.EMPTY:
        print("Tournament is empty.");
        break;

      case TournamentStatus.INPROGRESS:
        print("Tournament is running.");
        break;

      case TournamentStatus.ENDED:
        print("Tournament has already ended.");
        break;

      default:
        print(generateScoreBoard(heading: "Tournament is starting with players"));
        status = TournamentStatus.INPROGRESS;

        _loop();
    }
  }

  void _loop () {
    int alivePlayers = _playerList
      .where((Player player) => (player.hp > 0))
      .length;

    if (alivePlayers <= 1) {
      status = TournamentStatus.ENDED;

      print("""

==============
""");

      if (alivePlayers == 1) {
        print("The winner of the tournament is ${_playerList.firstWhere((Player player) => (player.hp > 0))}\n");
      } else {
        print("No one survived, no one won.\n");
      }

      print(generateScoreBoard(compare: (a, b) => b.hp.compareTo(a.hp)));
      return;
    }

    // Keeps track of people who was alive at the start of the round.
    List<Player> playerList = new List();
    playerList.addAll(_playerList.where((Player player) => player.hp > 0));

    print("""

  --- Round ${round++}
  --- with ${playerList.length} players
""");

    for (Player player in playerList) {
      Player target;

      do {
        target = playerList.elementAt(new Random().nextInt(playerList.length));
      } while (player == target);

      player.attack(target);
    }

    new Future.delayed(const Duration(seconds: 1), _loop);
  }

  String toString () {
    return generateScoreBoard(compare: (a, b) => b.hp.compareTo(a.hp));
  }

  String generateScoreBoard ({int compare (Player a, Player b), String heading: "Score board"}) {
    String stat = "$heading:\n";

    if (compare != null) {
      _playerList.sort(compare);
    }

    for (Player player in _playerList) {
      stat += "${player.generateStats()}${_playerList.last != player ? "\n" : ""}";
    }

    return stat;
  }
}
