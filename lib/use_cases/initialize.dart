import '../src/entities/coordinates.dart';
import '../src/entities/grid.dart';

import 'initialize_interface.dart';

class Initialize extends InitializeInterface {
  @override
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
