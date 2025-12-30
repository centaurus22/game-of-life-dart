import 'src/screen.dart';
import 'src/controller.dart';

/// A command that resets the terminal back to the default values.
class TuiTearDown {
/// Execute the command: Reset the terminal back to the default values.
  void execute() {
    final controller = Controller(Screen());
    controller.tearDown();
  }
}
