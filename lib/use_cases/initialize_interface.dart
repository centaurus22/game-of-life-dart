import '../src/entities/grid.dart';

abstract class InitializeInterface {
  Grid execute(Map<String, int> dimensions);
}
