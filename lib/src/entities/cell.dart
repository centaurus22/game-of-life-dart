import 'dart:math';

/// One cell in Conway's game of life
final class Cell {
  /// Whether the cell is alive
  late bool _isAlive;

  /// Set a random value on initializing
  Cell() {
    _isAlive = Random().nextBool();
  }

  /// Set a value for testing purposes
  ///
  /// @param _isAlive Whether this cell is alive
  Cell.isAlive(this._isAlive);

  /// Whether this cell is alive
  bool get isAlive => _isAlive;

  /// Calculate the live status by setting the current number of live neighbors
  ///
  /// A cell can have 0 to 8 live neighbors.
  void nextStepCalculate({required int neighborsLiving}) {
    if ((_isAlive && neighborsLiving == 2) || neighborsLiving == 3) {
      _isAlive = true;
    } else {
      _isAlive = false;
    }
  }

  /// Clones the cell
  ///
  /// @return A new [Cell] with the same status.
  Cell clone() {
    return Cell.isAlive(_isAlive);
  }
}
