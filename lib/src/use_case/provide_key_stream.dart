import 'dart:async';

import 'display_adapter_interface.dart';

/// Get a key press from the screen
abstract class ProvideKeyStreamInterface {
  /// Read a keyboard event
  ///
  /// @return the event
  StreamSubscription<String> execute();
}

/// Get a key press from the screen
final class ProvideKeyStream implements ProvideKeyStreamInterface {
  final DisplayAdapterInterface _displayAdapter;

  ProvideKeyStream(this._displayAdapter);

  @override
  /// Get a key press from the keyboard
  ///
  /// @return the pressed [Key]
  StreamSubscription<String> execute() {
    return _displayAdapter.provideKeyStream();
  }
}
