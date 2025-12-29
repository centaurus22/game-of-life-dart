import 'display_adapter_interface.dart';

/// Command that draws the static elements onto the screen.
///
/// This draws the background, the border of the grid, help elements.
abstract class DrawStaticInterface {
  /// Execute the command: Print the static elements onto the screen.
  void execute();
}

/// Command that draws the static elements onto the screen.
///
/// This draws the background, the border of the grid, help elements.
class DrawStatic extends DrawStaticInterface {
  /// External [DisplayAdapterInterface] to interact with the screen.
  final DisplayAdapterInterface _displayAdapter;

  /// Command that draws the static elements onto the screen.
  ///
  /// This draws the background, the border of the grid, help elements.
  /// Requires the [DisplayAdapterInterface] to interact with the screen.
  DrawStatic(this._displayAdapter);

  /// Execute the command: Print the static elements onto the screen.
  @override
  void execute() {
    _displayAdapter.drawStatic();
  }
}
