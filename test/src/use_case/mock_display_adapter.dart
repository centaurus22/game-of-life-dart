import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:game_of_life_dart/src/entity/coordinates.dart';
import 'package:game_of_life_dart/src/entity/grid.dart';
import 'package:game_of_life_dart/src/use_case/display_adapter_interface.dart';

class MockDisplayAdapter extends DisplayAdapterInterface {
  @override
  void setUp() {}

  @override
  void tearDown() {}

  @override
  Dimensions provideDimensions() {
    return Dimensions.set(x: 80, y: 25);
  }

  @override
  void drawStatic() {}

  @override
  void drawDynamic(Grid grid) {}

  @override
  StreamSubscription<String> provideKeyStream() {
    return stdin.transform(utf8.decoder).listen((_) => {});
  }
}
