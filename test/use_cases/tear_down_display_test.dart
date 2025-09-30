import 'package:game_of_life_dart/use_cases/tear_down_display.dart';
import 'package:test/test.dart';

import 'mock_display_adapter.dart';

void main() {
  test('tear down the display without error', () {
    final tearDownDisplay = TearDownDisplay(MockDisplayAdapter());
    expect(() => tearDownDisplay.execute(), returnsNormally);
  });
}
