import '../src/entities/coordinates.dart';

/// Use case to list the [Dimensions]
abstract class ListDimensionsInterface {
  /// List the [Dimensions]
  ///
  /// @return [Dimensions] of the screen.
  Dimensions execute();
}
