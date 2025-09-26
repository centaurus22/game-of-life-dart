import 'src/window.dart';

/// Prints the static elements of the screen
///
/// like the background, the border of the grid, help elements.
class TuiPrintStatic {
  /// Print the background
  void execute() {
    final window = Window();
    window.setUp();
    window.drawBackground();
    window.drawBoxes();
    window.tearDown();
  }
}
