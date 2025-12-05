import 'package:game_of_life_dart/src/entity/coordinates.dart';
import 'package:game_of_life_dart/src/entity/grid.dart';
import 'package:game_of_life_dart/src/enum/key.dart';
import 'package:game_of_life_dart/src/use_case/display_adapter_interface.dart';

class MockDisplayAdapter extends DisplayAdapterInterface {
  @override
  void setUp() {}

  @override
  void tearDown() {}

  @override
  Dimensions listDimensions() {
    return Dimensions.set(x: 80, y: 25);
  }

  @override
  void drawStatic() {}

  @override
  void drawDynamic(Grid grid) {}

  @override
  Key readKey() {
    return Key.q;
  }
}
