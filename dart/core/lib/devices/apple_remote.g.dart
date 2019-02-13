// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apple_remote.dart';

// **************************************************************************
// DeviceGenerator
// **************************************************************************

class _$AppleRemoteDevice extends AppleRemote {
  _$AppleRemoteDevice() : super._();

  Host get host =>
      throw new Exception('only implementation objects are hosted');

  AppleRemote implementation(Map<Symbol, Object> dependencies) =>
      _$AppleRemoteImplementation(this, dependencies);
  @override
  Object invoke(Invocation invocation) =>
      throw new Exception('no invocation on devices');
  Provision provideRemote(Context context) =>
      throw new Exception('no RMI on devices');
  AppleRemote getRemote(Context context, String uuid) =>
      throw new Exception('no RMI on devices');
  get hooks => _$AppleRemoteHooks;
  @override
  Map<String, dynamic> toJson() => _$AppleRemoteToJson(this);

  Stream<int> get keyCode =>
      throw new Exception("you cannot execute stuff on devices");
  Stream<void> get up =>
      throw new Exception("you cannot execute stuff on devices");
  Stream<void> get down =>
      throw new Exception("you cannot execute stuff on devices");
  Stream<void> get right =>
      throw new Exception("you cannot execute stuff on devices");
  Stream<void> get left =>
      throw new Exception("you cannot execute stuff on devices");
  Stream<void> get play =>
      throw new Exception("you cannot execute stuff on devices");
  Stream<void> get menu =>
      throw new Exception("you cannot execute stuff on devices");
  Stream<void> get center =>
      throw new Exception("you cannot execute stuff on devices");

  IRReceiver receiver;
}

class _$AppleRemoteImplementation extends AppleRemote {
  Host _host;
  IRReceiver _receiver;
  int _address;

  _$AppleRemoteImplementation(
      AppleRemote delegate, Map<Symbol, Object> parameters)
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
          name: #receiver,
          type: [
            "asset:blackbird/lib/devices/ir_receiver.dart#IRReceiver",
            "asset:blackbird/lib/src/device.dart#Device",
            "dart:core#Object"
          ],
          device: this,
          module: delegate.receiver,
          isModule: true));
      info[#host].annotations.add(Runtime());
      throw info;
    }

    _host = parameters[#host];
    _receiver = parameters[#receiver];
    _address = delegate.address;
  }

  Host get host => _host;

  AppleRemote implementation(Map<Symbol, Object> dependencies) =>
      throw Exception('this is already an implementation');
  @override
  Object invoke(Invocation invocation) =>
      _$AppleRemoteInvoker.invoke(invocation, this);
  Provision provideRemote(Context context) =>
      _$AppleRemoteRmi.provideRemote(context, this);
  AppleRemote getRemote(Context context, String uuid) =>
      _$AppleRemoteRmi.getRemote(context, uuid);
  @override
  Map<String, dynamic> toJson() => _$AppleRemoteToJson(this);

  get hooks => _$AppleRemoteHooks;

  int get address => _address;
  set address(int _address) => throw new Exception(
      'cannot change device property after implementationconstruction');
  IRReceiver get receiver => _receiver;
  set receiver(IRReceiver _receiver) => throw new Exception(
      "cannot change module after implementation construction");
}

Map<String, dynamic> get _$AppleRemoteHooks {
  return {
    "classURL": "asset:blackbird/lib/devices/apple_remote.dart#AppleRemote",
    "remote": _$AppleRemoteRmi.getRemote,
    "fromJson": _$AppleRemoteFromJson
  };
}

// **************************************************************************
// DeviceJsonSerializableGenerator
// **************************************************************************

AppleRemote _$AppleRemoteFromJson(Map<String, dynamic> json) {
  return AppleRemote()..address = json['address'] as int;
}

Map<String, dynamic> _$AppleRemoteToJson(AppleRemote instance) =>
    <String, dynamic>{
      'address': instance.address,
      'json_serializable.className':
          "asset:blackbird/lib/devices/apple_remote.dart#AppleRemote",
    };

// **************************************************************************
// InvokerGenerator
// **************************************************************************

class _$AppleRemoteInvoker {
  static dynamic invoke(Invocation invocation, AppleRemote target) {
    if (invocation.isGetter && #address == invocation.memberName) {
      return target.address;
    }
    if (invocation.isSetter && #address == invocation.memberName) {
      target.address = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isGetter && #receiver == invocation.memberName) {
      return target.receiver;
    }
    if (invocation.isSetter && #receiver == invocation.memberName) {
      target.receiver = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isGetter && #keyCode == invocation.memberName) {
      return target.keyCode;
    }
    if (invocation.isGetter && #up == invocation.memberName) {
      return target.up;
    }
    if (invocation.isGetter && #down == invocation.memberName) {
      return target.down;
    }
    if (invocation.isGetter && #right == invocation.memberName) {
      return target.right;
    }
    if (invocation.isGetter && #left == invocation.memberName) {
      return target.left;
    }
    if (invocation.isGetter && #play == invocation.memberName) {
      return target.play;
    }
    if (invocation.isGetter && #menu == invocation.memberName) {
      return target.menu;
    }
    if (invocation.isGetter && #center == invocation.memberName) {
      return target.center;
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

class _$AppleRemoteProxy implements AppleRemote {
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
  _$AppleRemoteProxy(this._handle) : super();

  int get address {
    Invocation invocation = Invocation.getter(#address);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  IRReceiver get receiver {
    Invocation invocation = Invocation.getter(#receiver);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  Stream<int> get keyCode {
    Invocation invocation = Invocation.getter(#keyCode);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = true;

    return _handle(invocation, metadata);
  }

  Stream<void> get up {
    Invocation invocation = Invocation.getter(#up);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = true;

    return _handle(invocation, metadata);
  }

  Stream<void> get down {
    Invocation invocation = Invocation.getter(#down);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = true;

    return _handle(invocation, metadata);
  }

  Stream<void> get right {
    Invocation invocation = Invocation.getter(#right);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = true;

    return _handle(invocation, metadata);
  }

  Stream<void> get left {
    Invocation invocation = Invocation.getter(#left);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = true;

    return _handle(invocation, metadata);
  }

  Stream<void> get play {
    Invocation invocation = Invocation.getter(#play);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = true;

    return _handle(invocation, metadata);
  }

  Stream<void> get menu {
    Invocation invocation = Invocation.getter(#menu);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = true;

    return _handle(invocation, metadata);
  }

  Stream<void> get center {
    Invocation invocation = Invocation.getter(#center);

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

class _$AppleRemoteRmi {
  static void _registerSerializers(Context context) {}
  static void _registerStubConstructors(Context context) {
    context.registerRemoteStubConstructor(
        'asset:blackbird/lib/devices/ir_receiver.dart#IRReceiver',
        IRReceiver.getRemote);
    context.registerRemoteStubConstructor(
        'asset:blackbird/lib/devices/apple_remote.dart#AppleRemote', getRemote);
  }

  static AppleRemote getRemote(Context context, String uuid) {
    _registerSerializers(context);
    _registerStubConstructors(context);
    RmiProxyHandler handler = RmiProxyHandler(context, uuid);
    return _$AppleRemoteProxy(handler.handle);
  }

  static Provision provideRemote(Context context, AppleRemote target) {
    _registerSerializers(context);
    _registerStubConstructors(context);
    return rmiProvideRemote(context, target,
        'asset:blackbird/lib/devices/apple_remote.dart#AppleRemote');
  }
}
