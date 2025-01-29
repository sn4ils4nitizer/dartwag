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
            Text('Name: ${widget.character.name ?? "Unknown"}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Species: ${widget.character.species ?? "Unknown"}'),
            Text('Faction: ${widget.character.faction ?? "Unknown"}'),
            Text('Archetype: ${widget.character.archetype ?? "Unknown"}'),
            SizedBox(height: 20),

            // Attributes
            Text('Attributes:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...widget.character.attributes.entries.map((entry) {
              return Text('${entry.key}: ${entry.value}');
            }).toList(),
            SizedBox(height: 20),

            // Skills
            Text('Skills:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...widget.character.skills.entries.map((entry) {
              return Text('${entry.key}: ${entry.value}');
            }).toList(),
            SizedBox(height: 20),

            // Inventory
            Text('Inventory:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            if (widget.character.inventory.isEmpty)
              Text('No items in inventory.'),
            ...widget.character.inventory.map((item) {
              return ListTile(
                title: Text(item.getName ?? "unkown item"),
                subtitle: Text(item is Weapons ? 'Weapon' : 'Armor'),
                trailing: Text('Value: ${item.getValue ?? 0}'),
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
      Type.ranged,
      Rarity.rare,
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
        weapon.name ?? "unknown weapon",
        weapon.value ?? 0,
        weapon.getType,
        weapon.getRarity,
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
        armor.name ?? "unknown armor",
        armor.value ?? 0,
        armor.ar,
        armor.traits,
      );
    });
  }
}
