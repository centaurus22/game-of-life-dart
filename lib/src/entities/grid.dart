import 'package:game_of_life_dart/src/entities/cell.dart';
import 'package:game_of_life_dart/src/entities/position.dart';

/// The cell grid in Conway's Game of Life
final class Grid {
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
        .map((row) => row.map((b) => Cell.isAlive(b)).toList(growable: false))
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
      for (var column = 0; column < _width; column++) {
        var position = Position(row: row, column: column);
        _nextStepCalculateOn(position: position, cellsTemp: cellsTemp);
      }
    }
  }

  void _nextStepCalculateOn({
    required Position position,
    required List<List<Cell>> cellsTemp,
  }) {
    var neighborsLiving =
        _isAliveAsIntOn(position: position.uL(), cellsTemp: cellsTemp) +
        _isAliveAsIntOn(position: position.uC(), cellsTemp: cellsTemp) +
        _isAliveAsIntOn(position: position.uR(), cellsTemp: cellsTemp) +
        _isAliveAsIntOn(position: position.mL(), cellsTemp: cellsTemp) +
        _isAliveAsIntOn(position: position.mR(), cellsTemp: cellsTemp) +
        _isAliveAsIntOn(position: position.lL(), cellsTemp: cellsTemp) +
        _isAliveAsIntOn(position: position.lC(), cellsTemp: cellsTemp) +
        _isAliveAsIntOn(position: position.lR(), cellsTemp: cellsTemp);

    _cells[position.row][position.column].nextStepCalculate(
      neighborsLiving: neighborsLiving,
    );
  }

  int _isAliveAsIntOn({
    required Position position,
    required List<List<Cell>> cellsTemp,
  }) {
    if (position.row == -1) {
      position.row = _height - 1;
    } else if (position.row == _height) {
      position.row = 0;
    }

    if (position.column == -1) {
      position.column = _width - 1;
    } else if (position.column == _width) {
      position.column = 0;
    }

    return cellsTemp[position.row][position.column].isAlive ? 1 : 0;
  }
}
