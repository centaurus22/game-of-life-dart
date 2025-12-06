import 'dart:async';

import 'src/screen.dart';
import 'src/controller.dart';

/// Get a key press from the keyboard
class TuiProvideKeyStream {
  StreamSubscription<String> execute() {
    final controller = Controller(Screen());
    return controller.keyStream;
  }
}
