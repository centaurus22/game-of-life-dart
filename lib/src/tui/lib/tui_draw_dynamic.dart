import 'src/screen.dart';
import 'src/controller.dart';

/// Draw the dynamic elements of the screen
class TuiDrawDynamic {
  /// Draw the state of the grid
  void execute() {
    final controller = Controller(Screen());
    controller.drawGrid([
      [true, true],
      [false, false],
      [true, true],
    ]);
  }
}
