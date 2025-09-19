import 'package:game_of_life_dart/src/entities/cell.dart';

/// The cell grid in Conway's Game of Life
class Grid {
  /// The cells on this grid
  List<List<Cell>> _cells = [[]];

  /// The [height] and [width] can not be negative
  Grid({required int height, required int width}) {
    _cells = List.filled(
      height,
      List.filled(width, Cell(), growable: false),
      growable: false
    );
  }
  
  /// Get the status of every cell
  List<List<bool>> get asBools {
    return _cells.map((row) => row.map((c) => c.isAlive).toList()).toList();
  }
}