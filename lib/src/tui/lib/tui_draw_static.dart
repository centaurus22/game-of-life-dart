import 'src/screen.dart';
import 'src/controller.dart';

/// Draw the static elements of the screen
///
/// * The background.
/// * The box which contains the grid.
class TuiDrawStatic {
  /// Draw the background and the box
  void execute() {
    final controller = Controller(Screen());
    controller.setUp();
    controller.drawBackground();
    controller.drawBox();
    controller.drawGrid([
      [true, true],
      [false, false],
      [true, true],
    ]);
    controller.tearDown();
  }
}
