import 'package:dart_console/dart_console.dart';

import 'src/screen.dart';
import 'src/controller.dart';

/// Get a key press from the keyboard
class TuiReadKey {
  Key execute() {
    final controller = Controller(Screen());
    return controller.readKey();
  }
}
