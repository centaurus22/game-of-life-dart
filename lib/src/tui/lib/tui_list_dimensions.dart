import 'package:game_of_life_dart/src/tui/lib/src/window.dart';

class ListDimensions {
  /// Get the dimensions of the terminal
  ///
  /// @return Map with the dimensions of the main box where the simulation grid is displayed.
  Map<String, int> execute() {
    final window = Window();
    return window.dimensions;
  }
}
