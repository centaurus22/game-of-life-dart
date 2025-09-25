import '../entities/coordinates.dart';
import '../tui/lib/list_dimensions.dart';
import '../tui/lib/print_static.dart';
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
}
