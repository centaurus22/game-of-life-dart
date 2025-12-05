import 'display_adapter_interface.dart';

/// Draw the static elements of the screen
///
/// Like the background, the border of the grid, help elements.
abstract class DrawStaticInterface {
  /// Print the static elements to the screen
  void execute();
}

/// Prints the static elements of the screen
///
/// like the background, the border of the grid, help elements.
class DrawStatic extends DrawStaticInterface {
  /// External DisplayAdapter object to interact with the screen
  final DisplayAdapterInterface _displayAdapter;

  /// Initialize the object
  ///
  /// @param _displayAdapter external Display
  DrawStatic(this._displayAdapter);

  @override
  /// Print the static elements to the screen
  void execute() {
    _displayAdapter.drawStatic();
  }
}
