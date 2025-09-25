import 'package:game_of_life_dart/src/tui/lib/tui_list_dimensions.dart';
import 'package:game_of_life_dart/src/tui/lib/tui_print_static.dart';
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

  @override
  void printStatic(Dimensions dimensions) {
    final printStatic = TuiPrintStatic();
    printStatic.execute();
  }
}
