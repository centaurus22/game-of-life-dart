import '../entities/coordinates.dart';
import '../entities/grid.dart';

import 'initialize_interface.dart';

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
