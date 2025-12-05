import 'display_adapter_interface.dart';
import '../enum/key.dart';

/// Get a key press from the screen
abstract class ReadKeyInterface {
  /// Read a keyboard event
  ///
  /// @return the event
  Key execute();
}

/// Get a key press from the screen
final class ReadKey implements ReadKeyInterface {
  final DisplayAdapterInterface _displayAdapter;

  ReadKey(this._displayAdapter);

  @override
  /// Get a key press from the keyboard
  ///
  /// @return the pressed [Key]
  Key execute() {
    return _displayAdapter.readKey();
  }
}
