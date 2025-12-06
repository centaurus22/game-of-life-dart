import 'dart:async';
import 'dart:io';

import 'package:game_of_life_dart/src/adapter/tui_display_adapter.dart';
import 'package:game_of_life_dart/src/entity/grid.dart';
import 'package:game_of_life_dart/src/use_case/draw_dynamic.dart';
import 'package:game_of_life_dart/src/use_case/draw_static.dart';
import 'package:game_of_life_dart/src/use_case/initialize.dart';
import 'package:game_of_life_dart/src/use_case/provide_dimensions.dart';
import 'package:game_of_life_dart/src/use_case/provide_key_stream.dart';
import 'package:game_of_life_dart/src/use_case/set_up_display.dart';
import 'package:game_of_life_dart/src/use_case/simulate_step.dart';
import 'package:game_of_life_dart/src/use_case/tear_down_display.dart';

void main() {
  var displayAdapter = TuiDisplayAdapter();
  var setUpDisplay = SetUpDisplay(displayAdapter);
  var tearDownDisplay = TearDownDisplay(displayAdapter);
  var drawStatic = DrawStatic(displayAdapter);
  var listDimensions = ListDimensions(displayAdapter);
  var initialize = Initialize();
  var drawDynamic = DrawDynamic(displayAdapter);
  var simulateStep = SimulateStep();
  var provideKeyStream = ProvideKeyStream(displayAdapter);

  try {
    setUpDisplay.execute();
    drawStatic.execute();
    var dimensions = listDimensions.execute();
    var grid = initialize.execute(dimensions);

    var keyStream = provideKeyStream.execute();
    keyStream.onData((keys) => processKey(keys[0], tearDownDisplay));

    Timer.periodic(
      Duration(seconds: 0),
      (_) => loop(grid, drawDynamic, simulateStep),
    );
  } on StdoutException catch (e) {
    tearDownDisplay.execute();
    print(e.toString());
    exit(1);
  }
}

void loop(Grid grid, DrawDynamic drawDynamic, SimulateStep simulateStep) {
  drawDynamic.execute(grid);
  simulateStep.execute(grid);
  sleep(Duration(milliseconds: 500));
}

void processKey(String key, TearDownDisplay tearDownDisplay) {
  if (key == 'q') {
    tearDownDisplay.execute();
    exit(0);
  }
}
