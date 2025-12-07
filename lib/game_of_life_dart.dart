import 'src/entity/coordinates.dart';
import 'src/entity/grid.dart';
import 'src/use_case/display_adapter_interface.dart';
import 'src/use_case/draw_static.dart';
import 'src/use_case/initialize.dart';
import 'src/use_case/list_dimensions.dart';
import 'src/use_case/set_up_display.dart';
import 'src/use_case/simulate_step.dart';
import 'src/use_case/tear_down_display.dart';

/// Connector to the use cases of the Game of Life.
class GameOfLifeDart {
  /// External [DisplayAdapterInterface] to interact with the screen
  final DisplayAdapterInterface _displayAdapter;

  /// Connector to the use cases of the Game of Life
  /// 
  /// @param _displayAdapter External [DisplayAdapterInterface] to interact with the screen.
  GameOfLifeDart(this._displayAdapter);

  /// List the [Dimensions] od the screen.
  /// 
  /// @return [Dimensions].
  Dimensions listDimensions() {
    final ListDimensionsInterface useCase = ListDimensions(_displayAdapter);
    return useCase.execute();
  }

  /// Initialize the game [Grid].
  ///
  /// @param dimensions [Dimensions] of the new [Grid].
  /// @return the new [Grid].
  Grid initialize(Dimensions dimensions) {
    final InitializeInterface useCase = Initialize();
    return useCase.execute(dimensions);
  }

  /// Sets-up the screen which displays the simulation.
  void setUpDisplay() {
    final SetUpDisplayInterface useCase = SetUpDisplay(_displayAdapter);
    useCase.execute();
  }

  /// Draws the static elements onto the screen.
  ///
  /// Draws the background, the border of the grid, help elements.
  void drawStatic() {
    final DrawStaticInterface useCase = DrawStatic(_displayAdapter);
    useCase.execute();
  }

  /// Simulate a step of the game.
  ///
  /// @param The [Grid].
  void simulateStep(Grid grid) {
    final SimulateStepInterface useCase = SimulateStep();
    useCase.execute(grid);
  }

  /// Reset the screen back to default values.
  void tearDownDisplay() {
    final TearDownDisplayInterface useCase = TearDownDisplay(_displayAdapter);
    useCase.execute();
  }
}
