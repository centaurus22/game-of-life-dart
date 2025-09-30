import 'package:game_of_life_dart/src/entities/coordinates.dart';
import 'package:game_of_life_dart/use_cases/display_adapter_interface.dart';

class MockDisplayAdapter extends DisplayAdapterInterface {
  @override
  void setUp(){}

  @override
  void tearDown() {}

  @override
  Dimensions listDimensions() {
    return Dimensions.set(x: 80, y: 25);
  }

  @override
  void drawStatic() {}

  @override
  void drawDynamic() {}
}
