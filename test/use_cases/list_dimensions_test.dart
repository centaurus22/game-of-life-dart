import 'package:dart_console/dart_console.dart';
import 'package:game_of_life_dart/src/entities/coordinates.dart';
import 'package:game_of_life_dart/use_cases/list_dimensions.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'list_dimensions_test.mocks.dart';

@GenerateMocks([Console])
void main() {
  test('get terminal dimensions', () {
    final console = MockConsole();

    when(console.windowWidth).thenReturn(80);
    when(console.windowHeight).thenReturn(25);

    final listDimensions = ListDimensions(console);
    final dimensions = listDimensions.execute();
    expect(dimensions.runtimeType, Dimensions);
  });
}
