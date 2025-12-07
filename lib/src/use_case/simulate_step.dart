import 'package:game_of_life_dart/src/entity/grid.dart';

/// Command that simulates a step.
abstract class SimulateStepInterface {
  /// Execute the Command: Simulate a step.
  ///
  /// @param The current [Grid].
  /// @return The next step of the [Grid].
  Grid execute(Grid grid);
}

/// Command that simulates a step.
final class SimulateStep implements SimulateStepInterface {
  /// Simulate a step.
  ///
  /// @param The current [Grid].
  /// @return The next step of the [Grid].
  @override
  Grid execute(Grid grid) {
    grid.simulateStep();
    return grid;
  }
}
