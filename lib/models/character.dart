import 'package:wag_flutter_version/models/armor.dart';
import 'package:wag_flutter_version/models/weapons.dart';

import 'item.dart';
// import 'weapons.dart';
// import 'armor.dart';

class Character {
  String? _name;
  String? _species;
  String? _faction;
  var _keywords = <String>{};
  String? _archetype;
  List<Item> _inventory = [];

  var _attributes = {
    "strength": 0,
    "toughness": 0,
    "agility": 0,
    "initiative": 0,
    "willpower": 0,
    "intellect": 0,
    "fellowship": 0,
    "speed": 0,
  };

  var _skills = {
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

  Character(
    this._name,
    this._species,
    this._faction,
    this._keywords,
    this._archetype,
    this._attributes,
    this._skills,
  );

  void addWeapons(
      String name,
      int value,
      Type type,
      Rarity rarity,
      int dmg,
      int rSht,
      int rMed,
      int rLng,
      int ed,
      int ap,
      int salvo,
      Set<String> traits,
      Set<String> keywords) {
    _inventory.add(Weapons(name, value, type, rarity, dmg, rSht, rMed, rLng, ed,
        ap, salvo, traits, keywords));
  }

  void addArmor(String name, int value, int ar, Set<String> traits) {
    _inventory.add(Armor(name, value, ar, traits));
  }

  String? get name => _name;
  String? get species => _species;
  String? get faction => _faction;
  Set<String> get keywords => _keywords;
  String? get archetype => _archetype;
  List<Item> get inventory => _inventory;

  Map<String, int> get attributes => _attributes;
  Map<String, int> get skills => _skills;

  int? getAttribute(String key) => _attributes[key];
  int? getSkill(String key) => _skills[key];

  set faction(String? value) => _faction;
  void addKeywords(String value) {
    _keywords.add(value);
  }

  set archetype(String? value) => _archetype;
}
