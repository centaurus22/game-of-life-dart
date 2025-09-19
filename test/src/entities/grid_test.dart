import 'package:game_of_life_dart/src/entities/grid.dart';
import 'package:test/test.dart';

void main() {
  late Grid grid;

  setUp((){
    grid = Grid();
  });

  test('init_grit', () {
    expect(grid.asBools.runtimeType, List<List<bool>>);
  });
}
