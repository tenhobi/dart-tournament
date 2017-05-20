import 'dart:io';
import 'dart:math';

import 'participant.dart';

/// Type of [Participant] that can use magic.
class Magician extends Participant {

  int _mana;

  Magician ([String name]) : super(name: name, hpRatio: 0.5 + (new Random().nextInt(5 + 1) / 10)) {
    // 3.0 to 4.0 times default damage
    damage = (damage * (3 + (new Random().nextInt(10 + 1) / 10))).toInt();
  }

  /// [Magician] tries to cast a spell, so he uses some amount of [_mana].
  /// If he is not exhausted and he did cast the spell well, he will use the spell to attack the enemy [Participant].
  /// Otherwise he attacks the enemy unarmed.
  @override
  void attack (final Participant player) {
    int magicPower = damage + ((new Random().nextInt(15) == 0) ? damage ~/ 2 : 0);
    int unarmedPower = damage + ((new Random().nextInt(15) == 0) ? damage ~/ 2 : 0);

    // 5 to 15 decrease of mana, 10 % chance to not attack with magic.
    if (((_mana -= (new Random().nextInt(10 + 1) + 5)) > 0) && (new Random().nextInt(10) != 0)) {
      player.defend(magicPower);
      stdout.writeln("$this is attacking $player with magic power of $magicPower!");
    } else {
      player.defend(unarmedPower);
      stdout.writeln("$this is attacking $player unarmed with power of $unarmedPower!");
    }
  }

  /// When is [Magician] attacked by an enemy, he want to cast a defensive spell, some kind of shield, to prevent the attack.
  /// If he is not exhausted and have a quick reflex, he cast the shield spell.
  /// Otherwise he is attacked.
  @override
  void defend (final int damage) {

    // 10 to 20 decrease of mana, 40 % chance to not defense with magic shield
    if ((_mana -= (new Random().nextInt(10 + 1) + 10)) > 0 && (new Random().nextInt(10 + 1) > 4)) {
      stdout.writeln("... Attack blocked with powerfull magic shield.");
      return;
    }

    hp -= damage;
  }

  /// [Magician] will meditate and restore some [_mana].
  @override
  void rest () {
    // 2 to 7
    _mana += new Random().nextInt(5 + 1) + 2;
  }
}
