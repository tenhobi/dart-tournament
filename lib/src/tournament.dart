import 'dart:math';
import 'dart:async';
import 'dart:io';

import 'participant/participant.dart';
import 'participant/magician.dart';
import 'participant/warrior.dart';
import 'participant/peasant.dart';
import 'name.dart';

/// Status of tournament.
enum TournamentStatus {
  EMPTY,
  INPROGRESS,
  ENDED
}

class Tournament {

  /// List of players of the current tournament.
  List<Participant> _playerList;

  /// Current round of the current tournament.
  int _round;

  /// Status of the current tournament.
  TournamentStatus status;

  static int tournamentCounter = 0;

  /// Attempt to start a tournament.
  void start ([final int playerCount = 7]) {
    if (playerCount <= 0) {
      status = TournamentStatus.EMPTY;
    }

    switch (status) {
      case TournamentStatus.EMPTY:
        stdout.writeln("Tournament is empty.");
        break;

      case TournamentStatus.INPROGRESS:
        stdout.writeln("Tournament is running.");
        break;

      default:
        _init(playerCount);
        _loop();
    }
  }

  /// Initialize a tournament.
  void _init (final int playerCount) {
    status = TournamentStatus.INPROGRESS;
    _round = 1;
    _playerList = <Participant>[];
    tournamentCounter++;

    // Create an instance for each participant in tournament.
    for (int i = 0; i < playerCount; i++) {
      Participant player;

      switch (new Random().nextInt(6)) {
        case 0:
          player = new Magician(Name.generate());
          break;

        case 1:
          player = new Warriror(Name.generate());
          break;

        default:
          player = new Peasant(Name.generate());
      }

      _playerList.add(player);
    }

    stdout.write(generateScoreBoard(heading: "Tournament is starting with $playerCount players"));
  }

  /// Tournament's main game loop.
  void _loop () {
    // Keeps track of people who was alive at the start of the round.
    List<Participant> playerList = <Participant>[]
      ..addAll(_playerList.where((Participant player) => (player.hp > 0)));

    if (playerList.length <= 1) {
      status = TournamentStatus.ENDED;

      stdout.write("""

==============

""");

      if (playerList.length == 1) {
        stdout.writeln("The winner of the tournament is ${_playerList.firstWhere((Participant player) => (player.hp > 0))}\n");
      } else {
        stdout.writeln("No one survived, no one won.\n");
      }

      stdout.write(generateScoreBoard(compare: (Participant a, Participant b) => b.hp.compareTo(a.hp)));

      // Clear the participant list.
      _playerList = <Participant>[];

      return;
    }

    stdout.write("""

  --- Round $_round
  --- with ${playerList.length} players

""");

    _round++;

    for (Participant player in playerList) {
      Participant target;

      do {
        target = playerList.elementAt(new Random().nextInt(playerList.length));
      } while (player == target);

      player.attack(target);
    }

    new Future<dynamic>.delayed(const Duration(seconds: 1), _loop);
  }

  String toString () {
    return generateScoreBoard(compare: (Participant a, Participant b) => b.hp.compareTo(a.hp));
  }

  String generateScoreBoard ({int compare (Participant a, Participant b), final String heading = "Score board"}) {
    String stat = "$heading:\n";

    if (compare != null) {
      _playerList.sort(compare);
    }

    StringBuffer sb = new StringBuffer(stat);

    for (Participant player in _playerList) {
      sb.writeln(player.generateStats());
    }

    return sb.toString();
  }
}
