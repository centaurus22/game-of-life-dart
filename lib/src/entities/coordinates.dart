abstract class Coordinates {
  late int _x;
  late int _y;

  int get x => _x;
  int get y => _y;
}

final class Dimensions extends Coordinates {
  Dimensions();
  Dimensions.set({required int x, required int y}) {
    this.x = x;
    this.y = y;
  }

  set x(int x) {
    if (x <= 0) {
      throw ArgumentError(_message(value: 'width'));
    }
    _x = x;
  }

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

final class Position extends Coordinates {
  Position.Set({required int x, required int y}) {
    _x = x;
    _y = y;
  }

  set x(int x) => _x = x;
  set y(int y) => _y = y;

  /// This position shifted one row above and one column to the left (upper left)
  Position uL() => Position.Set(x: _x - 1, y: _y + 1);

  /// This position shifted one row above (upper center)
  Position uC() => Position.Set(x: _x, y: _y + 1);

  /// This position shifted one row above and one column to the right (upper right)
  Position uR() => Position.Set(x: _x + 1, y: _y + 1);

  /// This position shifted one column to the left (middle left)
  Position mL() => Position.Set(x: _x - 1, y: _y);

  /// This position shifted one column to the right (middle right)
  Position mR() => Position.Set(x: _x + 1, y: _y);

  /// This position shifted one row down and one column to the left (lower left)
  Position lL() => Position.Set(x: _x - 1, y: _y - 1);

  /// This position shifted one row down and one column to the left (lower center)
  Position lC() => Position.Set(x: _x, y: _y - 1);

  /// This position shifted one row down and one column to the left (lower right)
  Position lR() => Position.Set(x: _x + 1, y: _y - 1);
}
