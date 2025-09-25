import 'package:game_of_life_dart/src/entities/coordinates.dart';
import 'package:game_of_life_dart/src/entities/grid.dart';
import 'package:game_of_life_dart/use_cases/simulate_step.dart';
import 'package:test/test.dart';

void main() {
  late SimulateStep simulateStep;

  setUp(() {
    simulateStep = SimulateStep();
  });

  test('return grid', () {
    var grid = simulateStep.execute(Grid(Dimensions.set(x: 3, y: 4)));
    expect(grid.runtimeType, Grid);
  });

  test('simulate one step', () {
    var grid = Grid.cells([
      [false, false, false, false],
      [false, true, false, false],
      [false, true, false, false],
      [false, true, false, false],
    ]);
    expect(simulateStep.execute(grid).toBools, [
      [false, false, false, false],
      [false, false, false, false],
      [true, true, true, false],
      [false, false, false, false],
    ]);
  });
}
