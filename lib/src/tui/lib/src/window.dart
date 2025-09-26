import 'dart:io';

import 'package:dart_console/dart_console.dart';
import 'package:game_of_life_dart/src/tui/lib/src/char.dart';

import 'color.dart';

class Window {
  final _console = Console();
  late int _height;
  late int _width;

  Window() {
    _height = _console.windowHeight;
    _width = _console.windowWidth;
  }

  void setUp() {
    _console.clearScreen();
    _console.resetCursorPosition();
    _console.hideCursor();
    _console.rawMode = true;
  }

  void tearDown() {
    sleep(Duration(seconds: 5));
    _console.showCursor();
    _console.rawMode=false;
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
      background += Char.colorCode(colorBackground) + Char.backGround.unicode * _width;
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
  void drawBoxes() {
    final horizontalBorderWidth = _width - 6;
    final startColumn = 2;
    final startRow = 2;

    _console.cursorPosition = Coordinate(startRow, startColumn);
    stdout.write(Char.colorCode(82));

    stdout.write(Char.mainULCorner.unicode + Char.mainHBorder.unicode * horizontalBorderWidth + Char.mainURCorner.unicode);

    final endColumn = horizontalBorderWidth + 3;
    final endRow = _height - 5;

    for (var row = startRow + 1; row < endRow; row++) {
      _console.cursorPosition = Coordinate(row, startColumn);
      stdout.write(Char.mainVBorder.unicode);
      _console.cursorPosition = Coordinate(row, endColumn);
      stdout.write(Char.mainVBorder.unicode);
    }

    _console.cursorPosition = Coordinate(endRow, startColumn);
    stdout.write(Char.mainLLCorner.unicode + Char.mainHBorder.unicode * horizontalBorderWidth + Char.mainLRCorner.unicode);
  }
}
