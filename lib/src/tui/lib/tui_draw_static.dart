import 'src/screen.dart';
import 'src/controller.dart';

/// A command that draws the static elements of the terminal user interface
///
/// * The background.
/// * The box which contains the grid.
class TuiDrawStatic {
/// Execute the command: draw the static elements of the terminal user interface
///
/// * The background.
/// * The box which contains the grid.
  void execute() {
    final controller = Controller(Screen());
    controller.drawBackground();
    controller.drawBox();
  }
}
