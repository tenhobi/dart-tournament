import 'dart:math';

/// Database of first names.
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

/// Database of last names.
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

/// Creates a random name generator.
class Name {

  /// Generate random name containing first name and last name.
  String generate () {
    return "${generateFirst()} ${generateLast()}";
  }

  /// Generate random first name.
  String generateFirst () {
    return _firstNames[new Random().nextInt(_firstNames.length)];
  }

  /// Generate random last name.
  String generateLast () {
    return _lastNames[new Random().nextInt(_lastNames.length)];
  }
}
