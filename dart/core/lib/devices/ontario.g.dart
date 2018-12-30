// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ontario.dart';

// **************************************************************************
// DeviceGenerator
// **************************************************************************

class _$OntarioDevice extends Ontario {
  _$OntarioDevice();

  Host get host =>
      throw new Exception('only implementation objects are hosted');

  Ontario implementation(Map<Symbol, Object> dependencies) =>
      _$OntarioImplementation(this, dependencies);
  @override
  Object invoke(Invocation invocation) =>
      throw new Exception('no invocation on devices');
  Provision provideRemote(Context context) =>
      throw new Exception('no RMI on devices');
  Ontario getRemote(Context context, String uuid) =>
      throw new Exception('no RMI on devices');
  @override
  Map<String, dynamic> serialize() => _$OntarioToJson(this);
  static Ontario deserialize(Map json) => _$OntarioFromJson(json);

  AVRConnection get connection => throw new Exception(
      'cannot get runtime dependencys on device representation');
  Future<void> writeRegister(int slave, int register, int value) => blackbird
      .interfaceDevice<Ontario>(this)
      .writeRegister(slave, register, value);
  Future<int> readRegister(int slave, int register) async =>
      blackbird.interfaceDevice<Ontario>(this).readRegister(slave, register);
  Future<void> writeRegisters(int slave, int register, List values) async =>
      blackbird
          .interfaceDevice<Ontario>(this)
          .writeRegisters(slave, register, values);
  Future<List<int>> readRegisters(int slave, int register, int length) async =>
      blackbird
          .interfaceDevice<Ontario>(this)
          .readRegisters(slave, register, length);
}

class _$OntarioImplementation extends Ontario {
  AVRConnection _connection;
  Host _host;

  _$OntarioImplementation(Ontario delegate, Map<Symbol, Object> parameters) {
    if (parameters == null) {
      ConstructionInfoException info = new ConstructionInfoException();
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

    _connection = parameters[#connection];
    _host = parameters[#host];
  }

  Host get host => _host;

  Ontario implementation(Map<Symbol, Object> dependencies) =>
      throw Exception('this is already an implementation');
  @override
  Object invoke(Invocation invocation) =>
      _$OntarioInvoker.invoke(invocation, this);
  Provision provideRemote(Context context) =>
      _$OntarioRmi.provideRemote(context, this);
  Ontario getRemote(Context context, String uuid) =>
      _$OntarioRmi.getRemote(context, uuid);
  @override
  Map<String, dynamic> serialize() => _$OntarioToJson(this);

  AVRConnection get connection => _connection;
}

// **************************************************************************
// InvokerGenerator
// **************************************************************************

class _$OntarioInvoker {
  static dynamic invoke(Invocation invocation, Ontario target) {
    if (invocation.isGetter && #connection == invocation.memberName) {
      return target.connection;
    }
    if (invocation.isMethod && #writeRegister == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 3; i++)
        positionalArguments.add(null);

      return target.writeRegister(
        positionalArguments[0],
        positionalArguments[1],
        positionalArguments[2],
      );
    }
    if (invocation.isMethod && #readRegister == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 2; i++)
        positionalArguments.add(null);

      return target.readRegister(
        positionalArguments[0],
        positionalArguments[1],
      );
    }
    if (invocation.isMethod && #writeRegisters == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 3; i++)
        positionalArguments.add(null);

      return target.writeRegisters(
        positionalArguments[0],
        positionalArguments[1],
        positionalArguments[2],
      );
    }
    if (invocation.isMethod && #readRegisters == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 3; i++)
        positionalArguments.add(null);

      return target.readRegisters(
        positionalArguments[0],
        positionalArguments[1],
        positionalArguments[2],
      );
    }
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ontario _$OntarioFromJson(Map<String, dynamic> json) {
  return Ontario.device();
}

Map<String, dynamic> _$OntarioToJson(Ontario instance) => <String, dynamic>{};

// **************************************************************************
// ProxyGenerator
// **************************************************************************

class _$OntarioProxy implements Ontario {
  Future<void> writeRegister(int slave, int register, int value) {
    List<Object> arguments = [];
    arguments.add(slave);
    arguments.add(register);
    arguments.add(value);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#writeRegister, arguments, namedArguments);

    return _handle(_$invocation);
  }

  Future<int> readRegister(int slave, int register) async {
    List<Object> arguments = [];
    arguments.add(slave);
    arguments.add(register);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#readRegister, arguments, namedArguments);

    return await _handle(_$invocation);
  }

  Future<void> writeRegisters(int slave, int register, List values) async {
    List<Object> arguments = [];
    arguments.add(slave);
    arguments.add(register);
    arguments.add(values);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#writeRegisters, arguments, namedArguments);

    return await _handle(_$invocation);
  }

  Future<List<int>> readRegisters(int slave, int register, int length) async {
    List<Object> arguments = [];
    arguments.add(slave);
    arguments.add(register);
    arguments.add(length);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#readRegisters, arguments, namedArguments);

    return await _handle(_$invocation);
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
  _$OntarioProxy(this._handle) : super();

  AVRConnection get connection {
    Invocation invocation = Invocation.getter(#connection);

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

class _$OntarioRmi {
  static bool _registered = false;
  static void _registerSerializers() {
    if (_registered) return;
    _registered = true;

    rmiRegisterSerializers([]);
  }

  static void _registerStubConstructors(Context context) {
    context.registerRemoteStubConstructor('Ontario', getRemote);
  }

  static Ontario getRemote(Context context, String uuid) {
    _registerSerializers();
    _registerStubConstructors(context);
    RmiProxyHandler handler = RmiProxyHandler(context, uuid);
    return _$OntarioProxy(handler.handle);
  }

  static Provision provideRemote(Context context, Ontario target) {
    _registerSerializers();
    _registerStubConstructors(context);
    return rmiProvideRemote(context, target);
  }
}
