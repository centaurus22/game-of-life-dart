import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dart_console/dart_console.dart';
import 'package:game_of_life_dart/src/tui/lib/src/dimensions.dart';

/// This interacts directly with the terminal screen.
abstract interface class ScreenInterface {
  /// The [Dimensions] of the screen.
  Dimensions get dimensions;

  /// A [StreamSubscription] which provides pressed keys on the keyboard.
  ///
  /// Returns a [StreamSubscription] wich provides a [List] of pressed printable keys
  /// represented as unicode strings.
  StreamSubscription<String> get keyStream;

  /// Sets up the screen.
  void setUp();

  /// Resets the screen to default.
  void tearDown();

  /// Switches the foreground color.
  void switchToColor(int number);

  /// Sets the cursor position and writes a string to the terminal screen.
  void writeAt({required int column, required int row, required String text});

  /// Sets the position of the text cursor.
  void cursorPosition({required int column, required int row});

  /// Writes a [text] to the current position on the terminal screen.
  void write(String text);
}

class Screenfactory {
  static Screen createScreen() {
    if (Platform.isWindows) {
      return WindowsScreen();
    }
    return UnixScreen();
  }
}

/// This interacts directly with the terminal screen.
abstract class Screen implements ScreenInterface {
  /// The [Console].
  final _console = Console();

  /// The [Dimensions] of the terminal screen.
  @override
  Dimensions get dimensions {
    return Dimensions(
      width: _console.windowWidth,
      height: _console.windowHeight,
    );
  }

  @override
  StreamSubscription<String> get keyStream =>
      stdin.transform(utf8.decoder).listen((_) => {});

  /// Sets up the terminal screen.
  @override
  void setUp() {
    _console.clearScreen();
    _console.resetCursorPosition();
    _console.hideCursor();
    stdin.echoMode = false;
    _osSpecificSetUp();
  }

  /// Resets the terminal screen to default.
  @override
  void tearDown() {
    _console.showCursor();
    _console.clearScreen();
    _console.resetCursorPosition();
    _console.resetColorAttributes();
    _osSpecificTearDown();
  }

  /// Switches the foreground color.
  ///
  /// Requires a [number] which represents an 8-bit color. The next printable
  /// string will be drawn to the terminal screen with this foreground color.
  @override
  void switchToColor(int number) {
    write("\u001b[38;5;${number}m");
  }

  /// Sets the cursor position and writes a string to the terminal screen.
  ///
  /// This function requires the [column] and the [row] where the string is printed
  /// and the [text] string which is printed onto the screen.
  ///
  /// Example:
  /// ```dart:
  /// var screen = Screen();
  /// screen.writeAt(column: 3, row: 10, text: "Lorem ipsum");
  /// ```
  @override
  void writeAt({required int column, required int row, required String text}) {
    cursorPosition(column: column, row: row);
    write(text);
  }

  /// Sets the position of the text cursor.
  ///
  /// This function requires the [column] and the [row] where the string is printed.
  /// Example:
  /// ```dart:
  /// var screen = Screen();
  /// screen.cursorPosition(column: 3, row: 10);
  /// ```
  @override
  void cursorPosition({required int column, required int row}) {
    _console.cursorPosition = Coordinate(row, column);
  }

  /// Writes a [text] to the current position on the terminal screen.
  @override
  void write(String text) {
    stdout.write(text);
  }

  void _osSpecificSetUp() {}
  void _osSpecificTearDown() {}
}

class UnixScreen extends Screen {
  @override
  void _osSpecificSetUp() {
    stdin.lineMode = false;
  }

  @override
  void _osSpecificTearDown() {
    stdin.lineMode = true;
  }
}

class WindowsScreen extends Screen {}
