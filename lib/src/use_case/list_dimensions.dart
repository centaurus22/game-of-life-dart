import 'display_adapter_interface.dart';

import '../entity/coordinates.dart';

/// Command that lists the [Dimensions] of the screen.
abstract class ListDimensionsInterface {
  /// Execute the command: List the [Dimensions].
  ///
  /// @return [Dimensions] of the screen.
  Dimensions execute();
}

/// Command that lists the [Dimensions] of the screen.
class ListDimensions extends ListDimensionsInterface {
  /// External [DisplayAdapterInterface] to interact with the screen.
  final DisplayAdapterInterface _displayAdapter;

  /// Execute the command: List the [Dimensions].
  ///
  /// @param _displayAdapter External [DisplayAdapterInterface] to interact with the screen.
  ListDimensions(this._displayAdapter);

  @override
  /// List the [Dimensions] od the screen.
  ///
  /// @return [Dimensions].
  Dimensions execute() {
    return _displayAdapter.provideDimensions();
  }
}
