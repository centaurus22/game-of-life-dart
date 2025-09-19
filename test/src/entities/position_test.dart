import 'package:game_of_life_dart/src/entities/position.dart';
import 'package:test/test.dart';

void main() {
  late Position position;

  setUp(() => {position = Position(row: 1, column: 1)});

  test('init_position', () {
    expect(position.row, 1);
    expect(position.column, 1);
  });

  test('set position to upper left', () {
    position = position.uL();
    expect(position.row, 2);
    expect(position.column, 0);
  });

  test('set position to upper center', () {
    position = position.uC();
    expect(position.row, 2);
    expect(position.column, 1);
  });

  test('set position to upper right', () {
    position = position.uR();
    expect(position.row, 2);
    expect(position.column, 2);
  });

  test('set position to middle left', () {
    position = position.mL();
    expect(position.row, 1);
    expect(position.column, 0);
  });

  test('set position to middle right', () {
    position = position.mR();
    expect(position.row, 1);
    expect(position.column, 2);
  });

  test('set position to lower left', () {
    position = position.lL();
    expect(position.row, 0);
    expect(position.column, 0);
  });

  test('set position to lower center', () {
    position = position.lC();
    expect(position.row, 0);
    expect(position.column, 1);
  });

  test('set position to lower right', () {
    position = position.lR();
    expect(position.row, 0);
    expect(position.column, 2);
  });
}
