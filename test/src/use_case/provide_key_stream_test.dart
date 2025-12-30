import 'package:game_of_life_dart/src/use_case/provide_key_stream.dart';
import 'package:test/test.dart';

import 'mock_display_adapter.dart';

void main() {
  test('get a pressed key from the display system', () {
    final provideKeyStream = ProvideKeyStream(MockDisplayAdapter());
    expect(() => provideKeyStream.execute(), returnsNormally);
  });
}
