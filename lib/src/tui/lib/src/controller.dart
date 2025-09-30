import 'dart:io';

import 'char.dart';
import 'color.dart';
import 'dimensions.dart';
import 'screen.dart';

/// Draws and updates the boxes and game grid
class Controller {
  /// Screen which directly interacts with the terminal
  final Screen _screen;
  /// Width and Height of the terminal screen
  final Dimensions _dimensions;

  final _topMarginGrid = 1;
  final _rightMarginGrid = 2;
  final _bottomMarginGrid = 4;
  final _leftMarginGrid = 2;

  /// Initialize the Controller
  /// 
  /// @param _screen Screen which directly interacts with the terminal
  Controller(this._screen): 
    _dimensions = _screen.dimensions;
  

  Map<String, int> get dimensions => {
    'x': (_dimensions.width - _leftMarginGrid - _rightMarginGrid) * 2,
    'y': (_dimensions.height - _topMarginGrid - _bottomMarginGrid) * 3,
  };

  void setUp() {
    _screen.setUp();
  }

  void tearDown() {
    sleep(Duration(seconds: 5));
    _screen.tearDown();
  }

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

  /// Print the static boxes to the screen.
  ///
  /// The boxes leave a border of two rows in every direction. They look like this:
  /// ╔═══════╗
  /// ║       ║
  /// ╚╤════╤═╝
  ///  ╰────╯
  /// In all calculations the border does not count to the width and height of the box.
  void drawBoxes() {
    final startRowMain = _topMarginGrid + 1;
    final endRowMain = _dimensions.height - _bottomMarginGrid - 1;

    final startColumnMain = _leftMarginGrid + 1;
    final endColumnMain = _dimensions.width - _rightMarginGrid - 1;
    final widthMain = endColumnMain - startColumnMain;

    _screen.switchToColor(Color.box.num);

    _screen.writeAt(
      column: startColumnMain - 1,
      row: startRowMain - 1,
      text:
          Char.mainULCorner.symbol +
          Char.mainHBorder.symbol * widthMain +
          Char.mainURCorner.symbol,
    );

    for (var row = startRowMain; row <= endRowMain; row++) {
      _screen.writeAt(
        column: startColumnMain - 1,
        row: row,
        text: Char.mainVBorder.symbol,
      );
      _screen.writeAt(
        column: endColumnMain,
        row: row,
        text: Char.mainVBorder.symbol,
      );
    }

    _screen.cursorPosition(column: startColumnMain - 1, row: endRowMain + 1);

    final startColumnSecondary =
        1; // Relative to primary box. Must be larger than 0.
    final widthSecondary = 30;
    final endColumnSecondary = startColumnSecondary + widthSecondary + 1;

    _screen.write(Char.mainLLCorner.symbol);
    _screen.write(Char.mainHBorder.symbol * (startColumnSecondary - 1));
    _screen.write(Char.downSingleHorizontalDouble.symbol);
    _screen.write(Char.mainHBorder.symbol * (widthSecondary));
    _screen.write(Char.downSingleHorizontalDouble.symbol);
    _screen.write(Char.mainHBorder.symbol * (widthMain - widthSecondary - 2));
    _screen.write(Char.mainLRCorner.symbol);

    _screen.writeAt(
      column: startColumnSecondary + startColumnMain - 1,
      row: endRowMain + 2,
      text: Char.secondaryVBorder.symbol,
    );
    _screen.writeAt(
      column: endColumnSecondary + startColumnMain - 1,
      row: endRowMain + 2,
      text: Char.secondaryVBorder.symbol,
    );
    _screen.writeAt(
      column: startColumnSecondary + startColumnMain - 1,
      row: endRowMain + 3,
      text:
          Char.secondaryLLRoundCorner.symbol +
          Char.secondaryHBorder.symbol * widthSecondary +
          Char.secondaryLRRoundCorner.symbol,
    );
  }

  void drawGrid(List<List<bool>> grid) {
    final height = grid.length;
    final width = grid[0].length;

    _screen.switchToColor(Color.cell.num);

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
