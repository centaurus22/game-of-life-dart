import '../entity/coordinates.dart';
import '../entity/grid.dart';

/// Command that initializes the [Grid].
abstract class InitializeInterface {
  /// Execute the command: Initialize the new [Grid].
  ///
  /// Requires the [Dimensions] of the new [Grid] and returns the new [Grid].
  Grid execute(Dimensions dimensions);
}

/// Command that initializes the [Grid].
final class Initialize extends InitializeInterface {
  /// Execute the command: Initialize the new [Grid].
  ///
  /// Requires the [Dimensions] of the new [Grid] and returns it.
  @override
  Grid execute(Dimensions dimensions) {
    return Grid(dimensions);
  }
}
