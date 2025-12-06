import 'dart:async';

import 'package:game_of_life_dart/src/tui/lib/tui_draw_dynamic.dart';
import 'package:game_of_life_dart/src/tui/lib/provide_key_stream.dart';
import 'package:game_of_life_dart/src/tui/lib/tui_provide_dimensions.dart';
import 'package:game_of_life_dart/src/tui/lib/tui_draw_static.dart';
import 'package:game_of_life_dart/src/tui/lib/tui_set_up.dart';
import 'package:game_of_life_dart/src/tui/lib/tui_tear_down.dart';

import '../entity/coordinates.dart';
import '../entity/grid.dart';
import '../use_case/display_adapter_interface.dart';

/// Represents the terminal where the simulation is displayed
class TuiDisplayAdapter extends DisplayAdapterInterface {
  @override
  /// Sets up the terminal
  void setUp() {
    final setUp = TuiSetUp();
    setUp.execute();
  }

  @override
  /// Reset the terminal back to the default values
  void tearDown() {
    final tearDown = TuiTearDown();
    tearDown.execute();
  }

  @override
  /// List the dimensions of the screen
  ///
  /// @return the [Dimensions]
  Dimensions provideDimensions() {
    final provideDimensions = TuiProvideDimensions();
    return Dimensions.fromMap(provideDimensions.execute());
  }

  @override
  /// Prints the static elements of the screen
  ///
  /// like the background, the border of the grid, help elements.
  void drawStatic() {
    final drawStatic = TuiDrawStatic();
    drawStatic.execute();
  }

  @override
  /// Draw the dynamic elements of the screen
  ///
  /// @parameter grid The grid entity
  void drawDynamic(Grid grid) {
    final drawDynamic = TuiDrawDynamic();
    drawDynamic.execute(grid.toBools);
  }

  @override
  /// Read a key from the keyboard
  ///
  /// @return a [Key] enum
  StreamSubscription<String> provideKeyStream() {
    final provideKeyStream = TuiProvideKeyStream();
    return provideKeyStream.execute();
  }
}
