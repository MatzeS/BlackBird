// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// DeviceGenerator
// **************************************************************************

class _$HostDevice implements Host {
  _$HostDevice();

  Host implementation(Map<Symbol, Object> dependencies) =>
      _$HostImplementation(this, dependencies);
  @override
  Object invoke(Invocation invocation) =>
      _$HostInvoker.invoke(invocation, this);
  Provision provideRemote(Context context) =>
      _$HostRmi.provideRemote(context, this);
  Host getRemote(Context context, String uuid) =>
      _$HostRmi.getRemote(context, uuid);

  int get hashCode => Blackbird().interfaceDevice(this).hashCode;
  Type get runtimeType => Blackbird().interfaceDevice(this).runtimeType;
  Host get host => throw new Exception(
      'cannot get runtime dependencys on device representation');
}

class _$HostImplementation extends Host {
  Host _host;

  _$HostImplementation(Host delegate, Map<Symbol, Object> parameters)
      : super._() {
    if (parameters == null) {
      ConstructionInfoException info = new ConstructionInfoException();
      info.dependencies.add(new Dependency(
          name: #host,
          type: ["asset:blackbird/lib/device.dart#Host", "dart:core#Object"],
          device: this,
          module: null,
          isModule: false));
      info[#host].annotations.add(Runtime());
      throw info;
    }

    _host = parameters[#host];
  }

  Host implementation(Map<Symbol, Object> dependencies) =>
      throw Exception('this is already an implementation');
  @override
  Object invoke(Invocation invocation) =>
      _$HostInvoker.invoke(invocation, this);
  Provision provideRemote(Context context) =>
      _$HostRmi.provideRemote(context, this);
  Host getRemote(Context context, String uuid) =>
      _$HostRmi.getRemote(context, uuid);

  Host get host => _host;
}

// **************************************************************************
// InvokerGenerator
// **************************************************************************

class _$DeviceInvoker {
  static dynamic invoke(Invocation invocation, Device target) {
    if (invocation.isGetter && #host == invocation.memberName) {
      return target.host;
    }
    if (invocation.isMethod && #implementation == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.implementation(
        positionalArguments[0],
      );
    }
  }
}

class _$HostInvoker {
  static dynamic invoke(Invocation invocation, Host target) {}
}

// **************************************************************************
// ProxyGenerator
// **************************************************************************

class _$DeviceProxy implements Device {
  InvocationHandlerFunction _handle;
  _$DeviceProxy(this._handle) : super();

  Host get host {
    Invocation invocation = Invocation.getter(#host);

    return _handle(invocation);
  }

  Device implementation(Map dependencies) {
    List<Object> arguments = [];
    arguments.add(dependencies);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#implementation, arguments, namedArguments);

    return _handle(_$invocation);
  }

  int get hashCode {
    Invocation invocation = Invocation.getter(#hashCode);

    return _handle(invocation);
  }

  Type get runtimeType {
    Invocation invocation = Invocation.getter(#runtimeType);

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

class _$HostProxy implements Host {
  InvocationHandlerFunction _handle;
  _$HostProxy(this._handle) : super();

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

class _$DeviceRmi {
  static bool _registered = false;
  static void _registerSerializers() {
    if (_registered) return;
    _registered = true;

    rmiRegisterSerializers([]);
  }

  static void _registerStubConstructors(Context context) {
    context.registerRemoteStubConstructor('Host', Host.getRemote);
    context.registerRemoteStubConstructor('Device', Device.getRemote);
  }

  static Device getRemote(Context context, String uuid) {
    _registerSerializers();
    _registerStubConstructors(context);
    RmiProxyHandler handler = RmiProxyHandler(context, uuid);
    return _$DeviceProxy(handler.handle);
  }

  static Provision provideRemote(Context context, Device target) {
    _registerSerializers();
    _registerStubConstructors(context);
    return rmiProvideRemote(context, target);
  }
}

class _$HostRmi {
  static bool _registered = false;
  static void _registerSerializers() {
    if (_registered) return;
    _registered = true;

    rmiRegisterSerializers([]);
  }

  static void _registerStubConstructors(Context context) {
    context.registerRemoteStubConstructor('Host', Host.getRemote);
  }

  static Host getRemote(Context context, String uuid) {
    _registerSerializers();
    _registerStubConstructors(context);
    RmiProxyHandler handler = RmiProxyHandler(context, uuid);
    return _$HostProxy(handler.handle);
  }

  static Provision provideRemote(Context context, Host target) {
    _registerSerializers();
    _registerStubConstructors(context);
    return rmiProvideRemote(context, target);
  }
}
