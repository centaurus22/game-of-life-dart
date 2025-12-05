import 'package:dart_console/dart_console.dart';
import 'package:game_of_life_dart/src/tui/lib/src/dimensions.dart';
import 'package:game_of_life_dart/src/tui/lib/src/screen.dart';

class MethodCall {
  final String method;
  final Map<String, dynamic> parameters;

  MethodCall(this.method, this.parameters);
}

class MockScreen implements ScreenInterface {
  late Dimensions _dimensions;
  final List<MethodCall> _methodCalls = [];

  MockScreen({int width = 8, int height = 5}) {
    _dimensions = Dimensions(width: width, height: height);
  }

  MethodCall call(int index) {
    return _methodCalls.elementAt(index);
  }

  @override
  Dimensions get dimensions => _dimensions;

  @override
  void setUp() {
    _methodCalls.add(MethodCall('setUp', {}));
  }

  @override
  void tearDown() {
    _methodCalls.add(MethodCall('tearDown', {}));
  }

  @override
  void switchToColor(int number) {
    _methodCalls.add(MethodCall('switchToColor', {'number': number}));
  }

  @override
  void writeAt({required int column, required int row, required String text}) {
    _methodCalls.add(
      MethodCall('writeAt', {'column': column, 'row': row, 'text': text}),
    );
  }

  @override
  void cursorPosition({required int column, required int row}) {
    _methodCalls.add(MethodCall('writeAt', {'column': column, 'row': row}));
  }

  @override
  void write(String text) {
    _methodCalls.add(MethodCall('write', {'text': text}));
  }

  @override
  Key readKey() {
    _methodCalls.add(MethodCall('readKey', {}));
    return Key.printable('q');
  }
}
