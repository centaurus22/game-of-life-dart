import 'package:game_of_life_dart/src/entities/coordinates.dart';
import 'package:test/test.dart';

void main() {
  group('test position object', () {
    late Position position;

    setUp(() => {position = Position.set(y: 1, x: 1)});

    test('init_position', () {
      expect(position.y, 1);
      expect(position.x, 1);
    });

    test('set position to upper left', () {
      position = position.uL();
      expect(position.y, 2);
      expect(position.x, 0);
    });

    test('set position to upper center', () {
      position = position.uC();
      expect(position.y, 2);
      expect(position.x, 1);
    });

    test('set position to upper right', () {
      position = position.uR();
      expect(position.y, 2);
      expect(position.x, 2);
    });

    test('set position to middle left', () {
      position = position.mL();
      expect(position.y, 1);
      expect(position.x, 0);
    });

    test('set position to middle right', () {
      position = position.mR();
      expect(position.y, 1);
      expect(position.x, 2);
    });

    test('set position to lower left', () {
      position = position.lL();
      expect(position.y, 0);
      expect(position.x, 0);
    });

    test('set position to lower center', () {
      position = position.lC();
      expect(position.y, 0);
      expect(position.x, 1);
    });

    test('set position to lower right', () {
      position = position.lR();
      expect(position.y, 0);
      expect(position.x, 2);
    });

    group('test dimension object', () {
      late Dimensions dimension;

      setUp(() => {dimension = Dimensions()});

      test('set x dimension to 0 throws argument error', () {
        expect(() => dimension.x = 0, throwsArgumentError);
      });

      test('set x dimension to -1 throws argument error', () {
        expect(() => dimension.x = -1, throwsArgumentError);
      });

      test('set y dimension to -1 throws argument error', () {
        expect(() => dimension.y = -1, throwsArgumentError);
      });

      test('set y dimension to 2 sets value', () {
        dimension.x = 2;
        expect(dimension.x, 2);
      });

      test('set y dimension to 1 sets value', () {
        dimension.y = 1;
        expect(dimension.y, 1);
      });

      test('set y and y dimension directly', () {
        dimension = Dimensions.set(x: 2, y: 3);
        expect(dimension.x, 2);
        expect(dimension.y, 3);
      });
      test('convert from map', () {
        final dimensions = Dimensions.fromMap({'x': 4, 'y': 3});
        expect(dimensions.x, 4);
      });
      test('throw error if no x value', () {
        expect(() => Dimensions.fromMap({'y': 3}), throwsArgumentError);
      });
      test('throw error if no y value', () {
        expect(() => Dimensions.fromMap({'x': 3}), throwsArgumentError);
      });
      test('convert to map', () {
        final dimensions = Dimensions.set(x: 100, y: 50);
        expect(dimensions.toMap(), {'x': 100, 'y': 50});
      });
    });
  });
}
