import 'package:game_of_life_dart/src/entities/grid.dart';

abstract class SimulateStepInterface {
  Grid execute(Grid grid);
}