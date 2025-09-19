import 'package:game_of_life_dart/src/entities/cell.dart';

/// The cell grid in Conway's Game of Life
class Grid {
  /// The cells on this grid
  List<List<Cell>> _cells = [[]];

  late int _height;

  late int _width;

  /// The [height] and [width] can not be negative
  Grid({required int height, required int width}) {
    _cells = List.filled(
      height,
      List.filled(width, Cell(), growable: false),
      growable: false,
    );

    _height = height;
    _width = width;
  }

  /// Set the status of every cell. For testing purposes only.
  Grid.cells(List<List<bool>> cells) {
    _cells = cells
        .map((row) => row.map((c) => Cell.isAlive(c)).toList(growable: false))
        .toList(growable: false);

    _height = cells.length;
    _width = cells[0].length;
  }

  /// Get the status of every cell
  List<List<bool>> get asBools {
    return _cells
        .map((row) => row.map((c) => c.isAlive).toList(growable: false))
        .toList(growable: false);
  }

  /// Calculate the live status of all the cells of the grid.
  void nextStepCalculate() {
    var cellsTemp = _cells
        .map((row) => row.map((c) => c.clone()).toList(growable: false))
        .toList(growable: false);

    for (var row = 0; row < _height; row++) {
      for (var col = 0; col < _width; col++) {
        _nextStepCalculateOn(row: row, col: col, cellsTemp: cellsTemp);
      }
    }
  }

  void _nextStepCalculateOn({
    required int row,
    required int col,
    required List<List<Cell>> cellsTemp,
  }) {
    var neighborsLiving =
        _isAliveAsIntOn(cellsTemp: cellsTemp, row: row - 1, col: col - 1) +
        _isAliveAsIntOn(cellsTemp: cellsTemp, row: row - 1, col: col) +
        _isAliveAsIntOn(cellsTemp: cellsTemp, row: row - 1, col: col + 1) +
        _isAliveAsIntOn(cellsTemp: cellsTemp, row: row, col: col - 1) +
        _isAliveAsIntOn(cellsTemp: cellsTemp, row: row, col: col + 1) +
        _isAliveAsIntOn(cellsTemp: cellsTemp, row: row + 1, col: col - 1) +
        _isAliveAsIntOn(cellsTemp: cellsTemp, row: row + 1, col: col) +
        _isAliveAsIntOn(cellsTemp: cellsTemp, row: row + 1, col: col + 1);

    _cells[row][col].nextStepCalculate(neighborsLiving: neighborsLiving);
  }

  int _isAliveAsIntOn({
    required int row,
    required int col,
    required List<List<Cell>> cellsTemp,
  }) {
    if (row == -1) {
      row = _height - 1;
    } else if (row == _height) {
      row = 0;
    }

    if (col == -1) {
      col = _width - 1;
    } else if (col == _width) {
      col = 0;
    }

    return cellsTemp[row][col].isAlive ? 1 : 0;
  }
}
