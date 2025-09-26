import 'dart:io';

import 'package:dart_console/dart_console.dart';
import 'package:game_of_life_dart/src/tui/lib/src/char.dart';

import 'color.dart';

class Window {
  final _console = Console();
  late int _height;
  late int _width;

  final _topMarginGrid = 1;
  final _rightMarginGrid = 2;
  final _bottomMarginGrid = 4;
  final _leftMarginGrid = 2;

  final _foregroundColor = 82;

  Window() {
    _height = _console.windowHeight;
    _width = _console.windowWidth;
  }

  Map<String, int> get dimensions => {
    'x': (_width - _leftMarginGrid - _rightMarginGrid) * 2,
    'y': (_height - _topMarginGrid - _bottomMarginGrid) * 3,
  };

  void setUp() {
    _console.clearScreen();
    _console.resetCursorPosition();
    _console.hideCursor();
    _console.rawMode = true;
  }

  void tearDown() {
    sleep(Duration(seconds: 5));
    _console.showCursor();
    _console.rawMode = false;
    _console.clearScreen();
  }

  void drawBackground() {
    final charsPerColor = Color.charsPerColor(_height);
    var background = '';

    for (var row = 0; row < _height; row++) {
      var colorBackground = Color.colorBackground(
        charsPerColor: charsPerColor,
        position: row,
      );
      background +=
          Char.colorCode(colorBackground) + Char.backGround.unicode * _width;
    }
    stdout.write(background);
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
    final endRowMain = _height - _bottomMarginGrid - 1;

    final startColumnMain = _leftMarginGrid + 1;
    final endColumnMain = _width - _rightMarginGrid - 1;
    final widthMain = endColumnMain - startColumnMain;

    _console.cursorPosition = Coordinate(startRowMain - 1, startColumnMain - 1);
    stdout.write(Char.colorCode(_foregroundColor));

    stdout.write(
      Char.mainULCorner.unicode +
          Char.mainHBorder.unicode * widthMain +
          Char.mainURCorner.unicode,
    );

    for (var row = startRowMain; row <= endRowMain; row++) {
      _console.cursorPosition = Coordinate(row, startColumnMain - 1);
      stdout.write(Char.mainVBorder.unicode);
      _console.cursorPosition = Coordinate(row, endColumnMain);
      stdout.write(Char.mainVBorder.unicode);
    }

    _console.cursorPosition = Coordinate(endRowMain + 1, startColumnMain - 1);

    final startColumnSecondary =
        1; // Relative to primary box. Must be larger than 0.
    final widthSecondary = 30;
    final endColumnSecondary = startColumnSecondary + widthSecondary + 1;

    stdout.write(
      Char.mainLLCorner.unicode +
          Char.mainHBorder.unicode * (startColumnSecondary - 1) +
          Char.downSingleHorizontalDouble.unicode +
          Char.mainHBorder.unicode * (widthSecondary) +
          Char.downSingleHorizontalDouble.unicode +
          Char.mainHBorder.unicode * (widthMain - widthSecondary - 2) +
          Char.mainLRCorner.unicode,
    );

    _console.cursorPosition = Coordinate(
      endRowMain + 2,
      startColumnSecondary + startColumnMain - 1,
    );
    stdout.write(Char.secondaryVBorder.unicode);
    _console.cursorPosition = Coordinate(
      endRowMain + 2,
      endColumnSecondary + startColumnMain - 1,
    );
    stdout.write(Char.secondaryVBorder.unicode);

    _console.cursorPosition = Coordinate(
      endRowMain + 3,
      startColumnSecondary + startColumnMain - 1,
    );
    stdout.write(
      Char.secondaryLLRoundCorner.unicode +
          Char.secondaryHBorder.unicode * widthSecondary +
          Char.secondaryLRRoundCorner.unicode,
    );
  }

  void drawGrid(List<List<bool>> grid) {
    final height = grid.length;
    final width = grid[0].length;
    var gridString = Char.colorCode(_foregroundColor);

    for (var row = 0; row < height; row += 3) {
      for (var column = 0; column < width; column += 2) {
        gridString += Char.grid(
          _colorIndex(grid: grid, column: column, row: row),
        );
      }
    }
    stdout.write(gridString);
  }

  int _colorIndex({
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
}
