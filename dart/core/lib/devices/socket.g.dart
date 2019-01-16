// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'socket.dart';

// **************************************************************************
// DeviceGenerator
// **************************************************************************

abstract class _$SocketDevice extends Socket {
  _$SocketDevice();

  Host get host =>
      throw new Exception('only implementation objects are hosted');

  Socket implementation(Map<Symbol, Object> dependencies) =>
      throw new Exception("cannot implement abstract device");
  @override
  Object invoke(Invocation invocation) =>
      throw new Exception('no invocation on devices');
  Provision provideRemote(Context context) =>
      throw new Exception('no RMI on devices');
  Socket getRemote(Context context, String uuid) =>
      throw new Exception('no RMI on devices');

  dynamic toggle() =>
      throw new Exception("you cannot execute stuff on devices");
  void writeState(int state) =>
      throw new Exception("you cannot execute stuff on devices");
}

// **************************************************************************
// InvokerGenerator
// **************************************************************************

class _$SocketInvoker {
  static dynamic invoke(Invocation invocation, Socket target) {
    if (invocation.isMethod && #toggle == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.toggle();
    }
  }
}

// **************************************************************************
// ProxyGenerator
// **************************************************************************

class _$SocketProxy implements Socket {
  dynamic toggle() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#toggle, arguments, namedArguments);

    MetaFlags meta = new MetaFlags();

    return _handle(_$invocation);
  }

  void writeState(int state) {
    List<Object> arguments = [];
    arguments.add(state);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#writeState, arguments, namedArguments);

    MetaFlags meta = new MetaFlags();

    _handle(_$invocation);
  }

  Future<void> turnOn() async {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#turnOn, arguments, namedArguments);

    MetaFlags meta = new MetaFlags();

    return await _handle(_$invocation);
  }

  Future<void> turnOff() async {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#turnOff, arguments, namedArguments);

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
  _$SocketProxy(this._handle) : super();

  int get states {
    Invocation invocation = Invocation.getter(#states);

    return _handle(invocation);
  }

  set state(int state) {
    Invocation invocation = Invocation.setter(#state, state);

    _handle(invocation);
  }

  set binaryState(bool binaryState) {
    Invocation invocation = Invocation.setter(#binaryState, binaryState);

    _handle(invocation);
  }

  int get _state {
    Invocation invocation = Invocation.getter(#_state);

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
}

// **************************************************************************
// RmiGenerator
// **************************************************************************

class _$SocketRmi {
  static void _registerSerializers(Context context) {}
  static void _registerStubConstructors(Context context) {
    context.registerRemoteStubConstructor(
        'asset:blackbird/lib/devices/socket.dart#Socket', getRemote);
  }

  static Socket getRemote(Context context, String uuid) {
    _registerSerializers(context);
    _registerStubConstructors(context);
    RmiProxyHandler handler = RmiProxyHandler(context, uuid);
    return _$SocketProxy(handler.handle);
  }

  static Provision provideRemote(Context context, Socket target) {
    _registerSerializers(context);
    _registerStubConstructors(context);
    return rmiProvideRemote(
        context, target, 'asset:blackbird/lib/devices/socket.dart#Socket');
  }
}
