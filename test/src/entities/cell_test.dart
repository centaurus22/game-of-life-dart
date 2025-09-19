import 'package:game_of_life_dart/src/entities/cell.dart';
import 'package:test/test.dart';

void main() {
  late Cell cell;

  setUp((){
    cell = Cell();
  });

  test('init_cell', () {
    expect(cell.isAlive.runtimeType, bool);
  });

  test('die_when_less_than_two_live_neighbors', () {
    cell.isAlive = true;
    cell.nextStepCalculate(1);
    expect(cell.isAlive, false);
  });

  test('live_when_two_live_neighbors', () {
    cell.isAlive = true;
    cell.nextStepCalculate(2);
    expect(cell.isAlive, true);
  });

  test('live_when_three_live_neighbors', () {
    cell.isAlive = true;
    cell.nextStepCalculate(3);
    expect(cell.isAlive, true);
  });
}
