import 'item.dart';

enum Type { ranged, melee }

enum Rarity { common, uncommon, rare, veryRare, nearImpossible }

class Weapons extends Item {
  final Type type;
  final Rarity rarity;
  int _dmg = 0;
  int _rSht = 0;
  int _rMed = 0;
  int _rLng = 0;
  int _ed = 0;
  int _ap = 0;
  int _salvo = 0;

  var _traits = <String>{};
  var _keywords = <String>{};

  Weapons(
      String name, // from Item
      int value, // from Item
      this.type,
      this.rarity,
      this._dmg,
      this._rSht,
      this._rMed,
      this._rLng,
      this._ed,
      this._ap,
      this._salvo,
      this._traits,
      this._keywords)
      : super(name, value);

  String? get name => super.getName;
  int? get value => super.getValue;
  Type get getType => type;
  Rarity get getRarity => rarity;
  int get dmg => _dmg;
  int get rSht => _rSht;
  int get rMed => _rMed;
  int get rLng => _rLng;
  int get ed => _ed;
  int get ap => _ap;
  int get salvo => _salvo;
  Set<String> get traits => _traits;
  Set<String> get keywords => _keywords;
}
