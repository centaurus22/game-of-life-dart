import 'src/screen.dart';
import 'src/controller.dart';

/// Reset the terminal back to the default values
class TuiTearDown {
  void execute() {
    final controller = Controller(Screen());
    controller.setUp();
  }
}
