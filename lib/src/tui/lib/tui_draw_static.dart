import 'src/controller.dart';
import 'src/screen.dart';

/// A command that draws the static elements of the terminal user interface.
///
/// * The background.
/// * The box which contains the grid.
class TuiDrawStatic {
  /// Execute the command: draw the static elements of the terminal user interface.
  ///
  /// * The background.
  /// * The box which contains the grid.
  void execute() {
    final controller = Controller(Screenfactory.createScreen());
    controller.drawBackground();
    controller.drawBox();
  }
}
