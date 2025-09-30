import '../entities/coordinates.dart';
import '../entities/grid.dart';

/// Initialize the Grid
abstract class InitializeInterface {
  /// Initialize the Grid
  ///
  /// @param dimensions [Dimensions] of the new [Grid].
  /// @return the new [Grid].
  Grid execute(Dimensions dimensions);
}
