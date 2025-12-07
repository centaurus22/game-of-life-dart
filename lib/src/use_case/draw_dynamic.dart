import '../entity/grid.dart';

import 'display_adapter_interface.dart';

/// Command that draws the dynamic elements onto the screen.
///
/// The dynamic elements contain the [Grid].
abstract class DrawDynamicInterface {
  /// Execute the command: Print the dynamic elements onto the screen.
  ///
  /// @param grid The curred [Grid].
  void execute(Grid grid);
}

/// Command that draws the dynamic elements onto the screen.
///
/// The dynamic elements contain the [Grid].
class DrawDynamic extends DrawDynamicInterface {
  /// External [DisplayAdapterInterface] to interact with the screen.
  final DisplayAdapterInterface _displayAdapter;

  /// Command that draws the dynamic elements onto the screen.
  ///
  /// The dynamic elements contain the [Grid].
  /// @param _displayAdapter External [DisplayAdapterInterface] to interact with the screen
  DrawDynamic(this._displayAdapter);

  /// Execute the command: Print the dynamic elements onto the screen.
  ///
  /// @param grid The curred [Grid].
  @override
  void execute(Grid grid) {
    _displayAdapter.drawDynamic(grid);
  }
}
