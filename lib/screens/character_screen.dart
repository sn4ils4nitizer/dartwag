import 'package:flutter/material.dart';
import 'package:wag_flutter_version/models/armor.dart';
import 'package:wag_flutter_version/models/weapons.dart';
import 'package:wag_flutter_version/models/character.dart';

class CharacterScreen extends StatefulWidget {
  final Character character;

  CharacterScreen({required this.character});

  @override
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Character Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Character Details
            Text('Name: ${widget.character._name ?? "Unknown"}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Species: ${widget.character._species ?? "Unknown"}'),
            Text('Faction: ${widget.character._faction ?? "Unknown"}'),
            Text('Archetype: ${widget.character._archetype ?? "Unknown"}'),
            SizedBox(height: 20),

            // Attributes
            Text('Attributes:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...widget.character._attributes.entries.map((entry) {
              return Text('${entry.key}: ${entry.value}');
            }).toList(),
            SizedBox(height: 20),

            // Skills
            Text('Skills:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...widget.character._skills.entries.map((entry) {
              return Text('${entry.key}: ${entry.value}');
            }).toList(),
            SizedBox(height: 20),

            // Inventory
            Text('Inventory:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            if (widget.character._inventory.isEmpty)
              Text('No items in inventory.'),
            ...widget.character._inventory.map((item) {
              return ListTile(
                title: Text(item.name),
                subtitle: Text(item is Weapons ? 'Weapon' : 'Armor'),
                trailing: Text('Value: ${item.value}'),
              );
            }).toList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItemToInventory,
        child: Icon(Icons.add),
      ),
    );
  }

  void _addItemToInventory() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Item to Inventory'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Add Weapon'),
                onTap: () {
                  Navigator.pop(context);
                  _addWeapon();
                },
              ),
              ListTile(
                title: Text('Add Armor'),
                onTap: () {
                  Navigator.pop(context);
                  _addArmor();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _addWeapon() {
    // Example weapon data (you can replace this with a form or input fields)
    final weapon = Weapons(
      'Plasma Gun',
      150,
      Type.Ranged,
      Rarity.Rare,
      10,
      12,
      24,
      36,
      2,
      3,
      3,
      {'Energy', 'High Damage'},
      {'Weapon', 'Ranged'},
    );

    setState(() {
      widget.character.addWeapons(
        weapon.name,
        weapon.value,
        weapon.type,
        weapon.rarity,
        weapon.dmg,
        weapon.rSht,
        weapon.rMed,
        weapon.rLng,
        weapon.ed,
        weapon.ap,
        weapon.salvo,
        weapon.traits,
        weapon.keywords,
      );
    });
  }

  void _addArmor() {
    // Example armor data (you can replace this with a form or input fields)
    final armor = Armor(
      'Power Armor',
      200,
      8,
      {'Heavy', 'Protective'},
    );

    setState(() {
      widget.character.addArmor(
        armor.name,
        armor.value,
        armor.ar,
        armor.traits,
      );
    });
  }
}
