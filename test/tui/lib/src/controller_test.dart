import 'package:game_of_life_dart/src/tui/lib/src/controller.dart';
import 'package:test/test.dart';

import 'mock_screen.dart';

void main() {
  group('general', () {
    late Controller controller;
    late MockScreen screen;

    setUp(() {
      screen = MockScreen();
      controller = Controller(screen);
      controller.setUp();
    });

    test('set up passed to screen', () {
      controller.setUp();
      var call = screen.call(0);
      expect(call.method, 'setUp');
    });

    test('tear down passed to screen', () {
      controller.tearDown();
      var call = screen.call(1);
      expect(call.method, 'tearDown');
    });

    test('get dimensions', () {
      expect(controller.dimensions, {'x': 4, 'y': 3});
    });

    test('exception on to small width', () {
      screen = MockScreen(width: 6, height: 5);
      controller = Controller(screen);
      expect(() => controller.setUp(), throwsException);
    });

    test('exception on to small height', () {
      screen = MockScreen(width: 7, height: 4);
      controller = Controller(screen);
      expect(() => controller.setUp(), throwsException);
    });

    test('draw background', () {
      controller.drawBackground();
      var call1 = screen.call(1);
      expect(call1.method, 'switchToColor');
      var call2 = screen.call(2);
      expect(call2.method, 'write');
      expect(call2.parameters['text'].length, 8);
    });

    test('draw background on large screens', () {
      screen = MockScreen(width: 8, height: 35);
      controller = Controller(screen);
      controller.drawBackground();
      var call1 = screen.call(0);
      expect(call1.method, 'switchToColor');
      var call2 = screen.call(1);
      expect(call2.method, 'write');
    });

    test('draw box', () {
      controller.drawBox();
      var call1 = screen.call(1);
      expect(call1.method, 'switchToColor');

      var call2 = screen.call(2);
      expect(call2.method, 'writeAt');
      expect(call2.parameters['column'], 2);
      expect(call2.parameters['row'], 1);
      expect(call2.parameters['text'].length, 4);

      var call3 = screen.call(3);
      expect(call3.method, 'writeAt');
      expect(call3.parameters['column'], 2);
      expect(call3.parameters['row'], 2);
      expect(call3.parameters['text'].length, 1);

      var call4 = screen.call(4);
      expect(call4.method, 'writeAt');
      expect(call4.parameters['column'], 5);
      expect(call4.parameters['row'], 2);
      expect(call4.parameters['text'].length, 1);

      var call5 = screen.call(5);
      expect(call5.method, 'writeAt');
      expect(call5.parameters['column'], 2);
      expect(call5.parameters['row'], 3);
      expect(call5.parameters['text'].length, 4);
    });

    test('draw grid', () {
      controller.drawGrid([
        [true, true],
        [true, true],
        [true, true],
      ]);
      var call1 = screen.call(1);
      expect(call1.method, 'switchToColor');
      var call2 = screen.call(2);
      expect(call2.method, 'writeAt');
      expect(call2.parameters['text'].length, 1);
      expect(call2.parameters['column'], 3);
      expect(call2.parameters['row'], 2);
    });

    test('draw larger grid', () {
      controller.drawGrid([
        [true, true],
        [true, true],
        [true, true],
        [true, true],
        [true, true],
        [true, true],
      ]);
      var call1 = screen.call(1);
      expect(call1.method, 'switchToColor');

      var call2 = screen.call(2);
      expect(call2.method, 'writeAt');
      expect(call2.parameters['text'].length, 1);
      expect(call2.parameters['column'], 3);
      expect(call2.parameters['row'], 2);

      var call3 = screen.call(3);
      expect(call3.method, 'writeAt');
      expect(call3.parameters['text'].length, 1);
      expect(call3.parameters['column'], 3);
      expect(call3.parameters['row'], 3);
    });
  });
}
