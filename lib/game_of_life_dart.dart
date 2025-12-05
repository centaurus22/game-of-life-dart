import 'src/entity/coordinates.dart';
import 'src/entity/grid.dart';
import 'src/use_case/display_adapter_interface.dart';
import 'src/use_case/draw_static.dart';
import 'src/use_case/initialize.dart';
import 'src/use_case/list_dimensions.dart';
import 'src/use_case/set_up_display.dart';
import 'src/use_case/simulate_step.dart';
import 'src/use_case/tear_down_display.dart';

class GameOfLifeDart {
  final DisplayAdapterInterface _displayAdapter;

  GameOfLifeDart(this._displayAdapter);

  Dimensions listDimensions() {
    final ListDimensionsInterface useCase = ListDimensions(_displayAdapter);
    return useCase.execute();
  }

  Grid initialize(Dimensions dimensions) {
    final InitializeInterface useCase = Initialize();
    return useCase.execute(dimensions);
  }

  void setUpDisplay() {
    final SetUpDisplayInterface useCase = SetUpDisplay(_displayAdapter);
    useCase.execute();
  }

  void drawStatic() {
    final DrawStaticInterface useCase = DrawStatic(_displayAdapter);
    useCase.execute();
  }

  void simulateStep(Grid grid) {
    final SimulateStepInterface useCase = SimulateStep();
    useCase.execute(grid);
  }

  void tearDownDisplay() {
    final TearDownDisplayInterface useCase = TearDownDisplay(_displayAdapter);
    useCase.execute();
  }
}
