import 'dart:async';

import '../entity/coordinates.dart';
import '../entity/grid.dart';

/// The adapter to the screen where the simulation is displayed.
abstract class DisplayAdapterInterface {
  /// Sets-up the screen.
  void setUp();

  /// Resets the display back to default values
  void tearDown();

  /// Returns the [Dimensions] of the screen in terms of grid cells.
  /// 
  /// The simulation lives in the grid cells.
  Dimensions provideDimensions();

  /// Prints the static elements onto the screen.
  ///
  /// Currently prints the background and the border of the grid box.
  void drawStatic();

  /// Prints the dynamic elements onto the screen.
  /// 
  /// Requires the simulation [grid].
  void drawDynamic(Grid grid);

  /// Provides a [StreamSubscription] for a stream with pressed keys.
  /// 
  /// Printable pressed keys are represented as utf8 strings.
  StreamSubscription<String> provideKeyStream();
}
