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
  /// A value pair that represents two dimensions.
  /// 
  /// Use [Dimensions.set] to set the values directly.
  /// Use [Dimensions.fromMap] to initialize this from a [Map].
  Dimensions();

  /// A value pair that represents two dimensions.
  /// 
  /// Initialize this by setting the dimensions directly.
  ///
  /// Requires the width [x] and the height [y].
  /// Throws an [ArgumentError] if one of the dimensions is zero or negative.
  /// 
  /// Use [Dimensions.fromMap] to initialize this from a [Map].
  /// 
  /// Example: Span an area with 2 elements in the x direction and 4 elements
  /// in the y-direction:
  /// ```dart
  /// var area = Dimensions.set(x: 2, y: 4);
  /// ```
  Dimensions.set({required int x, required int y}) {
    _x = x;
    _y = y;
  }

  /// Initialize this from a [Map].
  ///
  /// Throws an [ArgumentError] if the required keys `x` and `y` are
  /// not in the [Map] or one of the dimensions is zero or negative.
  /// 
  /// Example:
  /// ```dart
  /// Map<String,int> dimensionMap = {'x': 2, 'y': 4};
  /// var area = Dimensions.fromMap(dimensionMap);
  /// ```
  static Dimensions fromMap(Map<String, int> dimensions) {
    if (!dimensions.containsKey('x')) {
      _missingValue('x');
    }

    if (!dimensions.containsKey('y')) {
      _missingValue('y');
    }

    return Dimensions.set(x: dimensions['x']!, y: dimensions['y']!);
  }

  /// The width of this [Dimensions].
  ///
  /// Must be called when this was initialized by the default constructor.
  /// 
  /// Requires the value as an integer.
  /// Throws an [ArgumentError] if [x] is zero or negative.
  /// 
  /// Example:
  /// ```dart
  /// var area = Dimensions();
  /// area.x = 5;
  /// ```
  set x(int x) {
    if (x <= 0) {
      _wrongValue('x');
    }
    _x = x;
  }

  /// The width of this [Dimensions].
  ///
  /// Must be called when this was initialized by the default constructor.
  /// 
  /// Requires the value as an integer.
  /// Throws an [ArgumentError] if [y] is zero or negative.
  /// 
  /// Example:
  /// ```dart
  /// var area = Dimensions();
  /// area.y = 5;
  /// ```
  set y(int y) {
    if (y <= 0) {
      _wrongValue('y');
    }
    _y = y;
  }

  static void _missingValue(String value) {
    throw ArgumentError('The map must contain an $value value (key "$value")');
  }

  void _wrongValue(String value) {
    throw ArgumentError(
      'The $value value of the grid must be larger than zero',
    );
  }
}

/// A value pair that represents a coordinate pair.
final class Position extends Coordinates {
  /// A value pair that represents a coordinate pair.
  ///
  /// Requires an [x] value and a [y] value.
  Position.set({required int x, required int y}) {
    _x = x;
    _y = y;
  }

  set x(int x) => _x = x;
  set y(int y) => _y = y;

  /// A new [Position] one row above and one column to the left (upper left)
  Position get uL => Position.set(x: _x - 1, y: _y + 1);

  /// A new [Position]  one row above (upper center)
  Position get uC => Position.set(x: _x, y: _y + 1);

  /// A new [Position] one row above and one column to the right (upper right)
  Position get uR => Position.set(x: _x + 1, y: _y + 1);

  /// A new [Position] one column to the left (middle left)
  Position get mL => Position.set(x: _x - 1, y: _y);

  /// A new [Position] one column to the right (middle right)
  Position get mR => Position.set(x: _x + 1, y: _y);

  /// A new [Position] one row down and one column to the left (lower left)
  Position get lL => Position.set(x: _x - 1, y: _y - 1);

  /// A new [Position] one row down and one column to the left (lower center)
  Position get lC => Position.set(x: _x, y: _y - 1);

  /// A new [Position] one row down and one column to the left (lower right)
  Position get lR => Position.set(x: _x + 1, y: _y - 1);
}
