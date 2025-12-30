import 'package:game_of_life_dart/src/entity/coordinates.dart';
import 'package:game_of_life_dart/src/entity/grid.dart';
import 'package:game_of_life_dart/src/use_case/draw_dynamic.dart';
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
