import 'package:game_of_life_dart/src/entities/coordinates.dart';
import 'package:game_of_life_dart/src/entities/grid.dart';
import 'package:game_of_life_dart/src/use_cases/initialize.dart';
import 'package:test/test.dart';

void main() {
  test('return grid', () {
    final initialize = Initialize();

    var grid = initialize.execute(Dimensions.set(x: 2, y: 4));
    expect(grid.runtimeType, Grid);

    var gridBool = grid.toBools;
    expect(gridBool.length, 4);
    expect(gridBool[0].length, 2);
  });
}
