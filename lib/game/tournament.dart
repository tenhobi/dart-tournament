import 'dart:math';
import 'dart:io';
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

  Tournament ([int playerCount = 5]) {
    NameGenerator ng = new NameGenerator();

    for (int i = 0; i < playerCount; i++) {
      Player player;

      switch (new Random().nextInt(5)) {
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

        _loop();
    }
  }

  void _loop () {
    if (_playerList.any((Player player) => (player.hp <= 0))) {
      print("The winner of the tournament is ${_playerList.firstWhere((Player player) => (player.hp > 0))}");
      print(generateScoreBoard(compare: (a, b) => b.hp.compareTo(a.hp)));
      status = TournamentStatus.ENDED;
      return;
    }

    print("--- Round ${round++}");
    _playerList.forEach((Player player) =>
    player.hp -= new Random().nextInt(10));
    new Future.delayed(const Duration(milliseconds: 500), _loop);
  }

  String toString () {
    return generateScoreBoard(compare: (a, b) => b.hp.compareTo(a.hp));
  }

  String generateScoreBoard ({int compare (Player a, Player b), String heading: "Score board"}) {
    String stat = "\n$heading:\n";

    if (compare != null) {
      _playerList.sort(compare);
    }

    for (Player player in _playerList) {
      stat += player.toString() + "\n";
    }

    return stat;
  }
}
