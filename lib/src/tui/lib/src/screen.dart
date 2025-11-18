import 'dart:io';

import 'package:dart_console/dart_console.dart';
import 'package:game_of_life_dart/src/tui/lib/src/dimensions.dart';

abstract interface class ScreenInterface {
  Dimensions get dimensions;
  void setUp();
  void tearDown();
  void switchToColor(int number);
  void writeAt({required int column, required int row, required String text});
  void cursorPosition({required int column, required int row});
  void write(String text);
}

/// This interacts directly with the terminal screen
class Screen implements ScreenInterface {
  /// The Console object
  final _console = Console();

  @override
  /// The dimensions of the terminal screen
  Dimensions get dimensions {
    return Dimensions(
      width: _console.windowWidth,
      height: _console.windowHeight,
    );
  }

  @override
  /// Set up the terminal screen
  void setUp() {
    _console.clearScreen();
    _console.resetCursorPosition();
    _console.hideCursor();
  }

  @override
  /// Reset the terminal screen to default
  void tearDown() {
    _console.showCursor();
    _console.clearScreen();
    _console.resetCursorPosition();
  }

  @override
  /// Switch the foreground color
  ///
  /// @param number The color number which represents an 8-bit color
  ///
  /// The next string will be drawn to the terminal screen in this color
  void switchToColor(int number) {
    write("\u001b[38;5;${number}m");
  }

  @override
  /// Write a string which begin at determined position on the terminal screen
  ///
  /// @param column The column where the next written string starts
  /// @param row The row where the next written string starts
  /// @param text The String
  void writeAt({required int column, required int row, required String text}) {
    cursorPosition(column: column, row: row);
    write(text);
  }

  @override
  /// Set the position of the cursor
  ///
  /// @param column The column where the next written string starts
  /// @param row The row where the next written string starts
  void cursorPosition({required int column, required int row}) {
    _console.cursorPosition = Coordinate(row, column);
  }

  @override
  /// Write a string to the current position on the terminal screen
  ///
  /// @param text The String
  void write(String text) {
    stdout.write(text);
  }
}
