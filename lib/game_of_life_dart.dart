import 'src/entities/coordinates.dart';
import 'src/entities/grid.dart';
import 'src/use_cases/display_adapter_interface.dart';
import 'src/use_cases/draw_static.dart';
import 'src/use_cases/draw_static_interface.dart';
import 'src/use_cases/initialize.dart';
import 'src/use_cases/initialize_interface.dart';
import 'src/use_cases/list_dimensions.dart';
import 'src/use_cases/list_dimensions_interface.dart';
import 'src/use_cases/set_up_display.dart';
import 'src/use_cases/set_up_display_interface.dart';
import 'src/use_cases/simulate_step.dart';
import 'src/use_cases/simulate_step_interface.dart';
import 'src/use_cases/tear_down_display.dart';
import 'src/use_cases/tear_down_display_interface.dart';

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