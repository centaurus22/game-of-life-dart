import 'display_adapter_interface.dart';
import 'print_static_interface.dart';

class PrintStatic extends PrintStaticInterface {
  final DisplayAdapterInterface displayAdapter;

  PrintStatic(this.displayAdapter);

  @override
  void execute() {
    displayAdapter.printStatic();
  }
}
