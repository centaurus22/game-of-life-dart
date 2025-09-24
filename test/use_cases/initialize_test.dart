import 'package:game_of_life_dart/src/entities/grid.dart';
import 'package:game_of_life_dart/use_cases/initialize.dart';
import 'package:test/test.dart';

void main() {
  late Initialize initialize;

  setUp(() {
    initialize = Initialize();
  });
  test('throw error if no width', () {
    expect(() => initialize.execute({'y': 2}), throwsArgumentError);
  });
  test('throw error if no height', () {
    expect(() => initialize.execute({'x': 2}), throwsArgumentError);
  });
  test('return grid', () {
    var grid = initialize.execute({'x': 2, 'y': 4});
    expect(grid.runtimeType, Grid );

    var gridBool = grid.toBools;
    expect(gridBool.length, 4);
    expect(gridBool[0].length, 2);
  });
}