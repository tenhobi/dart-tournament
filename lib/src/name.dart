import 'dart:math';

final List<String> _firstNames = [
  "Issac",
  "Vome",
  "Aladin",
  "Emmet",
  "Ivan",
  "Edward",
  "Honzík",
  "David",
  "Daenerys",
  "John",
  "Ellaria",
  "Cercei",
  "Oberyn",
  "Ramsay",
  "Roose",
  "Samwell"
];

final List<String> _lastNames = [
  "the Rock",
  "the Slayer",
  "the Magician",
  "Woodman",
  "Fireman",
  "Skywalker",
  "the Speedster",
  "the Kingslayer",
  "Targaryen",
  "Sand",
  "Snow",
  "Flowers",
  "Hill",
  "Pyke",
  "Rivers",
  "Stone",
  "Storm",
  "Waters"
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
