import 'dart:async';

import 'src/screen.dart';
import 'src/controller.dart';

/// Command which returns a [StreamSubscription] which provides a Stream of pressend keys
class TuiProvideKeyStream {
  /// Execute the command: Returns a [StreamSubscription] which provides a Stream of pressend keys
  /// 
  /// @returns [StreamSubscription]. The stream contains pressed keys which are printable as utf8 strings.
  StreamSubscription<String> execute() {
    final controller = Controller(Screen());
    return controller.keyStream;
  }
}
