import 'package:game_of_life_dart/src/entities/grid.dart';
import 'package:test/test.dart';

void main() {
  late Grid grid;

  setUp((){
    grid = Grid();
  });

  test('init_grid', () {
    expect(grid.asBools.runtimeType, List<List<bool>>);
  });

  test('init_as_1x1_grid', () {
    expect(grid.asBools.length, 1);
    expect(grid.asBools[0].length, 1);
  });
}
