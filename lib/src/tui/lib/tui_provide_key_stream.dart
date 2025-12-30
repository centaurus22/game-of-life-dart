import 'dart:async';

import 'src/screen.dart';
import 'src/controller.dart';

/// Command which returns a [StreamSubscription] which provides a Stream of pressend keys.
class TuiProvideKeyStream {
  /// Execute the command: Returns a [StreamSubscription] which provides a stream of pressend keys.
  /// 
  /// The stream contains pressed and printable keys as utf8 strings.
  StreamSubscription<String> execute() {
    final controller = Controller(Screenfactory.createScreen());
    return controller.keyStream;
  }
}
