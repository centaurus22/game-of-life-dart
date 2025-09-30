import 'dart:io';

import 'char.dart';
import 'color.dart';
import 'dimensions.dart';
import 'screen.dart';

/// Draws and updates the boxes and game grid
class Controller {
  /// [Screen] which directly interacts with the terminal
  final Screen _screen;

  /// Width and Height of the terminal screen
  late Dimensions _dimensions;

  /// Margin between the box border and the upper border of the screen
  final _topMargin = 1;

  /// Margin between the box border and the left border of the screen
  final _rightMargin = 2;

  /// Margin between the box border and the right border of the screen
  final _bottomMargin = 1;

  /// Margin between the box border and the bottom border of the screen
  final _leftMargin = 2;

  /// Width of the box border
  ///
  /// Only 1 is supported
  final _border = 1;

  /// Width of the box without the border
  late int _boxWidth;

  /// Height of the box without the border
  late int _boxHeight;

  /// Initialize the Controller
  ///
  /// @param _screen Screen which directly interacts with the terminal
  Controller(this._screen) {
    _dimensions = _screen.dimensions;
    _boxWidth = _dimensions.width - _leftMargin - _rightMargin - _border * 2;
    _boxHeight = _dimensions.height - _topMargin - _bottomMargin - _border * 2;
  }

  /// Dimensions of the box
  Map<String, int> get dimensions => {'x': _boxWidth * 2, 'y': _boxHeight * 3};

  /// Initializes the terminal
  void setUp() {
    _screen.setUp();
  }

  /// Resets the terminal to default
  void tearDown() {
    sleep(Duration(seconds: 20));
    _screen.tearDown();
  }

  /// Draws a rainbow background
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

  /// Draws the box to the screen
  void drawBox() {
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
          Char.mainHBorder.symbol * _boxWidth +
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
          Char.mainHBorder.symbol * _boxWidth +
          Char.mainLRCorner.symbol,
    );
  }

  /// Draws the state of the [Grid] to the screen
  void drawGrid(List<List<bool>> grid) {
    final height = grid.length;
    final width = grid[0].length;

    _screen.switchToColor(Color.cell.number);

    var gridString = '';

    for (var row = 0; row < height; row += 3) {
      for (var column = 0; column < width; column += 2) {
        gridString += Char.grid(
          _charIndex(grid: grid, column: column, row: row),
        );
      }
    }
    _screen.write(gridString);
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
