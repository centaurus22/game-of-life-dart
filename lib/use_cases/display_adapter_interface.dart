import '../src/entities/coordinates.dart';

/// The Adapter to the Screen where the simulation is displayed
abstract class DisplayAdapterInterface {
  /// Set-up the terminal
  void setUp();

  /// Reset the display back to default values
  void tearDown();

  /// List the dimensions of the screen
  ///
  /// @return the [Dimensions]
  Dimensions listDimensions();

  /// Prints the static elements of the screen
  ///
  /// like the background, the border of the grid, help elements.
  void drawStatic();

  /// Prints the dynamic elements of the screen
  void drawDynamic();
}
