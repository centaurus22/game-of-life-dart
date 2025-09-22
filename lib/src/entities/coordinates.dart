/// A coordinate pair with an x and y value.
abstract class Coordinates {
  /// The x value.
  late int _x;

  /// The y value.
  late int _y;

  int get x => _x;
  int get y => _y;
}

/// A value pair that represents two dimensions.
final class Dimensions extends Coordinates {
  Dimensions();

  ///Initialize this by setting the dimensions directly.
  ///
  /// @param x The width.
  /// @param y The height.
  /// @throws ArgumentError if one of the dimensions are not larger than zero.
  Dimensions.set({required int x, required int y}) {
    _x = x;
    _y = y;
  }

  /// The width of this.
  ///
  /// Must be called than this was initialized by the default constructor.
  /// @throws [ArgumentError] if it ist not larger than zero.
  set x(int x) {
    if (x <= 0) {
      throw ArgumentError(_message(value: 'width'));
    }
    _x = x;
  }

  /// The height of this.
  ///
  /// Must be called than this was initialized by the default constructor.
  /// @throws [ArgumentError] if it ist not larger than zero.
  set y(int y) {
    if (y <= 0) {
      throw ArgumentError(_message(value: 'height'));
    }
    _y = y;
  }

  String _message({required String value}) {
    return 'The $value of the grid must be larger than zero';
  }
}

/// A value pair that represents a coordinate pair.
final class Position extends Coordinates {
  ///Initialize this
  ///
  ///@parameter x The column
  ///@parameter y The row
  Position.set({required int x, required int y}) {
    _x = x;
    _y = y;
  }

  set x(int x) => _x = x;
  set y(int y) => _y = y;

  /// A new [Position] one row above and one column to the left (upper left)
  ///
  /// @return The new position
  Position uL() => Position.set(x: _x - 1, y: _y + 1);

  /// A new [Position]  one row above (upper center)
  ///
  /// @return The new position
  Position uC() => Position.set(x: _x, y: _y + 1);

  /// A new [Position] one row above and one column to the right (upper right)
  ///
  /// @return The new position
  Position uR() => Position.set(x: _x + 1, y: _y + 1);

  /// A new [Position] one column to the left (middle left)
  ///
  /// @return The new position
  Position mL() => Position.set(x: _x - 1, y: _y);

  /// A new [Position] one column to the right (middle right)
  ///
  /// @return The new position
  Position mR() => Position.set(x: _x + 1, y: _y);

  /// A new [Position] one row down and one column to the left (lower left)
  ///
  /// @return The new position
  Position lL() => Position.set(x: _x - 1, y: _y - 1);

  /// A new [Position] one row down and one column to the left (lower center)
  ///
  /// @return The new position
  Position lC() => Position.set(x: _x, y: _y - 1);

  /// A new [Position] one row down and one column to the left (lower right)
  ///
  /// @return The new position
  Position lR() => Position.set(x: _x + 1, y: _y - 1);
}
