import 'src/controller.dart';
import 'src/screen.dart';

class TuiListDimensions {
  /// Get the dimensions of the terminal
  ///
  /// @return Map with the dimensions of the main box where the simulation grid is displayed.
  Map<String, int> execute() {
    final controller = Controller(Screen());
    return controller.dimensions;
  }
}
