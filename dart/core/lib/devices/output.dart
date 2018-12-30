import 'package:blackbird/blackbird.dart';
import 'common.dart';

abstract class DiscreteOutput extends Device {
  @Property()
  int get states;

  @Executive()
  set state(int state) => writeState(state);

  @Executive()
  writeState(int state);
}

mixin BinaryOutput implements DiscreteOutput {
  get states => 2;
  set binaryState(bool binaryState) => state = binaryState ? ON : OFF;
  Future<void> turnOn() async => state = ON;
  Future<void> turnOff() async => state = OFF;
}

mixin BufferedOutput implements DiscreteOutput {
  int _state;

  get state => _state;

  @override
  set state(int state) {
    writeState(state);
    _state = state;
  }
}
