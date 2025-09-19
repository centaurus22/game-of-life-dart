import 'dart:math';

/// One cell in Conway's game of life
/// 
/// Setting whether the cell is alive is only for testing purposes
final class Cell {
  //Whether the cell is alive
  bool isAlive = false;

  Cell() {
    isAlive = Random().nextBool();
  }

  ///Calculate the live status by setting the current number of live neighbors
  ///
  ///A cell can have 0 to 9 live neighbors
  void nextStepCalculate(int neighborsLiving) {
    if (neighborsLiving >= 2) {
      isAlive = true;
    } else {
      isAlive = false;
    }
  }
}