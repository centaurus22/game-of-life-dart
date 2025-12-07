import 'dart:async';
import 'dart:io';

import 'char.dart';
import 'color.dart';
import 'dimensions.dart';
import 'screen.dart';

/// The Controller which provides methods for a tui interface
class Controller {
  /// [Screen] which directly interacts with the terminal
  final ScreenInterface _screen;

  /// The width and height of the terminal screen
  late Dimensions _dimensions;

  /// The margin between the box border and the upper border of the screen
  final _topMargin = 1;

  /// The margin between the box border and the left border of the screen
  final _rightMargin = 2;

  /// The margin between the box border and the right border of the screen
  final _bottomMargin = 1;

  /// The margin between the box border and the bottom border of the screen
  final _leftMargin = 2;

  /// The width of the box border
  ///
  /// Only a width of 1 is supported right now
  final int _border = 1;

  /// The Controller which provides methods for a tui interface
  ///
  /// @param _screen Screen which directly interacts with the terminal
  Controller(this._screen) {
    _dimensions = _screen.dimensions;
  }

  /// The usable dimensions of the main box
  Map<String, int> get dimensions {
    final boxDimensions = _calcBoxDimensions();
    return {'x': boxDimensions.width * 2, 'y': boxDimensions.height * 3};
  }

  StreamSubscription<String> get keyStream => _screen.keyStream;

  /// Initializes the terminal
  /// 
  /// * Calculate the usable dimensions of the screen
  /// * Set the terminal settings
  void setUp() {
    _calcBoxDimensions();
    _screen.setUp();
  }

  /// Resets the terminal screen to it's default settings
  void tearDown() {
    _screen.tearDown();
  }

  /// Draws a rainbow background onto the terminal screen
  void drawBackground() {
    final charsPerColor = _charsPerColor(_dimensions.height);

    for (var row = 0; row < _dimensions.height; row++) {
      var colorBackground = _colorBackground(
        charsPerColor: charsPerColor,
        position: row,
      );

      _screen.switchToColor(colorBackground);
      _screen.write(Char.background.symbol * _dimensions.width);
    }
  }

  /// Draws the main box onto the terminal screen
  void drawBox() {
    final boxDimensions = _calcBoxDimensions();
    final boxStartRow = _topMargin;
    final boxEndRow = _dimensions.height - _topMargin - _bottomMargin;

    final boxStartColumn = _leftMargin;
    final boxEndColumn = _dimensions.width - _leftMargin - _rightMargin + 1;

    _screen.switchToColor(Color.box.number);

    _screen.writeAt(
      column: boxStartColumn,
      row: boxStartRow,
      text:
          Char.mainULCorner.symbol +
          Char.mainHBorder.symbol * boxDimensions.width +
          Char.mainURCorner.symbol,
    );

    for (var row = boxStartRow + 1; row < boxEndRow; row++) {
      _screen.writeAt(
        column: boxStartColumn,
        row: row,
        text: Char.mainVBorder.symbol,
      );
      _screen.writeAt(
        column: boxEndColumn,
        row: row,
        text: Char.mainVBorder.symbol,
      );
    }

    _screen.writeAt(
      column: boxStartColumn,
      row: boxEndRow,
      text:
          Char.mainLLCorner.symbol +
          Char.mainHBorder.symbol * boxDimensions.width +
          Char.mainLRCorner.symbol,
    );
  }

  /// Draws the state of the grid onto the terminal screen
  void drawGrid(List<List<bool>> grid) {
    final height = (grid.length / 3).ceil();
    final width = (grid[0].length / 2).ceil();

    _screen.switchToColor(Color.cell.number);
    var gridString = '';
    var column = _leftMargin + _border;
    var row = 0;

    for (var r = 0; r < height; r += 1) {
      gridString = '';

      for (var c = 0; c < width; c += 1) {
        gridString += Char.grid(
          _charIndex(grid: grid, column: c * 2, row: r * 3),
        );
      }

      row = _topMargin + _border + r;
      _screen.writeAt(column: column, row: row, text: gridString);
    }
  }

  Dimensions _calcBoxDimensions() {
    var boxWidth = _dimensions.width - _leftMargin - _rightMargin - _border * 2;
    var boxHeight =
        _dimensions.height - _topMargin - _bottomMargin - _border * 2;

    if (boxWidth < 1 || boxHeight < 1) {
      throw StdoutException("The dimensions of your screen are too small.");
    }

    return (Dimensions(width: boxWidth, height: boxHeight));
  }

  int _charIndex({
    required List<List<bool>> grid,
    required int column,
    required int row,
  }) {
    return _toInt(grid[row][column]) +
        _toInt(grid[row][column + 1]) * 2 +
        _toInt(grid[row + 1][column]) * 4 +
        _toInt(grid[row + 1][column + 1]) * 8 +
        _toInt(grid[row + 2][column]) * 16 +
        _toInt(grid[row + 2][column + 1]) * 32;
  }

  int _toInt(bool value) {
    return value ? 1 : 0;
  }

  double _charsPerColor(int sumChars) {
    if (sumChars <= Color.numberBackgroundColors) {
      return 1;
    }
    return sumChars / Color.numberBackgroundColors;
  }

  int _colorBackground({required double charsPerColor, required int position}) {
    return Color.background()[(position / charsPerColor).floor()];
  }
}
