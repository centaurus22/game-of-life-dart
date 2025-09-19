import 'package:game_of_life_dart/src/entities/position.dart';
import 'package:test/test.dart';

void main() {
  late Position position;

  setUp(() => {
    position = Position(row: 1, column: 1)
  });

  test('init_position', () {
    expect(position.row, 1);
    expect(position.column, 1);
  });
}
