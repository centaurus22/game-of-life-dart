import 'package:game_of_life_dart/src/entity/coordinates.dart';
import 'package:game_of_life_dart/src/use_case/list_dimensions.dart';
import 'package:test/test.dart';

import 'mock_display_adapter.dart';

void main() {
  test('get terminal dimensions', () {
    final listDimensions = ListDimensions(MockDisplayAdapter());
    final dimensions = listDimensions.execute();
    expect(dimensions.runtimeType, Dimensions);
  });
}
