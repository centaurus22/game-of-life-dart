import 'package:game_of_life_dart/src/entities/coordinates.dart';
import 'package:game_of_life_dart/src/entities/grid.dart';
import 'package:game_of_life_dart/use_cases/simulate_step.dart';
import 'package:test/test.dart';

void main() {
  late SimulateStep simulateStep;

  setUp(() {
    simulateStep = SimulateStep();
  });

  test('Return Grid', () {
    var grid = simulateStep.execute(Grid(Dimensions.set(x: 3, y: 4)));
    expect(grid.runtimeType, Grid );
  });
}