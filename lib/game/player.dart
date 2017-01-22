class Player {
  int _hp = 0;
  String _name;

  Player (this._name, this._hp) {}

  String toString () {
    return "Player '${this._name}'";
  }
}
