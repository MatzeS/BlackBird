// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_handle_test.dart';

// **************************************************************************
// DeviceGenerator
// **************************************************************************

class _$ADeviceDevice extends ADevice {
  _$ADeviceDevice();

  Host get host =>
      throw new Exception('only implementation objects are hosted');

  ADevice implementation(Map<Symbol, Object> dependencies) =>
      _$ADeviceImplementation(this, dependencies);
  @override
  Object invoke(Invocation invocation) =>
      throw new Exception('no invocation on devices');
  Provision provideRemote(Context context) =>
      throw new Exception('no RMI on devices');
  ADevice getRemote(Context context, String uuid) =>
      throw new Exception('no RMI on devices');
  @override
  Map<String, dynamic> toJson() => _$ADeviceToJson(this);

  void executive() =>
      throw new Exception("you cannot execute stuff on devices");
}

class _$ADeviceImplementation extends ADevice {
  Host _host;

  _$ADeviceImplementation(ADevice delegate, Map<Symbol, Object> parameters) {
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
      info[#host].annotations.add(Runtime());
      throw info;
    }

    _host = parameters[#host];
  }

  Host get host => _host;

  ADevice implementation(Map<Symbol, Object> dependencies) =>
      throw Exception('this is already an implementation');
  @override
  Object invoke(Invocation invocation) =>
      _$ADeviceInvoker.invoke(invocation, this);
  Provision provideRemote(Context context) =>
      _$ADeviceRmi.provideRemote(context, this);
  ADevice getRemote(Context context, String uuid) =>
      _$ADeviceRmi.getRemote(context, uuid);
  @override
  Map<String, dynamic> toJson() => _$ADeviceToJson(this);
}

// **************************************************************************
// InvokerGenerator
// **************************************************************************

class _$ADeviceInvoker {
  static dynamic invoke(Invocation invocation, ADevice target) {
    if (invocation.isMethod && #executive == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.executive();
    }
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ADevice _$ADeviceFromJson(Map<String, dynamic> json) {
  return ADevice.device();
}

Map<String, dynamic> _$ADeviceToJson(ADevice instance) => <String, dynamic>{
      'json_serializable.className':
          "asset:blackbird/test/remote_handle/remote_handle_test.dart#ADevice",
    };

// **************************************************************************
// ProxyGenerator
// **************************************************************************

class _$ADeviceProxy implements ADevice {
  void executive() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#executive, arguments, namedArguments);

    _handle(_$invocation);
  }

  void postImplementation() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#postImplementation, arguments, namedArguments);

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

  Map<String, dynamic> toJson() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#toJson, arguments, namedArguments);

    return _handle(_$invocation);
  }

  bool operator ==(Object other) {
    List<Object> arguments = [];
    arguments.add(other);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation = Invocation.method(#==, arguments, namedArguments);

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
  _$ADeviceProxy(this._handle) : super();

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

class _$ADeviceRmi {
  static void _registerSerializers(Context context) {}
  static void _registerStubConstructors(Context context) {
    context.registerRemoteStubConstructor(
        'asset:blackbird/test/remote_handle/remote_handle_test.dart#ADevice',
        getRemote);
  }

  static ADevice getRemote(Context context, String uuid) {
    _registerSerializers(context);
    _registerStubConstructors(context);
    RmiProxyHandler handler = RmiProxyHandler(context, uuid);
    return _$ADeviceProxy(handler.handle);
  }

  static Provision provideRemote(Context context, ADevice target) {
    _registerSerializers(context);
    _registerStubConstructors(context);
    return rmiProvideRemote(context, target,
        'asset:blackbird/test/remote_handle/remote_handle_test.dart#ADevice');
  }
}
