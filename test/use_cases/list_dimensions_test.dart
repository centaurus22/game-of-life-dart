import 'package:game_of_life_dart/src/entities/coordinates.dart';
import 'package:game_of_life_dart/use_cases/display_adapter_interface.dart';
import 'package:game_of_life_dart/use_cases/list_dimensions.dart';
import 'package:test/test.dart';

class MockDisplayAdapter extends DisplayAdapterInterface {
  @override
  Dimensions listDimensions() {
    return Dimensions.set(x: 80, y: 25);
  }
}

void main() {
  test('get terminal dimensions', () {
    final listDimensions = ListDimensions(MockDisplayAdapter());
    final dimensions = listDimensions.execute();
    expect(dimensions.runtimeType, Dimensions);
  });
}
