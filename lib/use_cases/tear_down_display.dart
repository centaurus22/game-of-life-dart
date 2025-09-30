import 'display_adapter_interface.dart';
import 'tear_down_display_interface.dart';

/// Reset the display to default values
class TearDownDisplay extends TearDownDisplayInterface {
  /// External DisplayAdapter object to interact with the display
  final DisplayAdapterInterface _displayAdapter;

  /// Initialize this use case object
  ///
  /// @param _displayAdapter the used DisplayAdapter object
  TearDownDisplay(this._displayAdapter);

  @override
  void execute() {
    return _displayAdapter.tearDown();
  }
}
