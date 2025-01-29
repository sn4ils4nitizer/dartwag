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

  String? get name => super.getName;
  int? get value => super.getValue;
  int get ar => _ar;
  Set<String> get traits => _traits;
}
