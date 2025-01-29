import 'package:flutter/material.dart';
import 'package:wag_flutter_version/models/character.dart'; // Import Character class
import 'package:wag_flutter_version/screens/character_screen.dart'; // Import CharacterScreen

void main() {
  runApp(MaterialApp(
    home: CharacterScreen(
      character: Character(
        'John Doe',
        'Human',
        'Imperium',
        {'Hero', 'Leader'},
        'Soldier',
        {
          "strength": 5,
          "toughness": 4,
          "agility": 3,
          "initiative": 4,
          "willpower": 6,
          "intellect": 5,
          "fellowship": 7,
          "speed": 4,
        },
        {
          "athletics": 3,
          "awareness": 4,
          "ballisticSKill": 5,
          "cunning": 2,
          "deception": 3,
          "insight": 4,
          "intimidation": 5,
          "investigation": 3,
          "leadership": 6,
          "medicae": 2,
          "persuasion": 4,
          "pilot": 3,
          "psychicMastery": 0,
          "scholar": 2,
          "stealth": 3,
          "survival": 4,
          "tech": 3,
          "weaponsSkill": 5,
        },
      ),
    ),
  ));
}
