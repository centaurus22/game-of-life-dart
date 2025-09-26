import '../src/entities/coordinates.dart';

/// The Adapter to the Screen where the simulation is displayed
abstract class DisplayAdapterInterface {
  /// List the dimensions of the screen
  ///
  /// @return the [Dimensions]
  Dimensions listDimensions();

  /// Prints the static elements of the screen
  ///
  /// like the background, the border of the grid, help elements.
  void printStatic();
}
