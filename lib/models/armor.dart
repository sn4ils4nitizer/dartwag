import 'item.dart';

class Armor extends Item {
  int _ar = 0;
  var _traits = <String>{};

  Armor(
    String? name, //from Item
    int? value, //from Item
    this._ar,
    this._traits,
  ) : super(name, value);

  String? getArmorName() {
    return getName;
  }

  int? getArmorValue() {
    return getValue;
  }

  int getAr() {
    return _ar;
  }

  Set<String> getTraits() {
    return _traits;
  }
}
