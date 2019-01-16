// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_device.dart';

// **************************************************************************
// DeviceGenerator
// **************************************************************************

class _$SimpleDeviceDevice extends SimpleDevice {
  _$SimpleDeviceDevice();

  Host get host =>
      throw new Exception('only implementation objects are hosted');

  SimpleDevice implementation(Map<Symbol, Object> dependencies) =>
      _$SimpleDeviceImplementation(this, dependencies);
  @override
  Object invoke(Invocation invocation) =>
      throw new Exception('no invocation on devices');
  Provision provideRemote(Context context) =>
      throw new Exception('no RMI on devices');
  SimpleDevice getRemote(Context context, String uuid) =>
      throw new Exception('no RMI on devices');
  @override
  Map<String, dynamic> toJson() => _$SimpleDeviceToJson(this);

  int get aRuntimeDependency => throw new Exception(
      'cannot get runtime dependencys on device representation');
  Future<int> get executiveGetter async =>
      throw new Exception("you cannot execute stuff on devices");
  set executiveSetter(int value) =>
      throw new Exception("you cannot execute stuff on devices");
  Future<void> executiveMethod() async =>
      throw new Exception("you cannot execute stuff on devices");

  Device otherDevice;
}

class _$SimpleDeviceImplementation extends SimpleDevice {
  int _aRuntimeDependency;
  Host _host;
  Device _otherDevice;

  _$SimpleDeviceImplementation(
      SimpleDevice delegate, Map<Symbol, Object> parameters) {
    if (parameters == null) {
      ConstructionInfoException info = new ConstructionInfoException();
      info.dependencies.add(new Dependency(
          name: #aRuntimeDependency,
          type: ["dart:core#int", "dart:core#num", "dart:core#Object"],
          device: this,
          module: null,
          isModule: false));
      info.dependencies.add(new Dependency(
          name: #host,
          type: [
            "asset:blackbird/lib/src/device.dart#Host",
            "asset:blackbird/lib/src/device.dart#Device",
            "dart:core#Object"
          ],
          device: this,
          module: null,
          isModule: false));
      info.dependencies.add(new Dependency(
          name: #otherDevice,
          type: [
            "asset:blackbird/lib/src/device.dart#Device",
            "dart:core#Object"
          ],
          device: this,
          module: delegate.otherDevice,
          isModule: true));
      info[#aRuntimeDependency]
          .annotations
          .add(SomeAnnotation('text', const {'asdf': 123}));
      info[#host].annotations.add(Runtime());
      throw info;
    }

    _aRuntimeDependency = parameters[#aRuntimeDependency];
    _host = parameters[#host];
    _otherDevice = parameters[#otherDevice];
    _aProperty = delegate.aProperty;
  }

  Host get host => _host;

  SimpleDevice implementation(Map<Symbol, Object> dependencies) =>
      throw Exception('this is already an implementation');
  @override
  Object invoke(Invocation invocation) =>
      _$SimpleDeviceInvoker.invoke(invocation, this);
  Provision provideRemote(Context context) =>
      _$SimpleDeviceRmi.provideRemote(context, this);
  SimpleDevice getRemote(Context context, String uuid) =>
      _$SimpleDeviceRmi.getRemote(context, uuid);
  @override
  Map<String, dynamic> toJson() => _$SimpleDeviceToJson(this);

  int get aProperty => _aProperty;
  set aProperty(int _aProperty) => throw new Exception(
      'cannot change device property after implementationconstruction');
  Device get otherDevice => _otherDevice;
  set otherDevice(Device _otherDevice) => throw new Exception(
      "cannot change module after implementation construction");

  set calculatedProperty(int x) => throw new Exception(
      'cannot change device property after implementationconstruction');
  int get aRuntimeDependency => _aRuntimeDependency;

  int _aProperty;
}

class _$EvenSimplerDeviceDevice extends EvenSimplerDevice {
  _$EvenSimplerDeviceDevice();

  Host get host =>
      throw new Exception('only implementation objects are hosted');

  EvenSimplerDevice implementation(Map<Symbol, Object> dependencies) =>
      _$EvenSimplerDeviceImplementation(this, dependencies);
  @override
  Object invoke(Invocation invocation) =>
      throw new Exception('no invocation on devices');
  Provision provideRemote(Context context) =>
      throw new Exception('no RMI on devices');
  EvenSimplerDevice getRemote(Context context, String uuid) =>
      throw new Exception('no RMI on devices');
  @override
  Map<String, dynamic> toJson() => _$EvenSimplerDeviceToJson(this);
}

class _$EvenSimplerDeviceImplementation extends EvenSimplerDevice {
  Host _host;

  _$EvenSimplerDeviceImplementation(
      EvenSimplerDevice delegate, Map<Symbol, Object> parameters) {
    if (parameters == null) {
      ConstructionInfoException info = new ConstructionInfoException();
      info.dependencies.add(new Dependency(
          name: #host,
          type: [
            "asset:blackbird/lib/src/device.dart#Host",
            "asset:blackbird/lib/src/device.dart#Device",
            "dart:core#Object"
          ],
          device: this,
          module: null,
          isModule: false));
      info[#host].annotations.add(Runtime());
      throw info;
    }

    _host = parameters[#host];
  }

  Host get host => _host;

  EvenSimplerDevice implementation(Map<Symbol, Object> dependencies) =>
      throw Exception('this is already an implementation');
  @override
  Object invoke(Invocation invocation) =>
      _$EvenSimplerDeviceInvoker.invoke(invocation, this);
  Provision provideRemote(Context context) =>
      _$EvenSimplerDeviceRmi.provideRemote(context, this);
  EvenSimplerDevice getRemote(Context context, String uuid) =>
      _$EvenSimplerDeviceRmi.getRemote(context, uuid);
  @override
  Map<String, dynamic> toJson() => _$EvenSimplerDeviceToJson(this);
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
    if (invocation.isGetter && #calculatedProperty == invocation.memberName) {
      return target.calculatedProperty;
    }
    if (invocation.isSetter && #calculatedProperty == invocation.memberName) {
      target.calculatedProperty = invocation.positionalArguments[0];
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

class _$EvenSimplerDeviceInvoker {
  static dynamic invoke(Invocation invocation, EvenSimplerDevice target) {}
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimpleDevice _$SimpleDeviceFromJson(Map<String, dynamic> json) {
  return SimpleDevice.device()..aProperty = json['aProperty'] as int;
}

Map<String, dynamic> _$SimpleDeviceToJson(SimpleDevice instance) =>
    <String, dynamic>{
      'aProperty': instance.aProperty,
      'json_serializable.className':
          "asset:blackbird/test/device_generator/simple_device.dart#SimpleDevice",
    };

EvenSimplerDevice _$EvenSimplerDeviceFromJson(Map<String, dynamic> json) {
  return EvenSimplerDevice.device();
}

Map<String, dynamic> _$EvenSimplerDeviceToJson(EvenSimplerDevice instance) =>
    <String, dynamic>{
      'json_serializable.className':
          "asset:blackbird/test/device_generator/simple_device.dart#EvenSimplerDevice",
    };

// **************************************************************************
// ProxyGenerator
// **************************************************************************

class _$SimpleDeviceProxy implements SimpleDevice {
  Future<void> executiveMethod() async {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#executiveMethod, arguments, namedArguments);

    MetaFlags meta = new MetaFlags();

    return await _handle(_$invocation);
  }

  void postImplementation() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#postImplementation, arguments, namedArguments);

    MetaFlags meta = new MetaFlags();

    _handle(_$invocation);
  }

  Device implementation(Map dependencies) {
    List<Object> arguments = [];
    arguments.add(dependencies);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#implementation, arguments, namedArguments);

    MetaFlags meta = new MetaFlags();

    return _handle(_$invocation);
  }

  Provision provideRemote(Context context) {
    List<Object> arguments = [];
    arguments.add(context);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#provideRemote, arguments, namedArguments);

    MetaFlags meta = new MetaFlags();

    return _handle(_$invocation);
  }

  Object invoke(Invocation invocation) {
    List<Object> arguments = [];
    arguments.add(invocation);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#invoke, arguments, namedArguments);

    MetaFlags meta = new MetaFlags();

    return _handle(_$invocation);
  }

  Map<String, dynamic> toJson() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#toJson, arguments, namedArguments);

    MetaFlags meta = new MetaFlags();

    return _handle(_$invocation);
  }

  bool operator ==(Object other) {
    List<Object> arguments = [];
    arguments.add(other);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation = Invocation.method(#==, arguments, namedArguments);

    MetaFlags meta = new MetaFlags();

    return _handle(_$invocation);
  }

  String toString() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#toString, arguments, namedArguments);

    MetaFlags meta = new MetaFlags();

    return _handle(_$invocation);
  }

  dynamic noSuchMethod(Invocation invocation) {
    List<Object> arguments = [];
    arguments.add(invocation);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#noSuchMethod, arguments, namedArguments);

    MetaFlags meta = new MetaFlags();

    return _handle(_$invocation);
  }

  InvocationHandlerFunction _handle;
  _$SimpleDeviceProxy(this._handle) : super();

  int get aProperty {
    Invocation invocation = Invocation.getter(#aProperty);

    return _handle(invocation);
  }

  Device get otherDevice {
    Invocation invocation = Invocation.getter(#otherDevice);

    return _handle(invocation);
  }

  int get calculatedProperty {
    Invocation invocation = Invocation.getter(#calculatedProperty);

    return _handle(invocation);
  }

  int get aRuntimeDependency {
    Invocation invocation = Invocation.getter(#aRuntimeDependency);

    return _handle(invocation);
  }

  Future<int> get executiveGetter async {
    Invocation invocation = Invocation.getter(#executiveGetter);

    return await _handle(invocation);
  }

  set executiveSetter(int value) {
    Invocation invocation = Invocation.setter(#executiveSetter, value);

    _handle(invocation);
  }

  Blackbird get _blackbird {
    Invocation invocation = Invocation.getter(#_blackbird);

    return _handle(invocation);
  }

  Blackbird get blackbird {
    Invocation invocation = Invocation.getter(#blackbird);

    return _handle(invocation);
  }

  Host get host {
    Invocation invocation = Invocation.getter(#host);

    return _handle(invocation);
  }

  int get hashCode {
    Invocation invocation = Invocation.getter(#hashCode);

    return _handle(invocation);
  }

  Type get runtimeType {
    Invocation invocation = Invocation.getter(#runtimeType);

    return _handle(invocation);
  }
}

class _$EvenSimplerDeviceProxy implements EvenSimplerDevice {
  void postImplementation() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#postImplementation, arguments, namedArguments);

    MetaFlags meta = new MetaFlags();

    _handle(_$invocation);
  }

  Device implementation(Map dependencies) {
    List<Object> arguments = [];
    arguments.add(dependencies);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#implementation, arguments, namedArguments);

    MetaFlags meta = new MetaFlags();

    return _handle(_$invocation);
  }

  Provision provideRemote(Context context) {
    List<Object> arguments = [];
    arguments.add(context);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#provideRemote, arguments, namedArguments);

    MetaFlags meta = new MetaFlags();

    return _handle(_$invocation);
  }

  Object invoke(Invocation invocation) {
    List<Object> arguments = [];
    arguments.add(invocation);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#invoke, arguments, namedArguments);

    MetaFlags meta = new MetaFlags();

    return _handle(_$invocation);
  }

  Map<String, dynamic> toJson() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#toJson, arguments, namedArguments);

    MetaFlags meta = new MetaFlags();

    return _handle(_$invocation);
  }

  bool operator ==(Object other) {
    List<Object> arguments = [];
    arguments.add(other);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation = Invocation.method(#==, arguments, namedArguments);

    MetaFlags meta = new MetaFlags();

    return _handle(_$invocation);
  }

  String toString() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#toString, arguments, namedArguments);

    MetaFlags meta = new MetaFlags();

    return _handle(_$invocation);
  }

  dynamic noSuchMethod(Invocation invocation) {
    List<Object> arguments = [];
    arguments.add(invocation);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#noSuchMethod, arguments, namedArguments);

    MetaFlags meta = new MetaFlags();

    return _handle(_$invocation);
  }

  InvocationHandlerFunction _handle;
  _$EvenSimplerDeviceProxy(this._handle) : super();

  Blackbird get _blackbird {
    Invocation invocation = Invocation.getter(#_blackbird);

    return _handle(invocation);
  }

  Blackbird get blackbird {
    Invocation invocation = Invocation.getter(#blackbird);

    return _handle(invocation);
  }

  Host get host {
    Invocation invocation = Invocation.getter(#host);

    return _handle(invocation);
  }

  int get hashCode {
    Invocation invocation = Invocation.getter(#hashCode);

    return _handle(invocation);
  }

  Type get runtimeType {
    Invocation invocation = Invocation.getter(#runtimeType);

    return _handle(invocation);
  }
}

// **************************************************************************
// RmiGenerator
// **************************************************************************

class _$SimpleDeviceRmi {
  static void _registerSerializers(Context context) {}
  static void _registerStubConstructors(Context context) {
    context.registerRemoteStubConstructor(
        'asset:blackbird/lib/src/device.dart#Device', Device.getRemote);
    context.registerRemoteStubConstructor(
        'asset:blackbird/test/device_generator/simple_device.dart#SimpleDevice',
        getRemote);
  }

  static SimpleDevice getRemote(Context context, String uuid) {
    _registerSerializers(context);
    _registerStubConstructors(context);
    RmiProxyHandler handler = RmiProxyHandler(context, uuid);
    return _$SimpleDeviceProxy(handler.handle);
  }

  static Provision provideRemote(Context context, SimpleDevice target) {
    _registerSerializers(context);
    _registerStubConstructors(context);
    return rmiProvideRemote(context, target,
        'asset:blackbird/test/device_generator/simple_device.dart#SimpleDevice');
  }
}

class _$EvenSimplerDeviceRmi {
  static void _registerSerializers(Context context) {}
  static void _registerStubConstructors(Context context) {
    context.registerRemoteStubConstructor(
        'asset:blackbird/test/device_generator/simple_device.dart#EvenSimplerDevice',
        getRemote);
  }

  static EvenSimplerDevice getRemote(Context context, String uuid) {
    _registerSerializers(context);
    _registerStubConstructors(context);
    RmiProxyHandler handler = RmiProxyHandler(context, uuid);
    return _$EvenSimplerDeviceProxy(handler.handle);
  }

  static Provision provideRemote(Context context, EvenSimplerDevice target) {
    _registerSerializers(context);
    _registerStubConstructors(context);
    return rmiProvideRemote(context, target,
        'asset:blackbird/test/device_generator/simple_device.dart#EvenSimplerDevice');
  }
}
