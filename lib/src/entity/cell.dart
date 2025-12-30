import 'dart:math';

/// One cell in Conway's game of life
final class Cell {
  /// Whether the cell is alive
  late bool _isAlive;

  /// One cell in Conway's game of life.
  ///
  /// Set a random life status on initializing.
  /// Set a life status directly during initialization with [Cell.isAlive].
  Cell() {
    _isAlive = Random().nextBool();
  }

  /// One cell in Conway's game of life.
  ///
  /// Set a value for testing purposes
  ///
  /// [_isAlive] determines whether this [Cell] is alive.
  ///
  /// Example: Create a living [Cell] with
  /// ```dart
  /// var cell = Cell.isAlive(true);
  /// print(cell.isAlive); // true
  /// ```
  Cell.isAlive(this._isAlive);

  /// Whether this [Cell] is alive.
  bool get isAlive => _isAlive;

  /// Clones the cell
  ///
  /// Returns new [Cell] with the same status.
  Cell get clone => Cell.isAlive(_isAlive);

  /// Calculates the live status by setting the current number of living neighbor [Cell]s.
  ///
  /// A cell can have 0 to 8 living neighbors.
  ///
  /// Example:
  /// ```dart
  /// var cell = Cell.isAlive(true);
  /// cell.simulateStep(neighborsLiving: 1);
  /// print(cell.isAlive); // false
  /// ```
  void simulateStep({required int neighborsLiving}) {
    if ((_isAlive && neighborsLiving == 2) || neighborsLiving == 3) {
      _isAlive = true;
    } else {
      _isAlive = false;
    }
  }
}
