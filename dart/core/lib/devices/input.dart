import 'package:blackbird/blackbird.dart';
import 'common.dart';

// part 'input.g.dart';

abstract class DiscreteInput extends Device {
  /// The number of descrete states
  @Property()
  int get states;

  /// The current state the sensor is measuring
  /// This value is within 0 to states-1
  @Executive()
  Future<int> get state;
}

abstract class DiscreteInterruptInput extends DiscreteInput {
  int _state;
  get state async => _state;

  @override
  void postImplementation() {
    stateChange.listen((s) => _state = s);
  }

  /// Stream issuing an event every time the state changes
  /// This should be a broadcast stream
  @Executive()
  Stream<int> get stateChange;
}

mixin BinaryInput implements DiscreteInput {
  get states => 2;
  get isOn async => state == ON;
  get isOff async => state == OFF;
}
