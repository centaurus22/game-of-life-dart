import '../src/entities/coordinates.dart';
import '../src/entities/grid.dart';

import 'initialize_interface.dart';

/// Initialize the Grid
final class Initialize extends InitializeInterface {
  @override
  /// Initialize the Grid
  /// 
  /// @param dimensions Dimensions of the new [Grid] as Map.
  /// @throws an ArgumentError if the Map do not contains values
  ///   for height or width.
  /// @return the new [Grid].
  Grid execute(Map<String, int> dimensions) {
    if (!dimensions.containsKey('x')) {
      throw ArgumentError('No width provided (Map key "x")');
    }
    if (!dimensions.containsKey('y')) {
      throw ArgumentError('No width provided (Map key "y")');
    }
    return Grid(Dimensions.set(x: dimensions['x']!, y: dimensions['y']!));
  }
}
