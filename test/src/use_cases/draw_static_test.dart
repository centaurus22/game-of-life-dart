import 'package:game_of_life_dart/src/use_cases/draw_static.dart';
import 'package:test/test.dart';

import 'mock_display_adapter.dart';

void main() {
  test('print_static_elements', () {
    final printStatic = DrawStatic(MockDisplayAdapter());
    expect(() => printStatic.execute(), returnsNormally);
  });
}
