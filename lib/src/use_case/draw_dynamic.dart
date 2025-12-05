import '../entity/grid.dart';

import 'display_adapter_interface.dart';

/// Draw the dynamic elements of the screen
///
/// Like the grid.
abstract class DrawDynamicInterface {
  /// Print the dynamic elements to the screen
  ///
  /// @param The curred [Grid]
  void execute(Grid grid);
}

/// Prints the dynamic elements of the screen
///
/// like the grid
class DrawDynamic extends DrawDynamicInterface {
  /// External DisplayAdapter object to interact with the screen
  final DisplayAdapterInterface _displayAdapter;

  /// Initialize the object
  ///
  /// @param _displayAdapter external Display
  DrawDynamic(this._displayAdapter);

  @override
  /// Print the dynamic elements to the screen
  void execute(Grid grid) {
    _displayAdapter.drawDynamic(grid);
  }
}
