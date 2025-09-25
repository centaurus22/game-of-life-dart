import 'package:game_of_life_dart/use_cases/print_static.dart';
import 'package:test/test.dart';

void main() {
  test('print_static_elements', () {
    final printStatic = PrintStatic();
    expect(
      () => printStatic.execute(),
      returnsNormally,
    );
  });
}
