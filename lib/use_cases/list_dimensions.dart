import 'package:dart_console/dart_console.dart';
import '../src/entities/coordinates.dart';
import 'list_dimensions_interface.dart';

/// Use case to list the [Dimensions]
class ListDimensions extends ListDimensionsInterface {
  /// External console object to interact with the terminal
  final Console _console;

  /// Initialize the use case object
  /// 
  /// @param _console The external console object
  ListDimensions(this._console);

  @override
  Dimensions execute() {
    /// List the [Dimensions]
    /// 
    /// @return [Dimensions] of the terminal.
    return Dimensions.set(x: _console.windowWidth, y: _console.windowHeight);
  }
}
