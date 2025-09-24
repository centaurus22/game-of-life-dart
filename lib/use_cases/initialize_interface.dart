import '../src/entities/grid.dart';

/// Initialize the Grid
abstract class InitializeInterface {
  /// Initialize the Grid
  /// 
  /// @param dimensions Dimensions of the new [Grid] as Map.
  /// @return the new [Grid].
  Grid execute(Map<String, int> dimensions);
}
