import 'display_adapter_interface.dart';

import '../entity/coordinates.dart';

/// Command that lists the [Dimensions] of the screen.
abstract class ListDimensionsInterface {
  /// Execute the command: List the [Dimensions].
  Dimensions execute();
}

/// Command that lists the [Dimensions] of the screen.
class ListDimensions extends ListDimensionsInterface {
  /// External [DisplayAdapterInterface] to interact with the screen.
  final DisplayAdapterInterface _displayAdapter;

  /// Command that lists the [Dimensions] of the screen.
  ///
  /// Requires the [DisplayAdapterInterface] to interact with the screen.
  ListDimensions(this._displayAdapter);

  /// Execute the command: List the [Dimensions].
  @override
  Dimensions execute() {
    return _displayAdapter.provideDimensions();
  }
}
