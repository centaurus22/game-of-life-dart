final class Position {
  int row;

  int column;

  Position({required this.row, required this.column});

  /// This position shifted one row above and one column to the left (upper left)
  Position uL() => Position(row: row + 1, column: column - 1);

  /// This position shifted one row above (upper center)
  Position uC() => Position(row: row + 1, column: column);

  /// This position shifted one row above and one column to the right (upper right)
  Position uR() => Position(row: row + 1, column: column + 1);

  /// This position shifted one column to the left (middle left)
  Position mL() => Position(row: row, column: column - 1);

  /// This position shifted one column to the right (middle right)
  Position mR() => Position(row: row, column: column + 1);

  /// This position shifted one row down and one column to the left (lower left)
  Position lL() => Position(row: row - 1, column: column - 1);

  /// This position shifted one row down and one column to the left (lower center)
  Position lC() => Position(row: row - 1, column: column);

  /// This position shifted one row down and one column to the left (lower right)
  Position lR() => Position(row: row - 1, column: column + 1);
}
