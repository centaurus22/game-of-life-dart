import 'package:game_of_life_dart/src/tui/lib/tui_draw_dynamic.dart';
import 'package:game_of_life_dart/src/tui/lib/tui_list_dimensions.dart';
import 'package:game_of_life_dart/src/tui/lib/tui_draw_static.dart';
import '../entities/coordinates.dart';
import '../../use_cases/display_adapter_interface.dart';

/// Represents the Console where the simulation is displayed
class TuiDisplayAdapter extends DisplayAdapterInterface {
  @override
  /// List the dimensions of the screen
  ///
  /// @return the [Dimensions]
  Dimensions listDimensions() {
    final listDimensions = ListDimensions();
    return Dimensions.fromMap(listDimensions.execute());
  }

  /// Prints the static elements of the screen
  ///
  /// like the background, the border of the grid, help elements.
  @override
  void drawStatic() {
    final drawStatic = TuiDrawStatic();
    drawStatic.execute();
  }

  @override
  /// Draw the dynamic elements of the screen
  void drawDynamic() {
    final drawDynamic = TuiDrawDynamic();
    drawDynamic.execute();
  }
}
