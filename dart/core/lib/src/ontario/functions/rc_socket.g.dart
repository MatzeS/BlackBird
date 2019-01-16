// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rc_socket.dart';

// **************************************************************************
// DeviceGenerator
// **************************************************************************

class _$RCSocketDevice extends RCSocket {
  _$RCSocketDevice();

  Host get host =>
      throw new Exception('only implementation objects are hosted');

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
  Map<String, dynamic> toJson() => _$RCSocketToJson(this);

  AVRConnection get connection => throw new Exception(
      'cannot get runtime dependencys on device representation');
  void writeState(int state) =>
      throw new Exception("you cannot execute stuff on devices");
  dynamic toggle() =>
      throw new Exception("you cannot execute stuff on devices");
}

class _$RCSocketImplementation extends RCSocket {
  AVRConnection _connection;
  Host _host;

  _$RCSocketImplementation(RCSocket delegate, Map<Symbol, Object> parameters) {
    if (parameters == null) {
      ConstructionInfoException info = new ConstructionInfoException();
      info.dependencies.add(new Dependency(
          name: #connection,
          type: [
            "asset:blackbird/lib/src/ontario/connection.dart#AVRConnection",
            "asset:blackbird/lib/src/connection.dart#Connection",
            "asset:async/lib/src/delegate/stream.dart#DelegatingStream",
            "dart:async#StreamView",
            "dart:async#Stream",
            "dart:core#Object"
          ],
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
      info[#connection].annotations.add(Runtime());
      info[#host].annotations.add(Runtime());
      throw info;
    }

    _connection = parameters[#connection];
    _host = parameters[#host];
    _address = delegate.address;
  }

  Host get host => _host;

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
  Map<String, dynamic> toJson() => _$RCSocketToJson(this);

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
    if (invocation.isMethod && #writeState == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.writeState(
        positionalArguments[0],
      );
    }
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RCSocket _$RCSocketFromJson(Map<String, dynamic> json) {
  return RCSocket.device()..address = json['address'] as int;
}

Map<String, dynamic> _$RCSocketToJson(RCSocket instance) => <String, dynamic>{
      'address': instance.address,
      'json_serializable.className':
          "asset:blackbird/lib/src/ontario/functions/rc_socket.dart#RCSocket",
    };

// **************************************************************************
// ProxyGenerator
// **************************************************************************

class _$RCSocketProxy implements RCSocket {
  void writeState(int state) {
    List<Object> arguments = [];
    arguments.add(state);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#writeState, arguments, namedArguments);

    MetaFlags meta = new MetaFlags();

    _handle(_$invocation);
  }

  dynamic toggle() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#toggle, arguments, namedArguments);

    MetaFlags meta = new MetaFlags();

    return _handle(_$invocation);
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
  _$RCSocketProxy(this._handle) : super();

  int get address {
    Invocation invocation = Invocation.getter(#address);

    return _handle(invocation);
  }

  AVRConnection get connection {
    Invocation invocation = Invocation.getter(#connection);

    return _handle(invocation);
  }

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

class _$RCSocketRmi {
  static void _registerSerializers(Context context) {}
  static void _registerStubConstructors(Context context) {
    context.registerRemoteStubConstructor(
        'asset:blackbird/lib/src/ontario/functions/rc_socket.dart#RCSocket',
        getRemote);
  }

  static RCSocket getRemote(Context context, String uuid) {
    _registerSerializers(context);
    _registerStubConstructors(context);
    RmiProxyHandler handler = RmiProxyHandler(context, uuid);
    return _$RCSocketProxy(handler.handle);
  }

  static Provision provideRemote(Context context, RCSocket target) {
    _registerSerializers(context);
    _registerStubConstructors(context);
    return rmiProvideRemote(context, target,
        'asset:blackbird/lib/src/ontario/functions/rc_socket.dart#RCSocket');
  }
}
