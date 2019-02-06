// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mpr121.dart';

// **************************************************************************
// DeviceGenerator
// **************************************************************************

class _$MPR121Device extends MPR121 {
  _$MPR121Device() : super._();

  Host get host =>
      throw new Exception('only implementation objects are hosted');

  MPR121 implementation(Map<Symbol, Object> dependencies) =>
      _$MPR121Implementation(this, dependencies);
  @override
  Object invoke(Invocation invocation) =>
      throw new Exception('no invocation on devices');
  Provision provideRemote(Context context) =>
      throw new Exception('no RMI on devices');
  MPR121 getRemote(Context context, String uuid) =>
      throw new Exception('no RMI on devices');
  get hooks => _$MPR121Hooks;
  @override
  Map<String, dynamic> toJson() => _$MPR121ToJson(this);

  dynamic get touchDebounce =>
      throw new Exception("you cannot execute stuff on devices");
  dynamic get releaseDebounce =>
      throw new Exception("you cannot execute stuff on devices");
  dynamic get firstFilterIterations =>
      throw new Exception("you cannot execute stuff on devices");
  dynamic get chargeDischargeCurrent =>
      throw new Exception("you cannot execute stuff on devices");
  dynamic get chargeDischargeTime =>
      throw new Exception("you cannot execute stuff on devices");
  dynamic get secondFilterIterations =>
      throw new Exception("you cannot execute stuff on devices");
  dynamic get electrodeSampleInterval =>
      throw new Exception("you cannot execute stuff on devices");
  dynamic get calibrationLock =>
      throw new Exception("you cannot execute stuff on devices");
  dynamic get proximityEnable =>
      throw new Exception("you cannot execute stuff on devices");
  dynamic get electrodeEnable =>
      throw new Exception("you cannot execute stuff on devices");
  dynamic get autoConfigurationFailFlag async =>
      throw new Exception("you cannot execute stuff on devices");
  dynamic get autoReconfigurationFailflag async =>
      throw new Exception("you cannot execute stuff on devices");
  dynamic get touchStatus async =>
      throw new Exception("you cannot execute stuff on devices");
  Stream<TouchEvent> get touchEvent =>
      throw new Exception("you cannot execute stuff on devices");
  Future<void> stopModeOperation(operation) async =>
      throw new Exception("you cannot execute stuff on devices");
  Future<int> read16Bit(int register) async =>
      throw new Exception("you cannot execute stuff on devices");
  Future<void> write16Bit(int register, int value) async =>
      throw new Exception("you cannot execute stuff on devices");
  Future<int> readOffsetRegister(int baseRegister, int registerSkip, int offset,
          int registerWidth) async =>
      throw new Exception("you cannot execute stuff on devices");
  Future<void> writeOffsetRegister(int baseRegister, int registerSkip,
          int offset, int registerWidth, int value) async =>
      throw new Exception("you cannot execute stuff on devices");
  Future<int> readBitBlock(BitBlock bitBlock) =>
      throw new Exception("you cannot execute stuff on devices");
  Future<void> writeBitBlock(BitBlock bitBlock, int value) =>
      throw new Exception("you cannot execute stuff on devices");
  dynamic setTouchDebounce(int value) =>
      throw new Exception("you cannot execute stuff on devices");
  dynamic setReleaseDebounce(int value) =>
      throw new Exception("you cannot execute stuff on devices");
  dynamic setFirstFilterIterations(int value) =>
      throw new Exception("you cannot execute stuff on devices");
  dynamic setChargeDischargeCurrent(int value) =>
      throw new Exception("you cannot execute stuff on devices");
  dynamic setChargeDischargeTime(int value) =>
      throw new Exception("you cannot execute stuff on devices");
  dynamic setSecondFilterIterations(int value) =>
      throw new Exception("you cannot execute stuff on devices");
  dynamic setElectrodeSampleInterval(int value) =>
      throw new Exception("you cannot execute stuff on devices");
  dynamic setCalibrationLock(int value) =>
      throw new Exception("you cannot execute stuff on devices");
  dynamic setProximityEnable(int value) =>
      throw new Exception("you cannot execute stuff on devices");
  dynamic setElectrodeEnable(int value) =>
      throw new Exception("you cannot execute stuff on devices");
  Future<void> softReset() =>
      throw new Exception("you cannot execute stuff on devices");

  Stream<void> get commonInterrupt =>
      throw new Exception("you cannot execute stuff on devices");
  Future<void> writeBit(int register, int bit, bool value) async =>
      throw new Exception("you cannot execute stuff on devices");
  Future<bool> readBit(int register, int bit) async =>
      throw new Exception("you cannot execute stuff on devices");
  Future<int> readBits(int register, int lsb, int numBits) async =>
      throw new Exception("you cannot execute stuff on devices");
  Future<void> writeBits(int register, int lsb, int numBits, int value) async =>
      throw new Exception("you cannot execute stuff on devices");
  Future<void> writeRegister(int register, int value) =>
      throw new Exception("you cannot execute stuff on devices");
  Future<int> readRegister(int register) =>
      throw new Exception("you cannot execute stuff on devices");
  Future<void> writeRegisters(int register, List values) =>
      throw new Exception("you cannot execute stuff on devices");
  Future<List<int>> readRegisters(int register, int length) =>
      throw new Exception("you cannot execute stuff on devices");
}

class _$MPR121Implementation extends MPR121 {
  Host _host;
  I2CMaster _master;
  int _address;

  _$MPR121Implementation(MPR121 delegate, Map<Symbol, Object> parameters)
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

  MPR121 implementation(Map<Symbol, Object> dependencies) =>
      throw Exception('this is already an implementation');
  @override
  Object invoke(Invocation invocation) =>
      _$MPR121Invoker.invoke(invocation, this);
  Provision provideRemote(Context context) =>
      _$MPR121Rmi.provideRemote(context, this);
  MPR121 getRemote(Context context, String uuid) =>
      _$MPR121Rmi.getRemote(context, uuid);
  @override
  Map<String, dynamic> toJson() => _$MPR121ToJson(this);

  get hooks => _$MPR121Hooks;

  I2CMaster get master => _master;
  set master(I2CMaster _master) => throw new Exception(
      "cannot change module after implementation construction");
  int get address => _address;
  set address(int _address) => throw new Exception(
      'cannot change device property after implementationconstruction');
}

Map<String, dynamic> get _$MPR121Hooks {
  return {
    "classURL": "asset:blackbird/lib/devices/mpr121.dart#MPR121",
    "remote": _$MPR121Rmi.getRemote,
    "fromJson": _$MPR121FromJson
  };
}

// **************************************************************************
// DeviceJsonSerializableGenerator
// **************************************************************************

MPR121 _$MPR121FromJson(Map<String, dynamic> json) {
  return MPR121()..address = json['address'] as int;
}

Map<String, dynamic> _$MPR121ToJson(MPR121 instance) => <String, dynamic>{
      'address': instance.address,
      'json_serializable.className':
          "asset:blackbird/lib/devices/mpr121.dart#MPR121",
    };

// **************************************************************************
// InvokerGenerator
// **************************************************************************

class _$MPR121Invoker {
  static dynamic invoke(Invocation invocation, MPR121 target) {
    if (invocation.isMethod && #stopModeOperation == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.stopModeOperation(
        positionalArguments[0],
      );
    }
    if (invocation.isMethod && #read16Bit == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.read16Bit(
        positionalArguments[0],
      );
    }
    if (invocation.isMethod && #write16Bit == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 2; i++)
        positionalArguments.add(null);

      return target.write16Bit(
        positionalArguments[0],
        positionalArguments[1],
      );
    }
    if (invocation.isMethod && #readOffsetRegister == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 4; i++)
        positionalArguments.add(null);

      return target.readOffsetRegister(
        positionalArguments[0],
        positionalArguments[1],
        positionalArguments[2],
        positionalArguments[3],
      );
    }
    if (invocation.isMethod && #writeOffsetRegister == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 5; i++)
        positionalArguments.add(null);

      return target.writeOffsetRegister(
        positionalArguments[0],
        positionalArguments[1],
        positionalArguments[2],
        positionalArguments[3],
        positionalArguments[4],
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
    if (invocation.isMethod && #setTouchDebounce == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.setTouchDebounce(
        positionalArguments[0],
      );
    }
    if (invocation.isMethod && #setReleaseDebounce == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.setReleaseDebounce(
        positionalArguments[0],
      );
    }
    if (invocation.isMethod &&
        #setFirstFilterIterations == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.setFirstFilterIterations(
        positionalArguments[0],
      );
    }
    if (invocation.isMethod &&
        #setChargeDischargeCurrent == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.setChargeDischargeCurrent(
        positionalArguments[0],
      );
    }
    if (invocation.isMethod &&
        #setChargeDischargeTime == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.setChargeDischargeTime(
        positionalArguments[0],
      );
    }
    if (invocation.isMethod &&
        #setSecondFilterIterations == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.setSecondFilterIterations(
        positionalArguments[0],
      );
    }
    if (invocation.isMethod &&
        #setElectrodeSampleInterval == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.setElectrodeSampleInterval(
        positionalArguments[0],
      );
    }
    if (invocation.isMethod && #setCalibrationLock == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.setCalibrationLock(
        positionalArguments[0],
      );
    }
    if (invocation.isMethod && #setProximityEnable == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.setProximityEnable(
        positionalArguments[0],
      );
    }
    if (invocation.isMethod && #setElectrodeEnable == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.setElectrodeEnable(
        positionalArguments[0],
      );
    }
    if (invocation.isMethod && #softReset == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.softReset();
    }
    if (invocation.isMethod && #electorde == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.electorde(
        positionalArguments[0],
      );
    }
    if (invocation.isGetter && #touchDebounce == invocation.memberName) {
      return target.touchDebounce;
    }
    if (invocation.isGetter && #releaseDebounce == invocation.memberName) {
      return target.releaseDebounce;
    }
    if (invocation.isGetter &&
        #firstFilterIterations == invocation.memberName) {
      return target.firstFilterIterations;
    }
    if (invocation.isGetter &&
        #chargeDischargeCurrent == invocation.memberName) {
      return target.chargeDischargeCurrent;
    }
    if (invocation.isGetter && #chargeDischargeTime == invocation.memberName) {
      return target.chargeDischargeTime;
    }
    if (invocation.isGetter &&
        #secondFilterIterations == invocation.memberName) {
      return target.secondFilterIterations;
    }
    if (invocation.isGetter &&
        #electrodeSampleInterval == invocation.memberName) {
      return target.electrodeSampleInterval;
    }
    if (invocation.isGetter && #calibrationLock == invocation.memberName) {
      return target.calibrationLock;
    }
    if (invocation.isGetter && #proximityEnable == invocation.memberName) {
      return target.proximityEnable;
    }
    if (invocation.isGetter && #electrodeEnable == invocation.memberName) {
      return target.electrodeEnable;
    }
    if (invocation.isGetter &&
        #autoConfigurationFailFlag == invocation.memberName) {
      return target.autoConfigurationFailFlag;
    }
    if (invocation.isGetter &&
        #autoReconfigurationFailflag == invocation.memberName) {
      return target.autoReconfigurationFailflag;
    }
    if (invocation.isGetter && #touchStatus == invocation.memberName) {
      return target.touchStatus;
    }
    if (invocation.isGetter && #touchEvent == invocation.memberName) {
      return target.touchEvent;
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

class _$MPR121Proxy implements MPR121 {
  Future<void> stopModeOperation(operation) async {
    List<Object> arguments = [];
    arguments.add(operation);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#stopModeOperation, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return await _handle(_$invocation, metadata);
  }

  Future<int> read16Bit(int register) async {
    List<Object> arguments = [];
    arguments.add(register);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#read16Bit, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return await _handle(_$invocation, metadata);
  }

  Future<void> write16Bit(int register, int value) async {
    List<Object> arguments = [];
    arguments.add(register);
    arguments.add(value);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#write16Bit, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return await _handle(_$invocation, metadata);
  }

  Future<int> readOffsetRegister(
      int baseRegister, int registerSkip, int offset, int registerWidth) async {
    List<Object> arguments = [];
    arguments.add(baseRegister);
    arguments.add(registerSkip);
    arguments.add(offset);
    arguments.add(registerWidth);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#readOffsetRegister, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.positionalArgumentMetadata.add([]);
    metadata.positionalArgumentMetadata.add([]);
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return await _handle(_$invocation, metadata);
  }

  Future<void> writeOffsetRegister(int baseRegister, int registerSkip,
      int offset, int registerWidth, int value) async {
    List<Object> arguments = [];
    arguments.add(baseRegister);
    arguments.add(registerSkip);
    arguments.add(offset);
    arguments.add(registerWidth);
    arguments.add(value);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#writeOffsetRegister, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
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

  dynamic setTouchDebounce(int value) {
    List<Object> arguments = [];
    arguments.add(value);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#setTouchDebounce, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  dynamic setReleaseDebounce(int value) {
    List<Object> arguments = [];
    arguments.add(value);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#setReleaseDebounce, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  dynamic setFirstFilterIterations(int value) {
    List<Object> arguments = [];
    arguments.add(value);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#setFirstFilterIterations, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  dynamic setChargeDischargeCurrent(int value) {
    List<Object> arguments = [];
    arguments.add(value);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation = Invocation.method(
        #setChargeDischargeCurrent, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  dynamic setChargeDischargeTime(int value) {
    List<Object> arguments = [];
    arguments.add(value);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#setChargeDischargeTime, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  dynamic setSecondFilterIterations(int value) {
    List<Object> arguments = [];
    arguments.add(value);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation = Invocation.method(
        #setSecondFilterIterations, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  dynamic setElectrodeSampleInterval(int value) {
    List<Object> arguments = [];
    arguments.add(value);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation = Invocation.method(
        #setElectrodeSampleInterval, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  dynamic setCalibrationLock(int value) {
    List<Object> arguments = [];
    arguments.add(value);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#setCalibrationLock, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  dynamic setProximityEnable(int value) {
    List<Object> arguments = [];
    arguments.add(value);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#setProximityEnable, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  dynamic setElectrodeEnable(int value) {
    List<Object> arguments = [];
    arguments.add(value);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#setElectrodeEnable, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  Future<void> softReset() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#softReset, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  Electrode electorde(int index) {
    List<Object> arguments = [];
    arguments.add(index);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#electorde, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  Future<void> writeBit(int register, int bit, bool value) async {
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

  Future<int> readBits(int register, int lsb, int numBits) async {
    List<Object> arguments = [];
    arguments.add(register);
    arguments.add(lsb);
    arguments.add(numBits);
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

  Future<void> writeBits(int register, int lsb, int numBits, int value) async {
    List<Object> arguments = [];
    arguments.add(register);
    arguments.add(lsb);
    arguments.add(numBits);
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

  InvocationHandlerFunction _handle;
  _$MPR121Proxy(this._handle) : super();

  dynamic get touchDebounce {
    Invocation invocation = Invocation.getter(#touchDebounce);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  dynamic get releaseDebounce {
    Invocation invocation = Invocation.getter(#releaseDebounce);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  dynamic get firstFilterIterations {
    Invocation invocation = Invocation.getter(#firstFilterIterations);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  dynamic get chargeDischargeCurrent {
    Invocation invocation = Invocation.getter(#chargeDischargeCurrent);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  dynamic get chargeDischargeTime {
    Invocation invocation = Invocation.getter(#chargeDischargeTime);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  dynamic get secondFilterIterations {
    Invocation invocation = Invocation.getter(#secondFilterIterations);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  dynamic get electrodeSampleInterval {
    Invocation invocation = Invocation.getter(#electrodeSampleInterval);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  dynamic get calibrationLock {
    Invocation invocation = Invocation.getter(#calibrationLock);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  dynamic get proximityEnable {
    Invocation invocation = Invocation.getter(#proximityEnable);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  dynamic get electrodeEnable {
    Invocation invocation = Invocation.getter(#electrodeEnable);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  dynamic get autoConfigurationFailFlag async {
    Invocation invocation = Invocation.getter(#autoConfigurationFailFlag);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return await _handle(invocation, metadata);
  }

  dynamic get autoReconfigurationFailflag async {
    Invocation invocation = Invocation.getter(#autoReconfigurationFailflag);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return await _handle(invocation, metadata);
  }

  dynamic get touchStatus async {
    Invocation invocation = Invocation.getter(#touchStatus);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return await _handle(invocation, metadata);
  }

  Stream<TouchEvent> get touchEvent {
    Invocation invocation = Invocation.getter(#touchEvent);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = true;

    return _handle(invocation, metadata);
  }

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

class _$MPR121Rmi {
  static void _registerSerializers(Context context) {}
  static void _registerStubConstructors(Context context) {
    context.registerRemoteStubConstructor(
        'asset:blackbird/lib/devices/mpr121.dart#MPR121', getRemote);
  }

  static MPR121 getRemote(Context context, String uuid) {
    _registerSerializers(context);
    _registerStubConstructors(context);
    RmiProxyHandler handler = RmiProxyHandler(context, uuid);
    return _$MPR121Proxy(handler.handle);
  }

  static Provision provideRemote(Context context, MPR121 target) {
    _registerSerializers(context);
    _registerStubConstructors(context);
    return rmiProvideRemote(
        context, target, 'asset:blackbird/lib/devices/mpr121.dart#MPR121');
  }
}
