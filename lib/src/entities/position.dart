final class Position {
  int row;

  int column;

  Position({required this.row, required this.column});

  Position uL() => Position(row: row - 1, column: column - 1);
  Position uC() => Position(row: row - 1, column: column);
  Position uR() => Position(row: row - 1, column: column + 1);
  Position mL() => Position(row: row, column: column - 1);
  Position mR() => Position(row: row, column: column + 1);
  Position lL() => Position(row: row + 1, column: column - 1);
  Position lC() => Position(row: row + 1, column: column);
  Position lR() => Position(row: row + 1, column: column + 1);
}
