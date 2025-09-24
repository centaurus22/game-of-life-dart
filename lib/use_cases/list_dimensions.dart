import 'package:dart_console/dart_console.dart';

import 'list_dimensions_interface.dart';

class ListDimensions extends ListDimensionsInterface{
  final Console _console;

  ListDimensions(this._console);

  @override
  Map<String, int> execute() {
    return {'x': _console.windowWidth, 'y': _console.windowHeight};
  }
}