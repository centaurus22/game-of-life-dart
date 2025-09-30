import 'package:game_of_life_dart/use_cases/set_up_display.dart';
import 'package:test/test.dart';

import 'mock_display_adapter.dart';

void main() {
  test('set up display without error', () {
    final setUpDisplay = SetUpDisplay(MockDisplayAdapter());
    expect(() => setUpDisplay.execute(), returnsNormally);
  });
}
