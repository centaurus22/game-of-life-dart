import 'package:game_of_life_dart/src/entity/grid.dart';

/// Command that simulates a step.
abstract class SimulateStepInterface {
  /// Execute the Command: Simulate a step.
  ///
  /// Requires the current [Grid].
  void execute(Grid grid);
}

/// Command that simulates a step.
final class SimulateStep implements SimulateStepInterface {
  /// Simulate a step.
  ///
  /// Requires the current [Grid].
  @override
  void execute(Grid grid) {
    grid.simulateStep();
  }
}
