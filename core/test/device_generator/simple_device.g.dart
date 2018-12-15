// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_device.dart';

// **************************************************************************
// DeviceGenerator
// **************************************************************************

class _$SimpleDeviceDevice implements SimpleDevice {
  _$SimpleDeviceDevice();

  SimpleDevice implementation(Map<Symbol, Object> dependencies) =>
      _$SimpleDeviceImplementation(this, dependencies);
  @override
  Object invoke(Invocation invocation) =>
      _$SimpleDeviceInvoker.invoke(invocation, this);
  Provision provideRemote(Context context) =>
      _$SimpleDeviceRmi.provideRemote(context, this);
  SimpleDevice getRemote(Context context, String uuid) =>
      _$SimpleDeviceRmi.getRemote(context, uuid);

  int aProperty;

  Device otherDevice;

  int get hashCode => Blackbird().interfaceDevice(this).hashCode;
  Type get runtimeType => Blackbird().interfaceDevice(this).runtimeType;
  Host get host => throw new Exception(
      'cannot get runtime dependencys on device representation');
  void executiveMethod() => Blackbird().interfaceDevice(this).executiveMethod();
  int get aRuntimeDependency => throw new Exception(
      'cannot get runtime dependencys on device representation');
  int get executiveGetter => Blackbird().interfaceDevice(this).executiveGetter;
  set executiveSetter(int value) =>
      Blackbird().interfaceDevice(this).executiveSetter = value;
}

class _$SimpleDeviceImplementation extends SimpleDevice {
  int _aProperty;

  Host _host;
  int _aRuntimeDependency;
  Device _otherDevice;

  _$SimpleDeviceImplementation(
      SimpleDevice delegate, Map<Symbol, Object> parameters)
      : super._() {
    if (parameters == null) {
      ConstructionInfoException info = new ConstructionInfoException();
      info.dependencies.add(new Dependency(
          name: #host,
          type: ["asset:blackbird/lib/device.dart#Host", "dart:core#Object"],
          device: this,
          module: null));
      info.dependencies.add(new Dependency(
          name: #aRuntimeDependency,
          type: ["dart:core#int", "dart:core#num", "dart:core#Object"],
          device: this,
          module: null));
      info.dependencies.add(new Dependency(
          name: #otherDevice,
          type: ["asset:blackbird/lib/device.dart#Device", "dart:core#Object"],
          device: this,
          module: otherDevice));
      info[#host].annotations.add(Runtime());
      info[#aRuntimeDependency]
          .annotations
          .add(SomeAnnotation('text', const {'asdf': 123}));
      throw info;
    }

    _host = parameters[#host];
    _aRuntimeDependency = parameters[#aRuntimeDependency];
    _otherDevice = parameters[#otherDevice];
    _aProperty = delegate.aProperty;
  }

  SimpleDevice implementation(Map<Symbol, Object> dependencies) =>
      throw Exception('this is already an implementation');
  @override
  Object invoke(Invocation invocation) =>
      _$SimpleDeviceInvoker.invoke(invocation, this);
  Provision provideRemote(Context context) =>
      _$SimpleDeviceRmi.provideRemote(context, this);
  SimpleDevice getRemote(Context context, String uuid) =>
      _$SimpleDeviceRmi.getRemote(context, uuid);

  Host get host => _host;
  int get aProperty => _aProperty;
  set aProperty(int _aProperty) => throw new Exception(
      'cannot change device property after implementationconstruction');
  Device get otherDevice => _otherDevice;
  set otherDevice(Device _otherDevice) => throw new Exception(
      "cannot change module after implementation construction");
  int get aRuntimeDependency => _aRuntimeDependency;
}

// **************************************************************************
// InvokerGenerator
// **************************************************************************

class _$SimpleDeviceInvoker {
  static dynamic invoke(Invocation invocation, SimpleDevice target) {
    if (invocation.isGetter && #aProperty == invocation.memberName) {
      return target.aProperty;
    }
    if (invocation.isSetter && #aProperty == invocation.memberName) {
      target.aProperty = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isGetter && #otherDevice == invocation.memberName) {
      return target.otherDevice;
    }
    if (invocation.isSetter && #otherDevice == invocation.memberName) {
      target.otherDevice = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isGetter && #aRuntimeDependency == invocation.memberName) {
      return target.aRuntimeDependency;
    }
    if (invocation.isGetter && #executiveGetter == invocation.memberName) {
      return target.executiveGetter;
    }
    if (invocation.isSetter && #executiveSetter == invocation.memberName) {
      target.executiveSetter = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isMethod && #executiveMethod == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.executiveMethod();
    }
  }
}

// **************************************************************************
// ProxyGenerator
// **************************************************************************

class _$SimpleDeviceProxy implements SimpleDevice {
  InvocationHandlerFunction _handle;
  _$SimpleDeviceProxy(this._handle) : super();

  int get aProperty {
    Invocation invocation = Invocation.getter(#aProperty);

    return _handle(invocation);
  }

  set aProperty(int _aProperty) {
    Invocation invocation = Invocation.setter(#aProperty, _aProperty);

    _handle(invocation);
  }

  Device get otherDevice {
    Invocation invocation = Invocation.getter(#otherDevice);

    return _handle(invocation);
  }

  set otherDevice(Device _otherDevice) {
    Invocation invocation = Invocation.setter(#otherDevice, _otherDevice);

    _handle(invocation);
  }

  int get aRuntimeDependency {
    Invocation invocation = Invocation.getter(#aRuntimeDependency);

    return _handle(invocation);
  }

  int get executiveGetter {
    Invocation invocation = Invocation.getter(#executiveGetter);

    return _handle(invocation);
  }

  set executiveSetter(int value) {
    Invocation invocation = Invocation.setter(#executiveSetter, value);

    _handle(invocation);
  }

  void executiveMethod() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#executiveMethod, arguments, namedArguments);

    _handle(_$invocation);
  }

  int get hashCode {
    Invocation invocation = Invocation.getter(#hashCode);

    return _handle(invocation);
  }

  Type get runtimeType {
    Invocation invocation = Invocation.getter(#runtimeType);

    return _handle(invocation);
  }

  Host get host {
    Invocation invocation = Invocation.getter(#host);

    return _handle(invocation);
  }

  String toString() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#toString, arguments, namedArguments);

    return _handle(_$invocation);
  }

  dynamic noSuchMethod(Invocation invocation) {
    List<Object> arguments = [];
    arguments.add(invocation);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#noSuchMethod, arguments, namedArguments);

    return _handle(_$invocation);
  }

  Device implementation(Map dependencies) {
    List<Object> arguments = [];
    arguments.add(dependencies);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#implementation, arguments, namedArguments);

    return _handle(_$invocation);
  }

  Provision provideRemote(Context context) {
    List<Object> arguments = [];
    arguments.add(context);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#provideRemote, arguments, namedArguments);

    return _handle(_$invocation);
  }

  Object invoke(Invocation invocation) {
    List<Object> arguments = [];
    arguments.add(invocation);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#invoke, arguments, namedArguments);

    return _handle(_$invocation);
  }
}

// **************************************************************************
// RmiGenerator
// **************************************************************************

class _$SimpleDeviceRmi {
  static bool _registered = false;
  static void _registerSerializers() {
    if (_registered) return;
    _registered = true;

    rmiRegisterSerializers([]);
  }

  static void _registerStubConstructors(Context context) {
    context.registerRemoteStubConstructor('Device', Device.getRemote);
  }

  static SimpleDevice getRemote(Context context, String uuid) {
    _registerSerializers();
    _registerStubConstructors(context);
    RmiProxyHandler handler = RmiProxyHandler(context, uuid);
    return _$SimpleDeviceProxy(handler.handle);
  }

  static Provision provideRemote(Context context, SimpleDevice target) {
    _registerSerializers();
    _registerStubConstructors(context);
    return rmiProvideRemote(context, target);
  }
}
