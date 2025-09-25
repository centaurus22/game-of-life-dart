import 'package:dart_console/dart_console.dart';

class ListDimensions {
  /// Get the dimensions of the terminal
  ///
  /// @return Map with the dimensions of the terminal
  Map<String, int> execute() {
    final console = Console();
    return {'x': console.windowWidth, 'y': console.windowHeight};
  }
}
