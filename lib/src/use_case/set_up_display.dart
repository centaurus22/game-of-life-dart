import 'display_adapter_interface.dart';

/// Command that sets-up the screen which displays the simulation.
abstract class SetUpDisplayInterface {
  /// Execute the command: Sets-up the screen which displays the simulation.
  void execute();
}

/// Command that sets-up the screen which displays the simulation.
class SetUpDisplay extends SetUpDisplayInterface {
  /// External [DisplayAdapterInterface] to interact with the screen.
  final DisplayAdapterInterface _displayAdapter;

  /// Command that sets-up the screen which displays the simulation.
  ///
  /// Requires the [DisplayAdapterInterface] to interact with the screen.
  SetUpDisplay(this._displayAdapter);

  /// Execute the command: Sets-up the screen which displays the simulation.
  @override
  void execute() {
    return _displayAdapter.setUp();
  }
}
