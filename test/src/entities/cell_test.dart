import 'package:game_of_life_dart/src/entities/cell.dart';
import 'package:test/test.dart';

void main() {
  test('init_cell', () {
    final cell = Cell();
    expect(cell.isAlive.runtimeType, bool);
  });
}
