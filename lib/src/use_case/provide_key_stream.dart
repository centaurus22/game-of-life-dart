import 'dart:async';

import 'display_adapter_interface.dart';

/// Command which returns a [StreamSubscription] which provides a Stream of pressend keys.
abstract class ProvideKeyStreamInterface {
  /// Execute the command: Return a [StreamSubscription].
  /// 
  /// The stream contains pressed keys which are printable as utf8 strings.
  StreamSubscription<String> execute();
}

/// Command which returns a [StreamSubscription] which provides a Stream of pressend keys.
final class ProvideKeyStream implements ProvideKeyStreamInterface {
  /// External [DisplayAdapterInterface] to interact with the screen.
  final DisplayAdapterInterface _displayAdapter;

  /// Command which returns a [StreamSubscription] which provides a Stream of pressend keys.
  /// 
  /// Requires the [DisplayAdapterInterface] to interact with the screen.
  ProvideKeyStream(this._displayAdapter);

  /// Execute the command: Return a [StreamSubscription].
  /// 
  /// The stream contains pressed keys which are printable as utf8 strings.
  @override
  StreamSubscription<String> execute() {
    return _displayAdapter.provideKeyStream();
  }
}
