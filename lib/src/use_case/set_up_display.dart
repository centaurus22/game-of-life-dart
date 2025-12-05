import 'display_adapter_interface.dart';
import '../entity/coordinates.dart';

/// Set-up the display which displays the simulation
abstract class SetUpDisplayInterface {
  void execute();
}

/// Use case to list the [Dimensions]
class SetUpDisplay extends SetUpDisplayInterface {
  /// External DisplayAdapter object to interact with the screen
  final DisplayAdapterInterface _displayAdapter;

  /// Initialize this use case object
  ///
  /// @param _displayAdapter the used DisplayAdapter object
  SetUpDisplay(this._displayAdapter);

  @override
  /// Set-up the display which displays the simulation
  void execute() {
    return _displayAdapter.setUp();
  }
}
