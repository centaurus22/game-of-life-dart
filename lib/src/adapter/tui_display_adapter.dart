import 'dart:async';

import 'package:game_of_life_dart/src/tui/lib/tui_draw_dynamic.dart';
import 'package:game_of_life_dart/src/tui/lib/tui_provide_key_stream.dart';
import 'package:game_of_life_dart/src/tui/lib/tui_list_dimensions.dart';
import 'package:game_of_life_dart/src/tui/lib/tui_draw_static.dart';
import 'package:game_of_life_dart/src/tui/lib/tui_set_up.dart';
import 'package:game_of_life_dart/src/tui/lib/tui_tear_down.dart';

import '../entity/coordinates.dart';
import '../entity/grid.dart';
import '../use_case/display_adapter_interface.dart';

/// Represents the terminal where the simulation is displayed.
class TuiDisplayAdapter extends DisplayAdapterInterface {
  /// Sets up the terminal
  @override
  void setUp() {
    final setUp = TuiSetUp();
    setUp.execute();
  }

  /// Reset the terminal back to the default values.
  @override
  void tearDown() {
    final tearDown = TuiTearDown();
    tearDown.execute();
  }

  /// List the [Dimensions] of the screen.
  @override
  Dimensions provideDimensions() {
    final listDimensions = TuiListDimensions();
    return Dimensions.fromMap(listDimensions.execute());
  }

  /// Prints the static elements onto the screen.
  ///
  /// Prints the background, the border of the grid, help elements.
  @override
  void drawStatic() {
    final drawStatic = TuiDrawStatic();
    drawStatic.execute();
  }

  /// Prints the dynamic elements onto the screen.
  ///
  /// Requires the [Grid].
  @override
  void drawDynamic(Grid grid) {
    final drawDynamic = TuiDrawDynamic();
    drawDynamic.execute(grid.toBools);
  }

  /// Returns a [StreamSubscription] which provides a Stream of pressend keys.
  ///
  /// The stream contains pressed keys which are printable as utf8 strings.
  @override
  StreamSubscription<String> provideKeyStream() {
    final provideKeyStream = TuiProvideKeyStream();
    return provideKeyStream.execute();
  }
}
