// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mcp23017.dart';

// **************************************************************************
// DeviceGenerator
// **************************************************************************

class _$MCP23017Device extends MCP23017 {
  _$MCP23017Device() : super._();

  Host get host =>
      throw new Exception('only implementation objects are hosted');

  MCP23017 implementation(Map<Symbol, Object> dependencies) =>
      _$MCP23017Implementation(this, dependencies);
  @override
  Object invoke(Invocation invocation) =>
      throw new Exception('no invocation on devices');
  Provision provideRemote(Context context) =>
      throw new Exception('no RMI on devices');
  MCP23017 getRemote(Context context, String uuid) =>
      throw new Exception('no RMI on devices');
  get hooks => _$MCP23017Hooks;
  @override
  Map<String, dynamic> toJson() => _$MCP23017ToJson(this);

  dynamic turnOn() =>
      throw new Exception("you cannot execute stuff on devices");
  dynamic turnOff() =>
      throw new Exception("you cannot execute stuff on devices");
  Future<void> writePortBit(
          Port port, Register register, int bit, bool value) =>
      throw new Exception("you cannot execute stuff on devices");
  Future<void> writePortRegister(Port port, Register register, int value) =>
      throw new Exception("you cannot execute stuff on devices");
  Future<bool> readPortBit(Port port, Register register, int bit) =>
      throw new Exception("you cannot execute stuff on devices");
  Future<int> readPortRegister(Port port, Register register) =>
      throw new Exception("you cannot execute stuff on devices");

  Stream<void> get commonInterrupt =>
      throw new Exception("you cannot execute stuff on devices");
  Future<void> writeRegisters(int register, List values) =>
      throw new Exception("you cannot execute stuff on devices");
  Future<List<int>> readRegisters(int register, int length) =>
      throw new Exception("you cannot execute stuff on devices");
}

class _$MCP23017Implementation extends MCP23017 {
  Host _host;
  I2CMaster _master;
  int _address;

  _$MCP23017Implementation(MCP23017 delegate, Map<Symbol, Object> parameters)
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

  MCP23017 implementation(Map<Symbol, Object> dependencies) =>
      throw Exception('this($this) is already an implementation');
  @override
  Object invoke(Invocation invocation) =>
      _$MCP23017Invoker.invoke(invocation, this);
  Provision provideRemote(Context context) =>
      _$MCP23017Rmi.provideRemote(context, this);
  MCP23017 getRemote(Context context, String uuid) =>
      _$MCP23017Rmi.getRemote(context, uuid);
  @override
  Map<String, dynamic> toJson() => _$MCP23017ToJson(this);

  get hooks => _$MCP23017Hooks;

  I2CMaster get master => _master;
  set master(I2CMaster _master) => throw new Exception(
      "cannot change module after implementation construction");
  int get address => _address;
  set address(int _address) => throw new Exception(
      'cannot change device property after implementationconstruction');
}

Map<String, dynamic> get _$MCP23017Hooks {
  return {
    "classURL": "asset:blackbird/lib/devices/mcp23017.dart#MCP23017",
    "remote": _$MCP23017Rmi.getRemote,
    "fromJson": _$MCP23017FromJson
  };
}

// **************************************************************************
// DeviceJsonSerializableGenerator
// **************************************************************************

MCP23017 _$MCP23017FromJson(Map<String, dynamic> json) {
  return MCP23017()..address = json['address'] as int;
}

Map<String, dynamic> _$MCP23017ToJson(MCP23017 instance) => <String, dynamic>{
      'address': instance.address,
      'json_serializable.className':
          "asset:blackbird/lib/devices/mcp23017.dart#MCP23017",
    };

// **************************************************************************
// InvokerGenerator
// **************************************************************************

class _$MCP23017Invoker {
  static dynamic invoke(Invocation invocation, MCP23017 target) {
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
    if (invocation.isMethod && #writePortBit == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 4; i++)
        positionalArguments.add(null);

      return target.writePortBit(
        positionalArguments[0],
        positionalArguments[1],
        positionalArguments[2],
        positionalArguments[3],
      );
    }
    if (invocation.isMethod && #writePortRegister == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 3; i++)
        positionalArguments.add(null);

      return target.writePortRegister(
        positionalArguments[0],
        positionalArguments[1],
        positionalArguments[2],
      );
    }
    if (invocation.isMethod && #readPortBit == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 3; i++)
        positionalArguments.add(null);

      return target.readPortBit(
        positionalArguments[0],
        positionalArguments[1],
        positionalArguments[2],
      );
    }
    if (invocation.isMethod && #readPortRegister == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 2; i++)
        positionalArguments.add(null);

      return target.readPortRegister(
        positionalArguments[0],
        positionalArguments[1],
      );
    }
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
    if (invocation.isMethod && #readRegister == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.readRegister(
        positionalArguments[0],
      );
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
    if (invocation.isMethod && #readBit == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 2; i++)
        positionalArguments.add(null);

      return target.readBit(
        positionalArguments[0],
        positionalArguments[1],
      );
    }
    if (invocation.isMethod && #writeBit == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 3; i++)
        positionalArguments.add(null);

      return target.writeBit(
        positionalArguments[0],
        positionalArguments[1],
        positionalArguments[2],
      );
    }
    if (invocation.isMethod && #readBits == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 3; i++)
        positionalArguments.add(null);

      return target.readBits(
        positionalArguments[0],
        positionalArguments[1],
        positionalArguments[2],
      );
    }
    if (invocation.isMethod && #writeBits == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 4; i++)
        positionalArguments.add(null);

      return target.writeBits(
        positionalArguments[0],
        positionalArguments[1],
        positionalArguments[2],
        positionalArguments[3],
      );
    }
    if (invocation.isMethod && #readBitBlock == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.readBitBlock(
        positionalArguments[0],
      );
    }
    if (invocation.isMethod && #writeBitBlock == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 2; i++)
        positionalArguments.add(null);

      return target.writeBitBlock(
        positionalArguments[0],
        positionalArguments[1],
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

class _$MCP23017Proxy implements MCP23017 {
  dynamic turnOn() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#turnOn, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  dynamic turnOff() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#turnOff, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  Future<void> writePortBit(Port port, Register register, int bit, bool value) {
    List<Object> arguments = [];
    arguments.add(port);
    arguments.add(register);
    arguments.add(bit);
    arguments.add(value);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#writePortBit, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.positionalArgumentMetadata.add([]);
    metadata.positionalArgumentMetadata.add([]);
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  Future<void> writePortRegister(Port port, Register register, int value) {
    List<Object> arguments = [];
    arguments.add(port);
    arguments.add(register);
    arguments.add(value);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#writePortRegister, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.positionalArgumentMetadata.add([]);
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  Future<bool> readPortBit(Port port, Register register, int bit) {
    List<Object> arguments = [];
    arguments.add(port);
    arguments.add(register);
    arguments.add(bit);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#readPortBit, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.positionalArgumentMetadata.add([]);
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  Future<int> readPortRegister(Port port, Register register) {
    List<Object> arguments = [];
    arguments.add(port);
    arguments.add(register);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#readPortRegister, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  Future<void> writeRegisters(int register, List values) {
    List<Object> arguments = [];
    arguments.add(register);
    arguments.add(values);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#writeRegisters, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  Future<List<int>> readRegisters(int register, int length) {
    List<Object> arguments = [];
    arguments.add(register);
    arguments.add(length);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#readRegisters, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
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

  Future<int> readRegister(int register) {
    List<Object> arguments = [];
    arguments.add(register);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#readRegister, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  Future<void> writeRegister(int register, int value) {
    List<Object> arguments = [];
    arguments.add(register);
    arguments.add(value);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#writeRegister, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  Future<bool> readBit(int register, int bit) async {
    List<Object> arguments = [];
    arguments.add(register);
    arguments.add(bit);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#readBit, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return await _handle(_$invocation, metadata);
  }

  Future<int> writeBit(int register, int bit, bool value) async {
    List<Object> arguments = [];
    arguments.add(register);
    arguments.add(bit);
    arguments.add(value);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#writeBit, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.positionalArgumentMetadata.add([]);
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return await _handle(_$invocation, metadata);
  }

  Future<int> readBits(int register, int firstBit, int width) async {
    List<Object> arguments = [];
    arguments.add(register);
    arguments.add(firstBit);
    arguments.add(width);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#readBits, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.positionalArgumentMetadata.add([]);
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return await _handle(_$invocation, metadata);
  }

  Future<int> writeBits(
      int register, int firstBit, int width, int value) async {
    List<Object> arguments = [];
    arguments.add(register);
    arguments.add(firstBit);
    arguments.add(width);
    arguments.add(value);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#writeBits, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.positionalArgumentMetadata.add([]);
    metadata.positionalArgumentMetadata.add([]);
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return await _handle(_$invocation, metadata);
  }

  Future<int> readBitBlock(BitBlock bitBlock) {
    List<Object> arguments = [];
    arguments.add(bitBlock);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#readBitBlock, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  Future<void> writeBitBlock(BitBlock bitBlock, int value) {
    List<Object> arguments = [];
    arguments.add(bitBlock);
    arguments.add(value);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#writeBitBlock, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  InvocationHandlerFunction _handle;
  _$MCP23017Proxy(this._handle) : super();

  I2CMaster get master {
    Invocation invocation = Invocation.getter(#master);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  int get address {
    Invocation invocation = Invocation.getter(#address);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

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

class _$MCP23017Rmi {
  static void _registerSerializers(Context context) {}
  static void _registerStubConstructors(Context context) {
    context.registerRemoteStubConstructor(
        'asset:blackbird/lib/devices/mcp23017.dart#MCP23017', getRemote);
  }

  static MCP23017 getRemote(Context context, String uuid) {
    _registerSerializers(context);
    _registerStubConstructors(context);
    RmiProxyHandler handler = RmiProxyHandler(context, uuid);
    return _$MCP23017Proxy(handler.handle);
  }

  static Provision provideRemote(Context context, MCP23017 target) {
    _registerSerializers(context);
    _registerStubConstructors(context);
    return rmiProvideRemote(
        context, target, 'asset:blackbird/lib/devices/mcp23017.dart#MCP23017');
  }
}
