import 'package:game_of_life_dart/src/entities/cell.dart';
import 'package:test/test.dart';

void main() {
  late Cell cell;

  test('init_cell', () {
    var cell = Cell();
    expect(cell.isAlive.runtimeType, bool);
  });

  group('cell_starts_live', () {
    setUp(() {
      cell = Cell.isAlive(true);
    });

    test('die_when_less_than_two_live_neighbors', () {
      cell.nextStepCalculate(neighborsLiving: 1);
      expect(cell.isAlive, false);
    });

    test('live_when_two_live_neighbors', () {
      cell.nextStepCalculate(neighborsLiving: 2);
      expect(cell.isAlive, true);
    });

    test('live_when_three_live_neighbors', () {
      cell.nextStepCalculate(neighborsLiving: 3);
      expect(cell.isAlive, true);
    });

    test('die_when_more_than_three_live_neighbors', () {
      cell.nextStepCalculate(neighborsLiving: 4);
      expect(cell.isAlive, false);
    });
  });

  group('cell_starts_dead', () {
    setUp(() {
      cell = Cell.isAlive(false);
    });

    test('lives_when_three_live_neighbors', () {
      cell.nextStepCalculate(neighborsLiving: 3);
      expect(cell.isAlive, true);
    });
  });
}
