import 'dart:io';

import 'package:game_of_life_dart/src/adapter/tui_display_adapter.dart';
import 'package:game_of_life_dart/src/entity/grid.dart';
import 'package:game_of_life_dart/src/use_case/draw_dynamic.dart';
import 'package:game_of_life_dart/src/use_case/draw_static.dart';
import 'package:game_of_life_dart/src/use_case/initialize.dart';
import 'package:game_of_life_dart/src/use_case/list_dimensions.dart';
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

  var error = '';

  try {
    setUpDisplay.execute();
    drawStatic.execute();
    var dimensions = listDimensions.execute();
    var grid = initialize.execute(dimensions);
    enterLoop(grid, drawDynamic, simulateStep);
  } on StdoutException catch (e) {
    error = e.toString();
  } finally {
    tearDownDisplay.execute();

    if (error != '') {
      print(error);
      exit(1);
    }

    exit(0);
  }
}

void enterLoop(Grid grid, DrawDynamic drawDynamic, SimulateStep simulateStep) {
  while (true) {
    drawDynamic.execute(grid);
    simulateStep.execute(grid);
    sleep(Duration(milliseconds: 500));
  }
}
