import '../entities/grid.dart';

import 'display_adapter_interface.dart';
import 'draw_dynamic_interface.dart';

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
  /// Print the dynmic elements to the screen
  void execute(Grid grid) {
    _displayAdapter.drawDynamic(grid);
  }
}
