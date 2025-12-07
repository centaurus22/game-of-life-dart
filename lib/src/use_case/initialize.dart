import '../entity/coordinates.dart';
import '../entity/grid.dart';

/// Command that initializes the [Grid].
abstract class InitializeInterface {
  /// Execute the command: Initialize the [Grid].
  ///
  /// @param dimensions [Dimensions] of the new [Grid].
  /// @return the new [Grid].
  Grid execute(Dimensions dimensions);
}

/// Command that initializes the [Grid].
final class Initialize extends InitializeInterface {
  /// Execute the command: Initialize the [Grid].
  ///
  /// @param dimensions [Dimensions] of the new [Grid].
  /// @return the new [Grid].
  @override
  Grid execute(Dimensions dimensions) {
    return Grid(dimensions);
  }
}
