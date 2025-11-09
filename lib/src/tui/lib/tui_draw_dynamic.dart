import 'src/screen.dart';
import 'src/controller.dart';

/// Draw the dynamic elements of the screen
class TuiDrawDynamic {
  /// Draw the state of the grid
  ///
  /// @param grid A two-dimensional list of the cells as bools where true stands for alive
  ///   and false for dead.
  void execute(List<List<bool>> grid) {
    final controller = Controller(Screen());
    controller.drawGrid(grid);
  }
}
