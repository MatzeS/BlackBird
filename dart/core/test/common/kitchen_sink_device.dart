import 'package:blackbird/blackbird.dart';

class Illegal {
  const Illegal();
}

class ExpectAs {
  final Type expected;
  const ExpectAs(this.expected);
}

@Ignore()
abstract class KitchenSinkDevice extends Device {
  //////// Property

  @ExpectAs(Property)
  num property;

  @ExpectAs(Property)
  @Property()
  num annotatedProperty;

  @ExpectAs(Property)
  @Property()
  num get propertyPermutatingPair {}
  @ExpectAs(Property)
  @Property()
  set propertyPermutatingPair(num x) {}

  @ExpectAs(Property)
  @Property()
  num get abstractPropertyPermutatingPair;
  @ExpectAs(Property)
  @Property()
  set abstractPropertyPermutatingPair(num x);

  @ExpectAs(Property)
  @Property()
  set propertyPermutator(num p) {}

  @ExpectAs(Property)
  @Property()
  num get propertyPermutation {}

  /// For example you can pass a format argument for an address property
  @ExpectAs(Property)
  @Property()
  num getPropertyPermutation() {}

  @ExpectAs(Property)
  @Property()
  set abstractPropertyPermutator(num p);

  @ExpectAs(Property)
  @Property()
  num get abstractPropertyPermutation;

  @ExpectAs(Property)
  @Property()
  num abstractGetPropertyPermutation();

  //////// Runtime

  @ExpectAs(Runtime)
  num get runtimeDependency;
  @ExpectAs(Runtime)
  @Runtime()
  num get annotatedRuntimeDependency;

  /// A runtime dependency is injected at construction and cannot change
  @ExpectAs(Illegal)
  @Runtime()
  num runtimeField;

  @ExpectAs(Illegal)
  @Runtime()
  set runtimePair(num x) {}
  @ExpectAs(Illegal)
  @Runtime()
  num get runtimePair {}
  @ExpectAs(Illegal)
  @Runtime()
  set abstractRuntimePair(num x);
  @ExpectAs(Illegal)
  @Runtime()
  num get abstractRuntimePair;

  @ExpectAs(Illegal)
  @Runtime()
  set runtimePermutator(num p) {}

  @ExpectAs(Runtime)
  @Runtime()
  num get runtimePermutation {}

  @ExpectAs(Runtime)
  @Runtime()
  num getRuntimePermutation() {}

  @ExpectAs(Illegal)
  @Runtime()
  set runtimeSetter(num p);

  @ExpectAs(Runtime)
  @Runtime(isAbstract: true)
  num get abstractRuntimePermutationGetter;

  @ExpectAs(Runtime)
  @Runtime(isAbstract: true)
  num abstractRuntimePermutation();

  //////// Executive

  @ExpectAs(Executive)
  void executiveMethod() {}
  @ExpectAs(Executive)
  void abstractExecutiveMethod();
  @ExpectAs(Executive)
  @Executive()
  void annotatedExecutiveMethod() {}
  @ExpectAs(Executive)
  @Executive()
  void annotatedAbstractExecutiveMethod();

  @ExpectAs(Illegal)
  @Executive()
  num executiveField;

  @ExpectAs(Executive)
  set executiveSetter(num v) {}
  @ExpectAs(Executive)
  num get executiveGetter {}

  @ExpectAs(Executive)
  set executivePair(num v) {}
  @ExpectAs(Executive)
  num get executivePair {}

  /// A setter cannot be a runtime dependency, therefor annotation is not strictly necesssary
  @ExpectAs(Executive)
  @Executive()
  set abstractExecutiveSetter(num v);
  @ExpectAs(Executive)
  @Executive()
  set annotatedAbstractExecutiveSetter(num v);

  /// Annotation is necessary, otherwise this would be a runtime dependency
  @ExpectAs(Executive)
  @Executive()
  num get abstractExecutiveGetter;

  //////// SubModule

  @ExpectAs(SubModule)
  Device fieldSubmodule;

  @ExpectAs(Illegal)
  Device get submodule;

  /// A submodule is injected and cannot change, similar to runtime dependency
  @ExpectAs(Illegal)
  @SubModule()
  set device(Device device) {}

  /// These setters may be incorrectly implemented and hide an internal module away from dependency injection
  /// Should you attempt such a thing, better use Ignore
  @ExpectAs(Illegal)
  set aSuspiciousSetter(Device device) {}

  @ExpectAs(Illegal)
  @Property() // for the moment, devices are not even allowed as property permuatator parameters
  set aSuspiciousPropertySetter(Device device) {}

  @ExpectAs(Illegal)
  @Executive()
  set aSuspiciousExecutiveSetter(Device device) {}

  @ExpectAs(Illegal)
  set abstractSuspiciousSetter(Device device);

  @ExpectAs(Illegal)
  @Property()
  set abstractSuspiciousPropertySetter(Device device);

  @ExpectAs(Illegal)
  @Executive()
  set abstractSuspiciousExecutiveSetter(Device device);

  @ExpectAs(Illegal)
  Device get submoduleGetter {}

  // Again a suscpicious method
  @ExpectAs(Illegal)
  Device submoduleGetterMethod() {}

  @ExpectAs(Illegal)
  submoduleMethod(Device device) {}

  //////// Ignore
  @ExpectAs(Ignore)
  @Ignore()
  void ignoredMethod() {}
  @ExpectAs(Ignore)
  @Ignore()
  void ignoredAbstractMethod();

  /// Note: Ignore is above illegal device trespassing
  @ExpectAs(Ignore)
  @Ignore()
  set ignoredSetter(Device x) {}
  @ExpectAs(Ignore)
  @Ignore()
  set ignoredAbstractSetter(Device x);
  @ExpectAs(Ignore)
  @Ignore()
  Device get ignoredGetter {}
  @ExpectAs(Ignore)
  @Ignore()
  Device get ignoredAbstractGetter;
}
