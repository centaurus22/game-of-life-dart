import 'dart:math';

/// One cell in Conway's game of life
/// 
/// Setting whether the cell is alive is only for testing purposes
final class Cell {
  /// Whether the cell is alive
  late bool _isAlive;

  Cell() {
    _isAlive = Random().nextBool();
  }

  Cell.isAlive(bool isAlive);

  bool get isAlive => _isAlive;

  /// Calculate the live status by setting the current number of live neighbors
  ///
  /// A cell can have 0 to 8 live neighbors.
  void nextStepCalculate({required int neighborsLiving}) {
    if (neighborsLiving == 2 || neighborsLiving == 3) {
      _isAlive = true;
    } else {
      _isAlive = false;
    }
  }
}