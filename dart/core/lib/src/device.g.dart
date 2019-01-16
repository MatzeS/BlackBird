// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// DeviceGenerator
// **************************************************************************

class _$HostDevice extends Host {
  _$HostDevice();

  Host get host =>
      throw new Exception('only implementation objects are hosted');

  Host implementation(Map<Symbol, Object> dependencies) =>
      _$HostImplementation(this, dependencies);
  @override
  Object invoke(Invocation invocation) =>
      throw new Exception('no invocation on devices');
  Provision provideRemote(Context context) =>
      throw new Exception('no RMI on devices');
  Host getRemote(Context context, String uuid) =>
      throw new Exception('no RMI on devices');
  @override
  Map<String, dynamic> toJson() => _$HostToJson(this);

  Blackbird get blackbird => throw new Exception(
      'cannot get runtime dependencys on device representation');
  Future<Device> getRemoteHandle(Device device) =>
      throw new Exception("you cannot execute stuff on devices");
  Future<void> something(String text) async =>
      throw new Exception("you cannot execute stuff on devices");
}

class _$HostImplementation extends Host {
  Blackbird _blackbird;
  Host _host;

  _$HostImplementation(Host delegate, Map<Symbol, Object> parameters) {
    if (parameters == null) {
      ConstructionInfoException info = new ConstructionInfoException();
      info.dependencies.add(new Dependency(
          name: #blackbird,
          type: [
            "asset:blackbird/lib/src/main.dart#Blackbird",
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
      info[#blackbird].annotations.add(Runtime());
      info[#host].annotations.add(Runtime());
      throw info;
    }

    _blackbird = parameters[#blackbird];
    _host = parameters[#host];
    _address = delegate.address;
    _port = delegate.port;
  }

  Host get host => _host;

  Host implementation(Map<Symbol, Object> dependencies) =>
      throw Exception('this is already an implementation');
  @override
  Object invoke(Invocation invocation) =>
      _$HostInvoker.invoke(invocation, this);
  Provision provideRemote(Context context) =>
      _$HostRmi.provideRemote(context, this);
  Host getRemote(Context context, String uuid) =>
      _$HostRmi.getRemote(context, uuid);
  @override
  Map<String, dynamic> toJson() => _$HostToJson(this);

  String get address => _address;
  set address(String _address) => throw new Exception(
      'cannot change device property after implementationconstruction');
  int get port => _port;
  set port(int _port) => throw new Exception(
      'cannot change device property after implementationconstruction');
  Blackbird get blackbird => _blackbird;

  String _address;

  int _port;
}

// **************************************************************************
// InvokerGenerator
// **************************************************************************

class _$DeviceInvoker {
  static dynamic invoke(Invocation invocation, Device target) {
    if (invocation.isGetter && #_blackbird == invocation.memberName) {
      return target._blackbird;
    }
    if (invocation.isSetter && #_blackbird == invocation.memberName) {
      target._blackbird = invocation.positionalArguments[0];
      return null;
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
    if (invocation.isGetter && #hashCode == invocation.memberName) {
      return target.hashCode;
    }
    if (invocation.isGetter && #runtimeType == invocation.memberName) {
      return target.runtimeType;
    }
    if (invocation.isMethod && #postImplementation == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.postImplementation();
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
  }
}

class _$HostInvoker {
  static dynamic invoke(Invocation invocation, Host target) {
    if (invocation.isGetter && #address == invocation.memberName) {
      return target.address;
    }
    if (invocation.isSetter && #address == invocation.memberName) {
      target.address = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isGetter && #port == invocation.memberName) {
      return target.port;
    }
    if (invocation.isSetter && #port == invocation.memberName) {
      target.port = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isGetter && #blackbird == invocation.memberName) {
      return target.blackbird;
    }
    if (invocation.isMethod && #getRemoteHandle == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.getRemoteHandle(
        positionalArguments[0],
      );
    }
    if (invocation.isMethod && #something == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.something(
        positionalArguments[0],
      );
    }
    if (invocation.isMethod && #toString == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.toString();
    }
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Host _$HostFromJson(Map<String, dynamic> json) {
  return Host.device()
    ..address = json['address'] as String
    ..port = json['port'] as int;
}

Map<String, dynamic> _$HostToJson(Host instance) => <String, dynamic>{
      'address': instance.address,
      'port': instance.port,
      'json_serializable.className': "asset:blackbird/lib/src/device.dart#Host",
    };

// **************************************************************************
// ProxyGenerator
// **************************************************************************

class _$DeviceProxy implements Device {
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
  _$DeviceProxy(this._handle) : super();

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

class _$HostProxy implements Host {
  Future<Device> getRemoteHandle(Device device) async {
    List<Object> arguments = [];
    arguments.add(device);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#getRemoteHandle, arguments, namedArguments);

    MetaFlags meta = new MetaFlags();

    return await _handle(_$invocation);
  }

  Future<void> something(String text) async {
    List<Object> arguments = [];
    arguments.add(text);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#something, arguments, namedArguments);

    MetaFlags meta = new MetaFlags();

    return await _handle(_$invocation);
  }

  String toString() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#toString, arguments, namedArguments);

    MetaFlags meta = new MetaFlags();

    return _handle(_$invocation);
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
  _$HostProxy(this._handle) : super();

  String get address {
    Invocation invocation = Invocation.getter(#address);

    return _handle(invocation);
  }

  int get port {
    Invocation invocation = Invocation.getter(#port);

    return _handle(invocation);
  }

  Blackbird get blackbird {
    Invocation invocation = Invocation.getter(#blackbird);

    return _handle(invocation);
  }

  Blackbird get _blackbird {
    Invocation invocation = Invocation.getter(#_blackbird);

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

class _$DeviceRmi {
  static void _registerSerializers(Context context) {}
  static void _registerStubConstructors(Context context) {
    context.registerRemoteStubConstructor(
        'asset:blackbird/lib/src/device.dart#Host', Host.getRemote);
    context.registerRemoteStubConstructor(
        'asset:blackbird/lib/src/device.dart#Device', getRemote);
  }

  static Device getRemote(Context context, String uuid) {
    _registerSerializers(context);
    _registerStubConstructors(context);
    RmiProxyHandler handler = RmiProxyHandler(context, uuid);
    return _$DeviceProxy(handler.handle);
  }

  static Provision provideRemote(Context context, Device target) {
    _registerSerializers(context);
    _registerStubConstructors(context);
    return rmiProvideRemote(
        context, target, 'asset:blackbird/lib/src/device.dart#Device');
  }
}

class _$HostRmi {
  static void _registerSerializers(Context context) {}
  static void _registerStubConstructors(Context context) {
    context.registerRemoteStubConstructor(
        'asset:blackbird/lib/src/device.dart#Device', Device.getRemote);
    context.registerRemoteStubConstructor(
        'asset:blackbird/lib/src/device.dart#Host', getRemote);
  }

  static Host getRemote(Context context, String uuid) {
    _registerSerializers(context);
    _registerStubConstructors(context);
    RmiProxyHandler handler = RmiProxyHandler(context, uuid);
    return _$HostProxy(handler.handle);
  }

  static Provision provideRemote(Context context, Host target) {
    _registerSerializers(context);
    _registerStubConstructors(context);
    return rmiProvideRemote(
        context, target, 'asset:blackbird/lib/src/device.dart#Host');
  }
}
