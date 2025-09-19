/// The cell grid in Conway's Game of Life
class Grid {
  //The cells on this grid
  List<List<bool>> cells = [[]];

  /// The [height] and [width] can not be negative
  Grid({required int height, required int width}) {
    cells = List.filled(height, List.filled(width, true));
  }
  /// Get the status of every cell
  List<List<bool>> get asBools => cells;
}