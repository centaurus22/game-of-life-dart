import '../entities/coordinates.dart';
import '../tui/tui_list_dimensions.dart';
import '../../use_cases/display_adapter_interface.dart';

/// Represents the Console where the simulation is displayed
class TuiDisplayAdapter extends DisplayAdapterInterface {
  @override
  /// List the dimensions of the screen
  /// 
  /// @return the [Dimensions]
  Dimensions listDimensions() {
    final tuiListDimensions = TuiListDimensions();
    return Dimensions.fromMap(tuiListDimensions.execute());
  }
}
