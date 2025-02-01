import 'package:flutter/material.dart';
import 'package:wag_flutter_version/models/armor.dart';
import 'package:wag_flutter_version/models/weapons.dart';
import 'package:wag_flutter_version/models/character.dart';
import 'package:wag_flutter_version/widgets/cardwidget.dart';
import 'dart:io';

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
          title: Text('Main Menu'),
        ),
        extendBodyBehindAppBar: true,
        body: Stack(children: [
          // Background Image
          Image.asset(
            'assets/images/planet.jpg', // Path to your background image
            fit: BoxFit.cover, // Cover the entire screen
            height: double.infinity,
            width: double.infinity,
          ),
          SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CardWidget(
                    title: "New Character",
                    subtitle: "Noice",
                    imageAssetPath: "assets/images/image.jpg ",
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
