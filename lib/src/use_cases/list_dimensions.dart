import 'display_adapter_interface.dart';

import '../entities/coordinates.dart';
import 'list_dimensions_interface.dart';

/// Use case to list the [Dimensions]
class ListDimensions extends ListDimensionsInterface {
  /// External DisplayAdapter object to interact with the screen
  final DisplayAdapterInterface _displayAdapter;

  /// Initialize this use case object
  ///
  /// @param _displayAdapter the used DisplayAdapter object
  ListDimensions(this._displayAdapter);

  @override
  Dimensions execute() {
    /// List the [Dimensions]
    ///
    /// @return [Dimensions] of the screen.
    return _displayAdapter.listDimensions();
  }
}
