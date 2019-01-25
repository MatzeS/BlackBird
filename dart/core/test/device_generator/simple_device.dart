import 'package:rmi/rmi.dart';
import 'package:blackbird/blackbird.dart';

part 'simple_device.g.dart';

class SomeAnnotation {
  final String someValue;
  final Map<String, int> complexvalue;
  const SomeAnnotation(this.someValue, this.complexvalue);
  bool someMethod() => complexvalue.containsKey('asdf');

  operator ==(Object other) {
    if (other is! SomeAnnotation) return false;
    SomeAnnotation another = other as SomeAnnotation;
    if (another.someValue != someValue) return false;
    if (!another.complexvalue.keys
        .toSet()
        .containsAll(this.complexvalue.keys.toSet())) ;
    if (!this
        .complexvalue
        .keys
        .toSet()
        .containsAll(another.complexvalue.keys.toSet())) ;
    if (!another.complexvalue.keys
        .every((k) => another.complexvalue[k] == this.complexvalue[k]))
      return false;

    return true;
  }
}

abstract class SimpleDevice extends Device {
  SimpleDevice._();
  static SimpleDevice getRemote(Context context, String uuid) =>
      _$SimpleDeviceRmi.getRemote(context, uuid);

  int aProperty;

  @Property()
  int get calculatedProperty => aProperty * 2;
  @Property()
  set calculatedProperty(int x) => aProperty = x ~/ 3;

  Device otherDevice;

  @SomeAnnotation('text', {'asdf': 123})
  int get aRuntimeDependency;

  Future<void> executiveMethod() async {}
  Future<int> get executiveGetter async {}
  set executiveSetter(int value) {}

  factory SimpleDevice() => new _$SimpleDeviceDevice();
  static SimpleDevice deserialize(Map<String, dynamic> serialized) =>
      _$SimpleDeviceFromJson(serialized);
}

abstract class EvenSimplerDevice extends Device {
  EvenSimplerDevice._();
  factory EvenSimplerDevice() => new _$EvenSimplerDeviceDevice();
  static EvenSimplerDevice getRemote(Context context, String uuid) =>
      _$EvenSimplerDeviceRmi.getRemote(context, uuid);
}
