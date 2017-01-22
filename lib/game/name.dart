import 'dart:math';

final List<String> _firstNames = [
  "Issac",
  "Vome",
  "Aladin",
  "Emmet",
  "Ivan",
  "Edward",
  "Honzík"
];

final List<String> _lastNames = [
  "the Rock",
  "the Slayer",
  "the Magician",
  "Woodman",
  "Fireman",
  "Skywalker",
  "the Speedster"
];

class NameGenerator {

  String generate () {
    return "${_randomFirst()} ${_randomLast()}";
  }

  String _randomFirst () {
    return _firstNames[new Random().nextInt(_firstNames.length)];
  }

  String _randomLast () {
    return _lastNames[new Random().nextInt(_lastNames.length)];
  }
}
