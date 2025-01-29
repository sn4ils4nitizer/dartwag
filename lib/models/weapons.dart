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

  //Methods
  Type getType() {
    return type;
  }

  Rarity getRarity() {
    return rarity;
  }

  String? getWeaponName() {
    return getName;
  }

  int? getWeaponValue() {
    return getValue;
  }

  int getDmg() {
    return _dmg;
  }

  int getRSht() {
    return _rSht;
  }

  int getRMed() {
    return _rMed;
  }

  int getRLng() {
    return _rLng;
  }

  int getEd() {
    return _ed;
  }

  int getAp() {
    return _ap;
  }

  int getSalvo() {
    return _salvo;
  }

  Set<String> getTraits() {
    return _traits;
  }

  Set<String> getKeywords() {
    return _keywords;
  }
}
