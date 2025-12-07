import 'dart:async';

import '../entity/coordinates.dart';
import '../entity/grid.dart';

/// The adapter to the screen where the simulation is displayed
abstract class DisplayAdapterInterface {
  /// Sets-up the screen
  void setUp();

  /// Resets the display back to default values
  void tearDown();

  /// List the dimensions of the screen in terms of grid cells
  /// 
  /// The simulation lives in the grid cells.
  /// @return the [Dimensions]
  Dimensions provideDimensions();

  /// Prints the static elements onto the screen
  ///
  /// Prints the background, the border of the grid, help elements.
  void drawStatic();

  /// Prints the dynamic elements onto the screen
  /// 
  /// @param grid The simulation [Grid]
  void drawDynamic(Grid grid);

  /// Provides a [StreamSubscription] for a stream with pressed keys
  /// 
  /// @return [StreamSubscription] with pressed keys as utf8 strings
  StreamSubscription<String> provideKeyStream();
}
