import 'package:dart_console/dart_console.dart';

class TuiListDimensions {
  /// External console object
  final Console _console = Console();

  /// Get the dimensions of the terminal
  ///
  /// @return Map with the dimensions of the terminal
  Map<String, int> execute() {
    return {'x': _console.windowWidth, 'y': _console.windowHeight};
  }
}
