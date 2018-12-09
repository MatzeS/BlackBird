// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// DeviceGenerator
// **************************************************************************

class _$HostDevice extends Host {
  Host implementation() => _$HostImplementation(this);

  @override
  Object invoke(Invocation invocation) =>
      _$HostInvoker.invoke(invocation, this);
  Provision provideRemote(Context context) =>
      _$HostRmi.provideRemote(context, this);
  Host getRemote(Context context, String uuid) =>
      _$HostRmi.getRemote(context, uuid);

  _$HostDevice() : super();
}

class _$HostImplementation extends Host {
  _$HostImplementation(Host device) : super() {}

  Host implementation() => _$HostImplementation(this);

  @override
  Object invoke(Invocation invocation) =>
      _$HostInvoker.invoke(invocation, this);
  Provision provideRemote(Context context) =>
      _$HostRmi.provideRemote(context, this);
  Host getRemote(Context context, String uuid) =>
      _$HostRmi.getRemote(context, uuid);
}

// **************************************************************************
// InvokerGenerator
// **************************************************************************

class _$DeviceInvoker {
  static dynamic invoke(Invocation invocation, Device target) {
    if (invocation.isMethod && #implementation == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.implementation();
    }
    if (invocation.isMethod && #getRemote == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 2; i++)
        positionalArguments.add(null);

      return target.getRemote(
        positionalArguments[0],
        positionalArguments[1],
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

  Device implementation() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#implementation, arguments, namedArguments);

    return _handle(_$invocation);
  }

  Device getRemote(Context context, String uuid) {
    List<Object> arguments = [];
    arguments.add(context);
    arguments.add(uuid);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#getRemote, arguments, namedArguments);

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

  Device implementation() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#implementation, arguments, namedArguments);

    return _handle(_$invocation);
  }

  Device getRemote(Context context, String uuid) {
    List<Object> arguments = [];
    arguments.add(context);
    arguments.add(uuid);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#getRemote, arguments, namedArguments);

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
    context.registerRemoteStubConstructor('Device', _$DeviceRmi.getRemote);
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

  static void _registerStubConstructors(Context context) {}
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
