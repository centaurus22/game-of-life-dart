import 'src/controller.dart';
import 'src/screen.dart';

/// A Command that provides the calculated dimensions of the area where the grid can be displayed
/// 
/// The dimensions are calculated by the width and height inside the main box multiplied
/// by the number of grid cells that can be displayed by one unicode character.
/// So the width is multiplied by two and the height is multiplied by three.
class TuiListDimensions {
  /// Execute the command: provide the calculated dimensions of the area where the grid can be displayed
  /// 
  /// @return [Map] with the calculated dimensions of the grid area
  Map<String, int> execute() {
    final controller = Controller(Screen());
    return controller.dimensions;
  }
}
