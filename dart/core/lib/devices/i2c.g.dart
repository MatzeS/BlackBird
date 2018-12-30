// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'i2c.dart';

// **************************************************************************
// DeviceGenerator
// **************************************************************************

class _$I2CSlaveDevice extends I2CSlave {
  _$I2CSlaveDevice();

  Host get host =>
      throw new Exception('only implementation objects are hosted');

  I2CSlave implementation(Map<Symbol, Object> dependencies) =>
      _$I2CSlaveImplementation(this, dependencies);
  @override
  Object invoke(Invocation invocation) =>
      throw new Exception('no invocation on devices');
  Provision provideRemote(Context context) =>
      throw new Exception('no RMI on devices');
  I2CSlave getRemote(Context context, String uuid) =>
      throw new Exception('no RMI on devices');
  @override
  Map<String, dynamic> serialize() => _$I2CSlaveToJson(this);
  static I2CSlave deserialize(Map json) => _$I2CSlaveFromJson(json);

  Future<void> writeRegister(int register, int value) =>
      blackbird.interfaceDevice<I2CSlave>(this).writeRegister(register, value);
  Future<int> readRegister(int register) =>
      blackbird.interfaceDevice<I2CSlave>(this).readRegister(register);
  Future<void> writeRegisters(int register, List values) => blackbird
      .interfaceDevice<I2CSlave>(this)
      .writeRegisters(register, values);
  Future<List<int>> readRegisters(int register, int length) =>
      blackbird.interfaceDevice<I2CSlave>(this).readRegisters(register, length);
  I2CMaster master;
}

class _$I2CSlaveImplementation extends I2CSlave {
  Host _host;
  I2CMaster _master;

  _$I2CSlaveImplementation(I2CSlave delegate, Map<Symbol, Object> parameters) {
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
          name: #master,
          type: [
            "asset:blackbird/lib/devices/i2c.dart#I2CMaster",
            "asset:blackbird/lib/src/device.dart#Device",
            "dart:core#Object"
          ],
          device: this,
          module: delegate.master,
          isModule: true));
      info[#host].annotations.add(Runtime());
      throw info;
    }

    _host = parameters[#host];
    _master = parameters[#master];
    _address = delegate.address;
  }

  Host get host => _host;

  I2CSlave implementation(Map<Symbol, Object> dependencies) =>
      throw Exception('this is already an implementation');
  @override
  Object invoke(Invocation invocation) =>
      _$I2CSlaveInvoker.invoke(invocation, this);
  Provision provideRemote(Context context) =>
      _$I2CSlaveRmi.provideRemote(context, this);
  I2CSlave getRemote(Context context, String uuid) =>
      _$I2CSlaveRmi.getRemote(context, uuid);
  @override
  Map<String, dynamic> serialize() => _$I2CSlaveToJson(this);

  I2CMaster get master => _master;
  set master(I2CMaster _master) => throw new Exception(
      "cannot change module after implementation construction");
  int get address => _address;
  set address(int _address) => throw new Exception(
      'cannot change device property after implementationconstruction');

  int _address;
}

abstract class _$I2CMasterDevice extends I2CMaster {
  _$I2CMasterDevice();

  Host get host =>
      throw new Exception('only implementation objects are hosted');

  I2CMaster implementation(Map<Symbol, Object> dependencies) =>
      throw new Exception("cannot implement abstract device");
  @override
  Object invoke(Invocation invocation) =>
      throw new Exception('no invocation on devices');
  Provision provideRemote(Context context) =>
      throw new Exception('no RMI on devices');
  I2CMaster getRemote(Context context, String uuid) =>
      throw new Exception('no RMI on devices');

  Future<void> writeRegister(int slave, int register, int value) => blackbird
      .interfaceDevice<I2CMaster>(this)
      .writeRegister(slave, register, value);
  Future<int> readRegister(int slave, int register) =>
      blackbird.interfaceDevice<I2CMaster>(this).readRegister(slave, register);
  Future<void> writeRegisters(int slave, int register, List values) => blackbird
      .interfaceDevice<I2CMaster>(this)
      .writeRegisters(slave, register, values);
  Future<List<int>> readRegisters(int slave, int register, int length) =>
      blackbird
          .interfaceDevice<I2CMaster>(this)
          .readRegisters(slave, register, length);
}

// **************************************************************************
// InvokerGenerator
// **************************************************************************

class _$I2CSlaveInvoker {
  static dynamic invoke(Invocation invocation, I2CSlave target) {
    if (invocation.isGetter && #master == invocation.memberName) {
      return target.master;
    }
    if (invocation.isSetter && #master == invocation.memberName) {
      target.master = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isGetter && #address == invocation.memberName) {
      return target.address;
    }
    if (invocation.isSetter && #address == invocation.memberName) {
      target.address = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isMethod && #writeRegister == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 2; i++)
        positionalArguments.add(null);

      return target.writeRegister(
        positionalArguments[0],
        positionalArguments[1],
      );
    }
    if (invocation.isMethod && #readRegister == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.readRegister(
        positionalArguments[0],
      );
    }
    if (invocation.isMethod && #writeRegisters == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 2; i++)
        positionalArguments.add(null);

      return target.writeRegisters(
        positionalArguments[0],
        positionalArguments[1],
      );
    }
    if (invocation.isMethod && #readRegisters == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 2; i++)
        positionalArguments.add(null);

      return target.readRegisters(
        positionalArguments[0],
        positionalArguments[1],
      );
    }
  }
}

class _$I2CMasterInvoker {
  static dynamic invoke(Invocation invocation, I2CMaster target) {
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

I2CSlave _$I2CSlaveFromJson(Map<String, dynamic> json) {
  return I2CSlave.device()..address = json['address'] as int;
}

Map<String, dynamic> _$I2CSlaveToJson(I2CSlave instance) =>
    <String, dynamic>{'address': instance.address};

// **************************************************************************
// ProxyGenerator
// **************************************************************************

class _$I2CSlaveProxy implements I2CSlave {
  Future<void> writeRegister(int register, int value) {
    List<Object> arguments = [];
    arguments.add(register);
    arguments.add(value);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#writeRegister, arguments, namedArguments);

    return _handle(_$invocation);
  }

  Future<int> readRegister(int register) {
    List<Object> arguments = [];
    arguments.add(register);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#readRegister, arguments, namedArguments);

    return _handle(_$invocation);
  }

  Future<void> writeRegisters(int register, List values) {
    List<Object> arguments = [];
    arguments.add(register);
    arguments.add(values);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#writeRegisters, arguments, namedArguments);

    return _handle(_$invocation);
  }

  Future<List<int>> readRegisters(int register, int length) {
    List<Object> arguments = [];
    arguments.add(register);
    arguments.add(length);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#readRegisters, arguments, namedArguments);

    return _handle(_$invocation);
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
  _$I2CSlaveProxy(this._handle) : super();

  I2CMaster get master {
    Invocation invocation = Invocation.getter(#master);

    return _handle(invocation);
  }

  int get address {
    Invocation invocation = Invocation.getter(#address);

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

class _$I2CMasterProxy implements I2CMaster {
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

  Future<int> readRegister(int slave, int register) {
    List<Object> arguments = [];
    arguments.add(slave);
    arguments.add(register);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#readRegister, arguments, namedArguments);

    return _handle(_$invocation);
  }

  Future<void> writeRegisters(int slave, int register, List values) {
    List<Object> arguments = [];
    arguments.add(slave);
    arguments.add(register);
    arguments.add(values);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#writeRegisters, arguments, namedArguments);

    return _handle(_$invocation);
  }

  Future<List<int>> readRegisters(int slave, int register, int length) {
    List<Object> arguments = [];
    arguments.add(slave);
    arguments.add(register);
    arguments.add(length);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#readRegisters, arguments, namedArguments);

    return _handle(_$invocation);
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
  _$I2CMasterProxy(this._handle) : super();

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

class _$I2CSlaveRmi {
  static bool _registered = false;
  static void _registerSerializers() {
    if (_registered) return;
    _registered = true;

    rmiRegisterSerializers([]);
  }

  static void _registerStubConstructors(Context context) {
    context.registerRemoteStubConstructor('I2CMaster', I2CMaster.getRemote);
    context.registerRemoteStubConstructor('I2CSlave', getRemote);
  }

  static I2CSlave getRemote(Context context, String uuid) {
    _registerSerializers();
    _registerStubConstructors(context);
    RmiProxyHandler handler = RmiProxyHandler(context, uuid);
    return _$I2CSlaveProxy(handler.handle);
  }

  static Provision provideRemote(Context context, I2CSlave target) {
    _registerSerializers();
    _registerStubConstructors(context);
    return rmiProvideRemote(context, target);
  }
}

class _$I2CMasterRmi {
  static bool _registered = false;
  static void _registerSerializers() {
    if (_registered) return;
    _registered = true;

    rmiRegisterSerializers([]);
  }

  static void _registerStubConstructors(Context context) {
    context.registerRemoteStubConstructor('I2CMaster', getRemote);
  }

  static I2CMaster getRemote(Context context, String uuid) {
    _registerSerializers();
    _registerStubConstructors(context);
    RmiProxyHandler handler = RmiProxyHandler(context, uuid);
    return _$I2CMasterProxy(handler.handle);
  }

  static Provision provideRemote(Context context, I2CMaster target) {
    _registerSerializers();
    _registerStubConstructors(context);
    return rmiProvideRemote(context, target);
  }
}
