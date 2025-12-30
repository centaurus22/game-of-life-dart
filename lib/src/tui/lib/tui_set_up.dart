import 'src/screen.dart';
import 'src/controller.dart';

/// A Command that sets-up the terminal.
class TuiSetUp {
  ///Execute the command: Set up the terminal.
  void execute() {
    final controller = Controller(Screenfactory.createScreen());
    controller.setUp();
  }
}
