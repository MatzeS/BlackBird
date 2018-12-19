// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'socket.dart';

// **************************************************************************
// DeviceGenerator
// **************************************************************************

class _$SocketDevice extends Socket {
  _$SocketDevice();

  Socket implementation(Map<Symbol, Object> dependencies) =>
      throw new Exception('no invocation on devices');
  @override
  Object invoke(Invocation invocation) =>
      throw new Exception('no invocation on devices');
  Provision provideRemote(Context context) =>
      throw new Exception('no RMI on devices');
  Socket getRemote(Context context, String uuid) =>
      throw new Exception('no RMI on devices');

  Blackbird get blackbird => blackbird.interfaceDevice(this).blackbird;
  set blackbird(Blackbird blackbird) =>
      blackbird.interfaceDevice(this).blackbird = blackbird;
  Host get host => throw new Exception(
      'cannot get runtime dependencys on device representation');
  void toggle() => blackbird.interfaceDevice(this).toggle();
  void turnOff() => blackbird.interfaceDevice(this).turnOff();
  void turnOn() => blackbird.interfaceDevice(this).turnOn();
  bool get state => blackbird.interfaceDevice(this).state;
  set state(bool state) => blackbird.interfaceDevice(this).state = state;
}

class _$RemoteSocketDevice extends RemoteSocket {
  _$RemoteSocketDevice();

  RemoteSocket implementation(Map<Symbol, Object> dependencies) =>
      throw new Exception('no invocation on devices');
  @override
  Object invoke(Invocation invocation) =>
      throw new Exception('no invocation on devices');
  Provision provideRemote(Context context) =>
      throw new Exception('no RMI on devices');
  RemoteSocket getRemote(Context context, String uuid) =>
      throw new Exception('no RMI on devices');

  bool get state => blackbird.interfaceDevice(this).state;
  set state(bool state) => blackbird.interfaceDevice(this).state = state;
  Blackbird get blackbird => blackbird.interfaceDevice(this).blackbird;
  set blackbird(Blackbird blackbird) =>
      blackbird.interfaceDevice(this).blackbird = blackbird;
  Host get host => throw new Exception(
      'cannot get runtime dependencys on device representation');
  void toggle() => blackbird.interfaceDevice(this).toggle();
  void turnOff() => blackbird.interfaceDevice(this).turnOff();
  void turnOn() => blackbird.interfaceDevice(this).turnOn();

  set remoteState(bool state) =>
      blackbird.interfaceDevice(this).remoteState = state;
}

// **************************************************************************
// InvokerGenerator
// **************************************************************************

class _$SocketInvoker {
  static dynamic invoke(Invocation invocation, Socket target) {
    if (invocation.isGetter && #state == invocation.memberName) {
      return target.state;
    }
    if (invocation.isSetter && #state == invocation.memberName) {
      target.state = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isMethod && #toggle == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.toggle();
    }
    if (invocation.isMethod && #turnOff == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.turnOff();
    }
    if (invocation.isMethod && #turnOn == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.turnOn();
    }
  }
}

class _$RemoteSocketInvoker {
  static dynamic invoke(Invocation invocation, RemoteSocket target) {
    if (invocation.isGetter && #_state == invocation.memberName) {
      return target._state;
    }
    if (invocation.isSetter && #_state == invocation.memberName) {
      target._state = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isGetter && #state == invocation.memberName) {
      return target.state;
    }
    if (invocation.isSetter && #state == invocation.memberName) {
      target.state = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isSetter && #remoteState == invocation.memberName) {
      target.remoteState = invocation.positionalArguments[0];
      return null;
    }
  }
}

// **************************************************************************
// ProxyGenerator
// **************************************************************************

class _$SocketProxy implements Socket {
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

  void toggle() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#toggle, arguments, namedArguments);

    _handle(_$invocation);
  }

  void turnOff() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#turnOff, arguments, namedArguments);

    _handle(_$invocation);
  }

  void turnOn() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#turnOn, arguments, namedArguments);

    _handle(_$invocation);
  }

  InvocationHandlerFunction _handle;
  _$SocketProxy(this._handle) : super();

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

  bool get state {
    Invocation invocation = Invocation.getter(#state);

    return _handle(invocation);
  }
}

class _$RemoteSocketProxy implements RemoteSocket {
  void toggle() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#toggle, arguments, namedArguments);

    _handle(_$invocation);
  }

  void turnOff() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#turnOff, arguments, namedArguments);

    _handle(_$invocation);
  }

  void turnOn() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#turnOn, arguments, namedArguments);

    _handle(_$invocation);
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

  InvocationHandlerFunction _handle;
  _$RemoteSocketProxy(this._handle) : super();

  bool get state {
    Invocation invocation = Invocation.getter(#state);

    return _handle(invocation);
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

  bool get _state {
    Invocation invocation = Invocation.getter(#_state);

    return _handle(invocation);
  }

  set remoteState(bool state) {
    Invocation invocation = Invocation.setter(#remoteState, state);

    _handle(invocation);
  }
}

// **************************************************************************
// RmiGenerator
// **************************************************************************

class _$SocketRmi {
  static bool _registered = false;
  static void _registerSerializers() {
    if (_registered) return;
    _registered = true;

    rmiRegisterSerializers([]);
  }

  static void _registerStubConstructors(Context context) {}
  static Socket getRemote(Context context, String uuid) {
    _registerSerializers();
    _registerStubConstructors(context);
    RmiProxyHandler handler = RmiProxyHandler(context, uuid);
    return _$SocketProxy(handler.handle);
  }

  static Provision provideRemote(Context context, Socket target) {
    _registerSerializers();
    _registerStubConstructors(context);
    return rmiProvideRemote(context, target);
  }
}

class _$RemoteSocketRmi {
  static bool _registered = false;
  static void _registerSerializers() {
    if (_registered) return;
    _registered = true;

    rmiRegisterSerializers([]);
  }

  static void _registerStubConstructors(Context context) {}
  static RemoteSocket getRemote(Context context, String uuid) {
    _registerSerializers();
    _registerStubConstructors(context);
    RmiProxyHandler handler = RmiProxyHandler(context, uuid);
    return _$RemoteSocketProxy(handler.handle);
  }

  static Provision provideRemote(Context context, RemoteSocket target) {
    _registerSerializers();
    _registerStubConstructors(context);
    return rmiProvideRemote(context, target);
  }
}
