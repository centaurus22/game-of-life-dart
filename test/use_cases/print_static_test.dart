import 'package:game_of_life_dart/use_cases/print_static.dart';
import 'package:test/test.dart';

import 'mock_display_adapter.dart';

void main() {
  test('print_static_elements', () {
    final printStatic = PrintStatic(MockDisplayAdapter());
    expect(() => printStatic.execute(), returnsNormally);
  });
}
