import 'package:game_of_life_dart/src/entities/grid.dart';

/// Simulate a step.
abstract class SimulateStepInterface {
  /// Simulate a step.
  ///
  /// @param The current [Grid].
  /// @return The next step of the [Grid].
  Grid execute(Grid grid);
}
