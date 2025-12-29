import 'cell.dart';
import 'coordinates.dart';

/// The cell grid in Conway's Game of Life
final class Grid {
  /// The cells on this grid
  late List<List<Cell>> _cells;

  //Height and width of the grid
  late Dimensions _dimensions;

  ///  Initializes the grid with [Cell]s.
  ///
  /// The [Cell]s are randomly alive or dead. Requires the [_dimensions] of
  /// the grid as [Dimensions]. To initialize the grid with boolean values
  /// use [Grid.cells].
  /// 
  /// Example:
  /// ```dart
  /// var area = Dimensions.set(x: 2, y: 4);
  /// var grid = Grid(area);
  /// ```
  Grid(this._dimensions) {
    _cells = List.generate(
      _dimensions.y,
      (_) => List.generate(_dimensions.x, (_) => Cell(), growable: false),
      growable: false,
    );
  }

  /// Set the life status of every [Cell]. For testing purposes only.
  ///
  /// The height and with of the grid must be both larger than zero.
  /// Requires the life status of the [Cell]s as two-dimensional list of booleans.
  /// Throws an [ArgumentError] if the dimensions are zero or negative.
  /// 
  /// Example:
  /// ```dart
  /// var cells = [[true, false], [false, false], [true, true]];
  /// var grid = Grid.cells(cells);
  /// ```
  Grid.cells(List<List<bool>> cells) {
    _cells = _mapList(cells, (b) => Cell.isAlive(b));

    _dimensions = Dimensions();
    _dimensions.y = cells.length;
    _dimensions.x = cells[0].length;
  }

  /// The status of every cell as two dimensional [List] of bools.
  List<List<bool>> get toBools => _mapList(_cells, (c) => c.isAlive);

  /// Calculates the next generation of all the cells on the [Grid].
  void simulateStep() {
    List<List<Cell>> cellsTemp = _mapList(_cells, (c) => c.clone);

    for (var row = 0; row < _dimensions.y; row++) {
      for (var column = 0; column < _dimensions.x; column++) {
        var position = Position.set(y: row, x: column);
        _simulateStepOn(position: position, cellsTemp: cellsTemp);
      }
    }
  }

  void _simulateStepOn({
    required Position position,
    required List<List<Cell>> cellsTemp,
  }) {
    final neighborsLiving =
        _isAliveToIntOn(position: position.uL, cellsTemp: cellsTemp) +
        _isAliveToIntOn(position: position.uC, cellsTemp: cellsTemp) +
        _isAliveToIntOn(position: position.uR, cellsTemp: cellsTemp) +
        _isAliveToIntOn(position: position.mL, cellsTemp: cellsTemp) +
        _isAliveToIntOn(position: position.mR, cellsTemp: cellsTemp) +
        _isAliveToIntOn(position: position.lL, cellsTemp: cellsTemp) +
        _isAliveToIntOn(position: position.lC, cellsTemp: cellsTemp) +
        _isAliveToIntOn(position: position.lR, cellsTemp: cellsTemp);

    _cells[position.y][position.x].simulateStep(
      neighborsLiving: neighborsLiving,
    );
  }

  int _isAliveToIntOn({
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

  List<List<R>> _mapList<E, R>(List<List<E>> list, R Function(E v) function) {
    return list
        .map((row) => row.map((v) => function(v)).toList(growable: false))
        .toList(growable: false);
  }
}
