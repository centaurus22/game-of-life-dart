import 'package:game_of_life_dart/src/entities/coordinates.dart';
import 'package:game_of_life_dart/src/entities/grid.dart';
import 'package:game_of_life_dart/src/use_cases/draw_dynamic.dart';
import 'package:test/test.dart';

import 'mock_display_adapter.dart';

void main() {
  test('print_static_elements', () {
    final printStatic = DrawDynamic(MockDisplayAdapter());
    expect(
      () => printStatic.execute(Grid(Dimensions.set(x: 1, y: 1))),
      returnsNormally,
    );
  });
}
