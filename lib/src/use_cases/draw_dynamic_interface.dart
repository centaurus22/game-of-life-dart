import '../entities/grid.dart';

/// Draw the dynamic elements of the screen
///
/// Like the grid.
abstract class DrawDynamicInterface {
  /// Print the dynamic elements to the screen
  void execute(Grid grid);
}
