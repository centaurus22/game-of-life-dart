import 'package:game_of_life_dart/src/entities/cell.dart';
import 'package:game_of_life_dart/src/entities/coordinates.dart';

/// The cell grid in Conway's Game of Life
final class Grid {
  /// The cells on this grid
  List<List<Cell>> _cells = [[]];

  late Dimensions _dimensions;

  /// The [height] and [width] can not be negative
  Grid({required int height, required int width}) {
    _cells = List.filled(
      height,
      List.filled(width, Cell(), growable: false),
      growable: false,
    );

    _dimensions = Dimensions.set(x: width, y: height);
  }

  /// Set the status of every cell. For testing purposes only.
  Grid.cells(List<List<bool>> cells) {
    _cells = cells
        .map((row) => row.map((b) => Cell.isAlive(b)).toList(growable: false))
        .toList(growable: false);

    _dimensions = Dimensions();
    _dimensions.y = cells.length;
    _dimensions.x = cells[0].length;
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

    for (var row = 0; row < _dimensions.y; row++) {
      for (var column = 0; column < _dimensions.x; column++) {
        var position = Position.Set(y: row, x: column);
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

    _cells[position.y][position.x].nextStepCalculate(
      neighborsLiving: neighborsLiving,
    );
  }

  int _isAliveAsIntOn({
    required Position position,
    required List<List<Cell>> cellsTemp,
  }) {
    if (position.x == -1) {
      position.x = _dimensions.x - 1;
    } else if (position.x == _dimensions.x) {
      position.x = 0;
    }

    if (position.y == -1) {
      position.y = _dimensions.y - 1;
    } else if (position.y == _dimensions.y) {
      position.y = 0;
    }

    return cellsTemp[position.y][position.x].isAlive ? 1 : 0;
  }
}
