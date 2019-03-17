// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ontario.dart';

// **************************************************************************
// DeviceGenerator
// **************************************************************************

class _$OntarioDevice extends Ontario {
  _$OntarioDevice() : super._();

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
  get hooks => _$OntarioHooks;
  @override
  Map<String, dynamic> toJson() => _$OntarioToJson(this);

  AVRConnection get connection => throw new Exception(
      'cannot get runtime dependencys on device representation');
  Stream<int> get receive =>
      throw new Exception("you cannot execute stuff on devices");
  Stream<void> get commonInterrupt =>
      throw new Exception("you cannot execute stuff on devices");
  Future<void> transmitIRCode(int code) async =>
      throw new Exception("you cannot execute stuff on devices");
  dynamic setupCommonInterruptStream() =>
      throw new Exception("you cannot execute stuff on devices");
  Future<void> writeRegisters(int slave, int register, List values) async =>
      throw new Exception("you cannot execute stuff on devices");
  Future<List<int>> readRegisters(int slave, int register, int length) async =>
      throw new Exception("you cannot execute stuff on devices");
}

class _$OntarioImplementation extends Ontario {
  AVRConnection _connection;
  Host _host;

  _$OntarioImplementation(Ontario delegate, Map<Symbol, Object> parameters)
      : super._() {
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
      info[#host].annotations.add(Runtime());
      throw info;
    }

    _connection = parameters[#connection];
    _connection = parameters[#connection];
    _host = parameters[#host];
  }

  Host get host => _host;

  Ontario implementation(Map<Symbol, Object> dependencies) =>
      throw Exception('this($this) is already an implementation');
  @override
  Object invoke(Invocation invocation) =>
      _$OntarioInvoker.invoke(invocation, this);
  Provision provideRemote(Context context) =>
      _$OntarioRmi.provideRemote(context, this);
  Ontario getRemote(Context context, String uuid) =>
      _$OntarioRmi.getRemote(context, uuid);
  @override
  Map<String, dynamic> toJson() => _$OntarioToJson(this);

  get hooks => _$OntarioHooks;

  AVRConnection get connection => _connection;
}

Map<String, dynamic> get _$OntarioHooks {
  return {
    "classURL": "asset:blackbird/lib/devices/ontario.dart#Ontario",
    "remote": _$OntarioRmi.getRemote,
    "fromJson": _$OntarioFromJson
  };
}

// **************************************************************************
// DeviceJsonSerializableGenerator
// **************************************************************************

Ontario _$OntarioFromJson(Map<String, dynamic> json) {
  return Ontario();
}

Map<String, dynamic> _$OntarioToJson(Ontario instance) => <String, dynamic>{
      'json_serializable.className':
          "asset:blackbird/lib/devices/ontario.dart#Ontario",
    };

// **************************************************************************
// InvokerGenerator
// **************************************************************************

class _$OntarioInvoker {
  static dynamic invoke(Invocation invocation, Ontario target) {
    if (invocation.isMethod && #transmitIRCode == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.transmitIRCode(
        positionalArguments[0],
      );
    }
    if (invocation.isMethod &&
        #setupCommonInterruptStream == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.setupCommonInterruptStream();
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
    if (invocation.isGetter && #connection == invocation.memberName) {
      return target.connection;
    }
    if (invocation.isGetter && #receive == invocation.memberName) {
      return target.receive;
    }
    if (invocation.isGetter && #commonInterrupt == invocation.memberName) {
      return target.commonInterrupt;
    }
    if (invocation.isGetter && #blackbird == invocation.memberName) {
      return target.blackbird;
    }
    if (invocation.isSetter && #blackbird == invocation.memberName) {
      target.blackbird = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isGetter && #host == invocation.memberName) {
      return target.host;
    }
    if (invocation.isGetter && #hooks == invocation.memberName) {
      return target.hooks;
    }
    if (invocation.isGetter && #hashCode == invocation.memberName) {
      return target.hashCode;
    }
    if (invocation.isGetter && #runtimeType == invocation.memberName) {
      return target.runtimeType;
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
    if (invocation.isMethod && #provideRemote == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.provideRemote(
        positionalArguments[0],
      );
    }
    if (invocation.isMethod && #toJson == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.toJson();
    }
    if (invocation.isMethod && #== == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target == positionalArguments[0];
    }
    if (invocation.isMethod && #toString == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.toString();
    }
    if (invocation.isMethod && #noSuchMethod == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.noSuchMethod(
        positionalArguments[0],
      );
    }
    if (invocation.isMethod && #== == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target == positionalArguments[0];
    }
  }
}

// **************************************************************************
// ProxyGenerator
// **************************************************************************

class _$OntarioProxy implements Ontario {
  Future<void> transmitIRCode(int code) async {
    List<Object> arguments = [];
    arguments.add(code);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#transmitIRCode, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return await _handle(_$invocation, metadata);
  }

  dynamic setupCommonInterruptStream() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation = Invocation.method(
        #setupCommonInterruptStream, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  Future<void> writeRegisters(int slave, int register, List values) async {
    List<Object> arguments = [];
    arguments.add(slave);
    arguments.add(register);
    arguments.add(values);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#writeRegisters, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.positionalArgumentMetadata.add([]);
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return await _handle(_$invocation, metadata);
  }

  Future<List<int>> readRegisters(int slave, int register, int length) async {
    List<Object> arguments = [];
    arguments.add(slave);
    arguments.add(register);
    arguments.add(length);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#readRegisters, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.positionalArgumentMetadata.add([]);
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return await _handle(_$invocation, metadata);
  }

  Device implementation(Map dependencies) {
    List<Object> arguments = [];
    arguments.add(dependencies);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#implementation, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  Provision provideRemote(Context context) {
    List<Object> arguments = [];
    arguments.add(context);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#provideRemote, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  Object invoke(Invocation invocation) {
    List<Object> arguments = [];
    arguments.add(invocation);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#invoke, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  Map<String, dynamic> toJson() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#toJson, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  bool operator ==(Object other) {
    List<Object> arguments = [];
    arguments.add(other);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation = Invocation.method(#==, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  String toString() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#toString, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  dynamic noSuchMethod(Invocation invocation) {
    List<Object> arguments = [];
    arguments.add(invocation);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#noSuchMethod, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  InvocationHandlerFunction _handle;
  _$OntarioProxy(this._handle) : super();

  AVRConnection get connection {
    Invocation invocation = Invocation.getter(#connection);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = true;

    return _handle(invocation, metadata);
  }

  Stream<int> get receive {
    Invocation invocation = Invocation.getter(#receive);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = true;

    return _handle(invocation, metadata);
  }

  Stream<void> get commonInterrupt {
    Invocation invocation = Invocation.getter(#commonInterrupt);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = true;

    return _handle(invocation, metadata);
  }

  Blackbird get blackbird {
    Invocation invocation = Invocation.getter(#blackbird);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  Host get host {
    Invocation invocation = Invocation.getter(#host);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.elementMetadata.add(Runtime());
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  Map<String, dynamic> get hooks {
    Invocation invocation = Invocation.getter(#hooks);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  int get hashCode {
    Invocation invocation = Invocation.getter(#hashCode);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  Type get runtimeType {
    Invocation invocation = Invocation.getter(#runtimeType);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }
}

// **************************************************************************
// RmiGenerator
// **************************************************************************

class _$OntarioRmi {
  static void _registerSerializers(Context context) {}
  static void _registerStubConstructors(Context context) {
    context.registerRemoteStubConstructor(
        'asset:blackbird/lib/devices/ontario.dart#Ontario', getRemote);
  }

  static Ontario getRemote(Context context, String uuid) {
    _registerSerializers(context);
    _registerStubConstructors(context);
    RmiProxyHandler handler = RmiProxyHandler(context, uuid);
    return _$OntarioProxy(handler.handle);
  }

  static Provision provideRemote(Context context, Ontario target) {
    _registerSerializers(context);
    _registerStubConstructors(context);
    return rmiProvideRemote(
        context, target, 'asset:blackbird/lib/devices/ontario.dart#Ontario');
  }
}
