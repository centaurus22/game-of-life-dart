import 'package:game_of_life_dart/src/tui/lib/tui_print_static.dart';
import 'package:game_of_life_dart/use_cases/print_static_interface.dart';

void main() {
  final printStatic = TuiPrintStatic();
  printStatic.execute();
}
