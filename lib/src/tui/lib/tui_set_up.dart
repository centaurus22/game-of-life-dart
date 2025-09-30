import 'src/screen.dart';
import 'src/controller.dart';

/// Set-up the terminal
class TuiSetUp {
  void execute() {
    final controller = Controller(Screen());
    controller.setUp();
  }
}
