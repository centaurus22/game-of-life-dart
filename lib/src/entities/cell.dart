import 'dart:math';

/// One cell in Conway's game of life
final class Cell {
  //Whether the cell is alive
  bool _isAlive = false;

  Cell() {
    _isAlive = Random().nextBool();
  }

  /// Wether the cell is alive
  bool get isAlive => _isAlive;
}