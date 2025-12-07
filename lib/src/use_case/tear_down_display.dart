import 'display_adapter_interface.dart';

/// Command that resets the screen back to default values.
abstract class TearDownDisplayInterface {
  /// Execute the command: Reset the screen back to default values.
  void execute();
}

/// Command that resets the screen back to default values.
class TearDownDisplay extends TearDownDisplayInterface {
  /// External [DisplayAdapterInterface] object to interact with the screen.
  final DisplayAdapterInterface _displayAdapter;

  /// Command that resets the screen back to default values.
  ///
  /// @param _displayAdapter External [DisplayAdapterInterface] to interact with the screen.
  TearDownDisplay(this._displayAdapter);

  /// Execute the command: Reset the screen back to default values.
  @override
  void execute() {
    return _displayAdapter.tearDown();
  }
}
