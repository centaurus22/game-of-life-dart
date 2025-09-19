import 'package:game_of_life_dart/src/entities/grid.dart';
import 'package:test/test.dart';

void main() {
  test('init_grid', () {
    var grid = Grid(height: 0, width: 0);
    expect(grid.asBools.runtimeType, List<List<bool>>);
  });

  test('init_as_1x1_grid', () {
    var grid = Grid(height: 1, width: 1);
    expect(grid.asBools.length, 1);
    expect(grid.asBools[0].length, 1);
  });

  test('init_as_2x3_grid', () {
    var grid = Grid(height: 2, width: 3);
    expect(grid.asBools.length, 2);
    expect(grid.asBools[0].length, 3);
  });

  test('do a simulation step', () {
    var grid = Grid.cells([
      [false, false, false],
      [false, true, false],
      [false, false, false],
    ]);
    grid.nextStepCalculate();
    expect(grid.asBools, [
      [false, false, false],
      [false, false, false],
      [false, false, false],
    ]);
  });

  test('do a 2x2 simulation step', () {
    var grid = Grid.cells([
      [true, true],
      [true, true],
    ]);
    grid.nextStepCalculate();
    expect(grid.asBools, [
      [false, false],
      [false, false],
    ]);
  });

  test('do a 4x4 simulation step', () {
    var grid = Grid.cells([
      [false, true, false, false],
      [false, true, false, false],
      [false, true, false, false],
      [false, false, false, false],
    ]);
    grid.nextStepCalculate();
    expect(grid.asBools, [
      [false, false, false, false],
      [true, true, true, false],
      [false, false, false, false],
      [false, false, false, false],
    ]);
  });
}
