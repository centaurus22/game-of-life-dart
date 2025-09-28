import 'src/controller.dart';

/// Prints the static elements of the screen
///
/// like the background, the border of the grid, help elements.
class TuiPrintStatic {
  /// Print the background
  void execute() {
    final controller = Controller();
    controller.setUp();
    controller.drawBackground();
    controller.drawBoxes();
    controller.drawGrid([[true, true], [false, false], [true, true]]);
    controller.tearDown();
  }
}
