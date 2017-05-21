import 'dart:math';

/// Creates a random name generator.
class Name {

  /// Database of first names.
  static const List<String> _firstNames = const <String>[
    'Issac',
    'Vome',
    'Aladin',
    'Emmet',
    'Ivan',
    'Edward',
    'Honzík',
    'David',
    'Daenerys',
    'John',
    'Ellaria',
    'Cercei',
    'Oberyn',
    'Ramsay',
    'Roose',
    'Samwell'
  ];

  /// Database of last names.
  static const List<String> _lastNames = const <String>[
    'the Rock',
    'the Slayer',
    'the Magician',
    'Woodman',
    'Fireman',
    'Skywalker',
    'the Speedster',
    'the Kingslayer',
    'Targaryen',
    'Sand',
    'Snow',
    'Flowers',
    'Hill',
    'Pyke',
    'Rivers',
    'Stone',
    'Storm',
    'Waters'
  ];

  /// Generate random name containing first name and last name.
  static String generate () {
    return '${generateFirst()} ${generateLast()}';
  }

  /// Generate random first name.
  static String generateFirst () {
    return _firstNames[new Random().nextInt(_firstNames.length)];
  }

  /// Generate random last name.
  static String generateLast () {
    return _lastNames[new Random().nextInt(_lastNames.length)];
  }
}
