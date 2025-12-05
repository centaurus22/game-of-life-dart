import '../entity/coordinates.dart';
import '../entity/grid.dart';

/// Initialize the Grid
abstract class InitializeInterface {
  /// Initialize the Grid
  ///
  /// @param dimensions [Dimensions] of the new [Grid].
  /// @return the new [Grid].
  Grid execute(Dimensions dimensions);
}

/// Initialize the Grid
final class Initialize extends InitializeInterface {
  @override
  /// Initialize the Grid
  ///
  /// @param dimensions [Dimensions] of the new [Grid].
  /// @return the new [Grid].
  Grid execute(Dimensions dimensions) {
    return Grid(dimensions);
  }
}
