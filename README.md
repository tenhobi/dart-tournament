# Dart Tournament

[![Build Status](https://travis-ci.org/HoBi/dart-tournament.svg?branch=master)](https://travis-ci.org/HoBi/dart-tournament)

An experimental console game using Dart focusing autonomous processing of randomly generated simple game data. Also, this game can be used to demonstrate the Dart language.

## How it works

The tournament starts with `x` participiants, in this sample there are 3. Round by round the participiants randomly attacks to other tournament's participiants which defends themselves as the response. The participiants might be of various types, like a magician, warrior etc.

The winner of the tournament is the last player with positive health points or nobody, if every living participiant dies in the last round. 

## Example game output

```
Tournament is starting with 3 players:
Peasant #0 - 'Issac Woodman' - hp: 53/53, damage: 3
Magician #1 - 'Vome the Magician' - hp: 109/109, damage: 28
Warriror #2 - 'Samwell Flowers' - hp: 183/183, damage: 6

  --- Round 1
  --- with 3 players

Issac Woodman (Peasant #0) [53/53] is attacking Samwell Flowers (Warriror #2) [183/183] with power of 3!
Vome the Magician (Magician #1) [109/109] is attacking Issac Woodman (Peasant #0) [53/53] with power of 28!
Samwell Flowers (Warriror #2) [180/183] is attacking Issac Woodman (Peasant #0) [25/53] with power of 6!
... Attack blocked.

  --- Round 2
  --- with 3 players

Issac Woodman (Peasant #0) [25/53] is attacking Vome the Magician (Magician #1) [109/109] with power of 3!
Vome the Magician (Magician #1) [106/109] is attacking Samwell Flowers (Warriror #2) [180/183] with power of 28!
Samwell Flowers (Warriror #2) [152/183] is attacking Issac Woodman (Peasant #0) [25/53] with power of 6!

  --- Round 3
  --- with 3 players

Issac Woodman (Peasant #0) [19/53] is attacking Samwell Flowers (Warriror #2) [152/183] with power of 3!
Vome the Magician (Magician #1) [106/109] is attacking Samwell Flowers (Warriror #2) [149/183] with power of 28!
Samwell Flowers (Warriror #2) [121/183] is attacking Vome the Magician (Magician #1) [106/109] with power of 6!

  --- Round 4
  --- with 3 players

Issac Woodman (Peasant #0) [19/53] is attacking Vome the Magician (Magician #1) [100/109] with power of 3!
Vome the Magician (Magician #1) [97/109] is attacking Issac Woodman (Peasant #0) [19/53] with power of 28!
Samwell Flowers (Warriror #2) [121/183] is attacking Vome the Magician (Magician #1) [97/109] with power of 6!

  --- Round 5
  --- with 2 players

Vome the Magician (Magician #1) [91/109] is attacking Samwell Flowers (Warriror #2) [121/183] with power of 28!
Samwell Flowers (Warriror #2) [93/183] is attacking Vome the Magician (Magician #1) [91/109] with power of 6!

  --- Round 6
  --- with 2 players

Vome the Magician (Magician #1) [85/109] is attacking Samwell Flowers (Warriror #2) [93/183] with power of 42!
Samwell Flowers (Warriror #2) [51/183] is attacking Vome the Magician (Magician #1) [85/109] with power of 6!

  --- Round 7
  --- with 2 players

Vome the Magician (Magician #1) [79/109] is attacking Samwell Flowers (Warriror #2) [51/183] with power of 28!
... Attack blocked.
Samwell Flowers (Warriror #2) [51/183] is attacking Vome the Magician (Magician #1) [79/109] with power of 6!

  --- Round 8
  --- with 2 players

Vome the Magician (Magician #1) [73/109] is attacking Samwell Flowers (Warriror #2) [51/183] with power of 28!
Samwell Flowers (Warriror #2) [23/183] is attacking Vome the Magician (Magician #1) [73/109] with power of 9!

  --- Round 9
  --- with 2 players

Vome the Magician (Magician #1) [64/109] is attacking Samwell Flowers (Warriror #2) [23/183] with power of 28!
Samwell Flowers (Warriror #2) [-5/183] is attacking Vome the Magician (Magician #1) [64/109] with power of 6!

==============

The winner of the tournament is Vome the Magician (Magician #1) [58/109]

Score board:
Magician #1 - 'Vome the Magician' - hp: 58/109, damage: 28
Warriror #2 - 'Samwell Flowers' - hp: -5/183, damage: 6
Peasant #0 - 'Issac Woodman' - hp: -9/53, damage: 3
```

## Contributing

Spotted an error? Something doesn't make sense? You have an excellent idea? [Open an issue](https://github.com/HoBi/dart-tournament/issues/new) or submit PRs.

## License

Licensed under the [MIT License](LICENSE).
