import 'package:game_of_life_dart/src/entity/grid.dart';
import 'package:game_of_life_dart/src/use_case/simulate_step.dart';
import 'package:test/test.dart';

void main() {
  late SimulateStep simulateStep;

  setUp(() {
    simulateStep = SimulateStep();
  });

  test('simulate one step', () {
    var grid = Grid.cells([
      [false, false, false, false],
      [false, true, false, false],
      [false, true, false, false],
      [false, true, false, false],
    ]);
    simulateStep.execute(grid);
    expect(grid.toBools, [
      [false, false, false, false],
      [false, false, false, false],
      [true, true, true, false],
      [false, false, false, false],
    ]);
  });
}
