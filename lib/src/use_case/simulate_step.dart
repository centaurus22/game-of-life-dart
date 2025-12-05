import 'package:game_of_life_dart/src/entity/grid.dart';

/// Simulate a step.
abstract class SimulateStepInterface {
  /// Simulate a step.
  ///
  /// @param The current [Grid].
  /// @return The next step of the [Grid].
  Grid execute(Grid grid);
}

//Simulate a step
final class SimulateStep implements SimulateStepInterface {
  @override
  /// Simulate a step.
  ///
  /// @param The current [Grid].
  /// @return The next step of the [Grid].
  Grid execute(Grid grid) {
    grid.simulateStep();
    return grid;
  }
}
