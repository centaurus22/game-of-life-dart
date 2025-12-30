import 'src/screen.dart';
import 'src/controller.dart';

/// A command which draws the dynamic elements of the terminal user interface.
class TuiDrawDynamic {
  /// Execute the command: Draw the dynamic elements of the terminal user interface.
  ///
  /// Requires the [grid]: A two-dimensional list of the cells as bools where true stands for alive
  /// and false for dead.
  void execute(List<List<bool>> grid) {
    final controller = Controller(Screenfactory.createScreen());
    controller.drawGrid(grid);
  }
}
