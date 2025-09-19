import 'dart:math';

/// One cell in Conway's game of life
final class Cell {
  //Whether the cell is alive
  bool isAlive = false;

  Cell() {
    isAlive = Random().nextBool();
  }

  void nextStepCalculate(int neighborsLiving) {
    isAlive = false;
  }
}