import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dart_console/dart_console.dart';
import 'package:game_of_life_dart/src/tui/lib/src/dimensions.dart';

/// This interacts directly with the terminal screen
abstract interface class ScreenInterface {
  Dimensions get dimensions;
  StreamSubscription<String> get keyStream;
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
  /// 
  /// @return [Dimensions] with a width and a height
  Dimensions get dimensions {
    return Dimensions(
      width: _console.windowWidth,
      height: _console.windowHeight,
    );
  }

  @override
  /// A [StreamSubscription] which provides pressed keys on the keyboard.
  /// 
  /// @return [StreamSubscription] wich provides a [List] of pressed printable keys represented as unicode.
  StreamSubscription<String> get keyStream =>
      stdin.transform(utf8.decoder).listen((_) => {});

  @override
  /// Set up the terminal screen
  void setUp() {
    _console.clearScreen();
    _console.resetCursorPosition();
    _console.hideCursor();
    stdin.echoMode = false;
    stdin.lineMode = false;
  }

  @override
  /// Reset the terminal screen to default
  void tearDown() {
    _console.showCursor();
    _console.clearScreen();
    _console.resetCursorPosition();
    stdin.echoMode = true;
  }

  @override
  /// Switch the foreground color
  ///
  /// @param number The color number which represents an 8-bit color
  ///
  /// The next printable string will be drawn to the terminal screen in this foreground color
  void switchToColor(int number) {
    write("\u001b[38;5;${number}m");
  }

  @override
  /// Write a string which begins at determined position on the terminal screen
  ///
  /// @param column The column where the next written string starts
  /// @param row The row where the next written string starts
  /// @param text The [String] which should be printed to the screen
  void writeAt({required int column, required int row, required String text}) {
    cursorPosition(column: column, row: row);
    write(text);
  }

  @override
  /// Sets the position of the text cursor
  ///
  /// @param column The column where the next string will be written
  /// @param row The row where the next string will be written
  void cursorPosition({required int column, required int row}) {
    _console.cursorPosition = Coordinate(row, column);
  }

  @override
  /// Write a [String] to the current position on the terminal screen
  ///
  /// @param text The [String] which should be written
  void write(String text) {
    stdout.write(text);
  }
}
