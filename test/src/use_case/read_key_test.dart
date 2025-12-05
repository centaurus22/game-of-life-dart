import 'package:game_of_life_dart/src/enum/key.dart';
import 'package:game_of_life_dart/src/use_case/read_key.dart';
import 'package:test/test.dart';

import 'mock_display_adapter.dart';

void main() {
  test('get a pressed key from the display system', () {
    final readKey = ReadKey(MockDisplayAdapter());
    expect(readKey.execute(), Key.q);
  });
}
