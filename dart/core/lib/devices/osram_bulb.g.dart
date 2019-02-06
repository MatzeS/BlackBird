// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'osram_bulb.dart';

// **************************************************************************
// DeviceGenerator
// **************************************************************************

class _$OsramBulbDevice extends OsramBulb {
  _$OsramBulbDevice() : super._();

  Host get host =>
      throw new Exception('only implementation objects are hosted');

  OsramBulb implementation(Map<Symbol, Object> dependencies) =>
      _$OsramBulbImplementation(this, dependencies);
  @override
  Object invoke(Invocation invocation) =>
      throw new Exception('no invocation on devices');
  Provision provideRemote(Context context) =>
      throw new Exception('no RMI on devices');
  OsramBulb getRemote(Context context, String uuid) =>
      throw new Exception('no RMI on devices');
  get hooks => _$OsramBulbHooks;
  @override
  Map<String, dynamic> toJson() => _$OsramBulbToJson(this);

  Future<void> turnOn() async =>
      throw new Exception("you cannot execute stuff on devices");
  Future<void> turnOff() async =>
      throw new Exception("you cannot execute stuff on devices");
  dynamic toggle() =>
      throw new Exception("you cannot execute stuff on devices");
  void writeState(int state) =>
      throw new Exception("you cannot execute stuff on devices");
  Ontario ontario;
}

class _$OsramBulbImplementation extends OsramBulb {
  Host _host;
  Ontario _ontario;

  _$OsramBulbImplementation(OsramBulb delegate, Map<Symbol, Object> parameters)
      : super._() {
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
          name: #ontario,
          type: [
            "asset:blackbird/lib/devices/ontario.dart#Ontario",
            "asset:blackbird/lib/src/device.dart#Device",
            "dart:core#Object"
          ],
          device: this,
          module: delegate.ontario,
          isModule: true));
      info[#host].annotations.add(Runtime());
      throw info;
    }

    _host = parameters[#host];
    _ontario = parameters[#ontario];
  }

  Host get host => _host;

  OsramBulb implementation(Map<Symbol, Object> dependencies) =>
      throw Exception('this is already an implementation');
  @override
  Object invoke(Invocation invocation) =>
      _$OsramBulbInvoker.invoke(invocation, this);
  Provision provideRemote(Context context) =>
      _$OsramBulbRmi.provideRemote(context, this);
  OsramBulb getRemote(Context context, String uuid) =>
      _$OsramBulbRmi.getRemote(context, uuid);
  @override
  Map<String, dynamic> toJson() => _$OsramBulbToJson(this);

  get hooks => _$OsramBulbHooks;

  Ontario get ontario => _ontario;
  set ontario(Ontario _ontario) => throw new Exception(
      "cannot change module after implementation construction");
}

Map<String, dynamic> get _$OsramBulbHooks {
  return {
    "classURL": "asset:blackbird/lib/devices/osram_bulb.dart#OsramBulb",
    "remote": _$OsramBulbRmi.getRemote,
    "fromJson": _$OsramBulbFromJson
  };
}

// **************************************************************************
// DeviceJsonSerializableGenerator
// **************************************************************************

OsramBulb _$OsramBulbFromJson(Map<String, dynamic> json) {
  return OsramBulb();
}

Map<String, dynamic> _$OsramBulbToJson(OsramBulb instance) => <String, dynamic>{
      'json_serializable.className':
          "asset:blackbird/lib/devices/osram_bulb.dart#OsramBulb",
    };

// **************************************************************************
// InvokerGenerator
// **************************************************************************

class _$OsramBulbInvoker {
  static dynamic invoke(Invocation invocation, OsramBulb target) {
    if (invocation.isMethod && #turnOn == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.turnOn();
    }
    if (invocation.isMethod && #turnOff == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.turnOff();
    }
    if (invocation.isMethod && #== == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target == positionalArguments[0];
    }
    if (invocation.isMethod && #toggle == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.toggle();
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
    if (invocation.isGetter && #ontario == invocation.memberName) {
      return target.ontario;
    }
    if (invocation.isSetter && #ontario == invocation.memberName) {
      target.ontario = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isGetter && #hashCode == invocation.memberName) {
      return target.hashCode;
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
    if (invocation.isGetter && #runtimeType == invocation.memberName) {
      return target.runtimeType;
    }
    if (invocation.isGetter && #states == invocation.memberName) {
      return target.states;
    }
    if (invocation.isSetter && #binaryState == invocation.memberName) {
      target.binaryState = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isGetter && #state == invocation.memberName) {
      return target.state;
    }
    if (invocation.isSetter && #state == invocation.memberName) {
      target.state = invocation.positionalArguments[0];
      return null;
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

class _$OsramBulbProxy implements OsramBulb {
  Future<void> turnOn() async {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#turnOn, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return await _handle(_$invocation, metadata);
  }

  Future<void> turnOff() async {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#turnOff, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return await _handle(_$invocation, metadata);
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

  dynamic toggle() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#toggle, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  void writeState(int state) {
    List<Object> arguments = [];
    arguments.add(state);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#writeState, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    _handle(_$invocation, metadata);
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
  _$OsramBulbProxy(this._handle) : super();

  Ontario get ontario {
    Invocation invocation = Invocation.getter(#ontario);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  int get hashCode {
    Invocation invocation = Invocation.getter(#hashCode);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.elementMetadata.add(Ignore());
    metadata.elementMetadata.add(override);
    metadata.isStream = false;

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

  Type get runtimeType {
    Invocation invocation = Invocation.getter(#runtimeType);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  int get states {
    Invocation invocation = Invocation.getter(#states);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  set binaryState(bool binaryState) {
    Invocation invocation = Invocation.setter(#binaryState, binaryState);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    _handle(invocation, metadata);
  }

  int get state {
    Invocation invocation = Invocation.getter(#state);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }
}

// **************************************************************************
// RmiGenerator
// **************************************************************************

class _$OsramBulbRmi {
  static void _registerSerializers(Context context) {}
  static void _registerStubConstructors(Context context) {
    context.registerRemoteStubConstructor(
        'asset:blackbird/lib/devices/ontario.dart#Ontario', Ontario.getRemote);
    context.registerRemoteStubConstructor(
        'asset:blackbird/lib/devices/osram_bulb.dart#OsramBulb', getRemote);
  }

  static OsramBulb getRemote(Context context, String uuid) {
    _registerSerializers(context);
    _registerStubConstructors(context);
    RmiProxyHandler handler = RmiProxyHandler(context, uuid);
    return _$OsramBulbProxy(handler.handle);
  }

  static Provision provideRemote(Context context, OsramBulb target) {
    _registerSerializers(context);
    _registerStubConstructors(context);
    return rmiProvideRemote(context, target,
        'asset:blackbird/lib/devices/osram_bulb.dart#OsramBulb');
  }
}
