import 'display_adapter_interface.dart';
import 'print_static_interface.dart';

/// Prints the static elements of the screen
///
/// like the background, the border of the grid, help elements.
class PrintStatic extends PrintStaticInterface {
  /// External DisplayAdapter object to interact with the screen
  final DisplayAdapterInterface _displayAdapter;

  /// Initialize the object
  ///
  /// @param _displayAdapter external Display
  PrintStatic(this._displayAdapter);

  @override
  /// Print the static elements to the screen
  void execute() {
    _displayAdapter.drawStatic();
  }
}
