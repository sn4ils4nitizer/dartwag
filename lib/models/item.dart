class Item {
  String? _name;
  int? _value;

  Item(
    this._name,
    this._value,
  );

  String? get getName => _name;

  int? get getValue => _value;
}
