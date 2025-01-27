import 'weapons.dart';
import 'armor.dart';

class Character {
  String? name;
  String? species;
  String? faction;
  var keywords = <String>{};
  String? archetype;
  List<Item> inventory = {};

  var attributes = {
    "strength": 0,
    "toughness": 0,
    "agility": 0,
    "initiative": 0,
    "willpower": 0,
    "intellect": 0,
    "fellowship": 0,
    "speed": 0,
  };

  var skills = {
    "athletics": 0,
    "awareness": 0,
    "ballisticSKill": 0,
    "cunning": 0,
    "deception": 0,
    "insight": 0,
    "intimidation": 0,
    "investigation": 0,
    "leadership": 0,
    "medicae": 0,
    "persuasion": 0,
    "pilot": 0,
    "psychicMastery": 0,
    "scholar": 0,
    "stealth": 0,
    "survival": 0,
    "tech": 0,
    "weaponsSkill": 0,
  };
}
