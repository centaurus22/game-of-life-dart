import 'dart:io';

import 'package:dart_console/dart_console.dart';
import 'package:game_of_life_dart/src/tui/lib/src/dimensions.dart';

/// This interacts directly with the terminal screen
class Screen {
  final _console = Console();

  void setUp() {
    _console.clearScreen();
    _console.resetCursorPosition();
    _console.hideCursor();
    _console.rawMode = true;
  }

  void tearDown() {
    _console.showCursor();
    _console.rawMode = false;
    _console.clearScreen();
  }

  Dimensions get dimensions {
    return Dimensions(width: _console.windowWidth, height: _console.windowHeight);
  }

  void switchToColor(int number) {
    write("\u001b[38;5;${number}m");
  }

  void writeAt({required int column, required int row, required String text}) {
    cursorPosition(column: column, row: row);
    write(text);
  }

  void cursorPosition({required int column, required int row}) {
    _console.cursorPosition = Coordinate(row, column);
  }

  void write(String text) {
    stdout.write(text);
  }
}
