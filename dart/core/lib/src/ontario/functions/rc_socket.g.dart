// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rc_socket.dart';

// **************************************************************************
// DeviceGenerator
// **************************************************************************

class _$RCSocketDevice extends RCSocket {
  _$RCSocketDevice();

  RCSocket implementation(Map<Symbol, Object> dependencies) =>
      _$RCSocketImplementation(this, dependencies);
  @override
  Object invoke(Invocation invocation) =>
      throw new Exception('no invocation on devices');
  Provision provideRemote(Context context) =>
      throw new Exception('no RMI on devices');
  RCSocket getRemote(Context context, String uuid) =>
      throw new Exception('no RMI on devices');
  @override
  Map<String, dynamic> serialize() => _$RCSocketToJson(this);
  static RCSocket deserialize(Map json) => _$RCSocketFromJson(json);

  bool get state => blackbird.interfaceDevice<RCSocket>(this).state;
  set state(bool state) =>
      blackbird.interfaceDevice<RCSocket>(this).state = state;
  Host get host => throw new Exception(
      'cannot get runtime dependencys on device representation');
  void toggle() => blackbird.interfaceDevice<RCSocket>(this).toggle();
  void turnOff() => blackbird.interfaceDevice<RCSocket>(this).turnOff();
  void turnOn() => blackbird.interfaceDevice<RCSocket>(this).turnOn();

  AVRConnection get connection => throw new Exception(
      'cannot get runtime dependencys on device representation');
  set remoteState(bool state) =>
      blackbird.interfaceDevice<RCSocket>(this).remoteState = state;

  int address;
}

class _$RCSocketImplementation extends RCSocket {
  Host _host;
  AVRConnection _connection;

  _$RCSocketImplementation(RCSocket delegate, Map<Symbol, Object> parameters) {
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
      info.dependencies.add(new Dependency(
          name: #connection,
          type: [
            "asset:blackbird/lib/src/ontario/connection.dart#AVRConnection",
            "asset:blackbird/lib/src/connection.dart#PacketConnection",
            "asset:blackbird/lib/src/connection.dart#Connection",
            "dart:core#Object"
          ],
          device: this,
          module: null,
          isModule: false));
      info[#host].annotations.add(Runtime());
      info[#connection].annotations.add(Runtime());
      throw info;
    }

    _host = parameters[#host];
    _connection = parameters[#connection];
    _address = delegate.address;
  }

  RCSocket implementation(Map<Symbol, Object> dependencies) =>
      throw Exception('this is already an implementation');
  @override
  Object invoke(Invocation invocation) =>
      _$RCSocketInvoker.invoke(invocation, this);
  Provision provideRemote(Context context) =>
      _$RCSocketRmi.provideRemote(context, this);
  RCSocket getRemote(Context context, String uuid) =>
      _$RCSocketRmi.getRemote(context, uuid);
  @override
  Map<String, dynamic> serialize() => _$RCSocketToJson(this);

  Host get host => _host;

  int get address => _address;
  set address(int _address) => throw new Exception(
      'cannot change device property after implementationconstruction');
  AVRConnection get connection => _connection;

  int _address;
}

// **************************************************************************
// InvokerGenerator
// **************************************************************************

class _$RCSocketInvoker {
  static dynamic invoke(Invocation invocation, RCSocket target) {
    if (invocation.isGetter && #address == invocation.memberName) {
      return target.address;
    }
    if (invocation.isSetter && #address == invocation.memberName) {
      target.address = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isGetter && #connection == invocation.memberName) {
      return target.connection;
    }
    if (invocation.isSetter && #remoteState == invocation.memberName) {
      target.remoteState = invocation.positionalArguments[0];
      return null;
    }
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RCSocket _$RCSocketFromJson(Map<String, dynamic> json) {
  return RCSocket.device()..address = json['address'] as int;
}

Map<String, dynamic> _$RCSocketToJson(RCSocket instance) =>
    <String, dynamic>{'address': instance.address};

// **************************************************************************
// ProxyGenerator
// **************************************************************************

class _$RCSocketProxy implements RCSocket {
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

  Map<String, dynamic> serialize() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#serialize, arguments, namedArguments);

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
  _$RCSocketProxy(this._handle) : super();

  bool get _state {
    Invocation invocation = Invocation.getter(#_state);

    return _handle(invocation);
  }

  bool get state {
    Invocation invocation = Invocation.getter(#state);

    return _handle(invocation);
  }

  set remoteState(bool state) {
    Invocation invocation = Invocation.setter(#remoteState, state);

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

  int get address {
    Invocation invocation = Invocation.getter(#address);

    return _handle(invocation);
  }

  AVRConnection get connection {
    Invocation invocation = Invocation.getter(#connection);

    return _handle(invocation);
  }
}

// **************************************************************************
// RmiGenerator
// **************************************************************************

class _$RCSocketRmi {
  static bool _registered = false;
  static void _registerSerializers() {
    if (_registered) return;
    _registered = true;

    rmiRegisterSerializers([]);
  }

  static void _registerStubConstructors(Context context) {}
  static RCSocket getRemote(Context context, String uuid) {
    _registerSerializers();
    _registerStubConstructors(context);
    RmiProxyHandler handler = RmiProxyHandler(context, uuid);
    return _$RCSocketProxy(handler.handle);
  }

  static Provision provideRemote(Context context, RCSocket target) {
    _registerSerializers();
    _registerStubConstructors(context);
    return rmiProvideRemote(context, target);
  }
}
