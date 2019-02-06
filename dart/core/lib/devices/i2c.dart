import 'package:blackbird/blackbird.dart';

part 'i2c.g.dart';

abstract class I2CSlave extends Device {
  I2CSlave._(); //TODO remove
  I2CSlave.extender();
  factory I2CSlave() => _$I2CSlaveDevice();
  static I2CSlave getRemote(Context context, String uuid) =>
      _$I2CSlaveRmi.getRemote(context, uuid);
  factory I2CSlave.fromJson(Map<String, dynamic> json) =>
      _$I2CSlaveFromJson(json);

  I2CMaster master;
  int address;

  // TODO
  Future<void> writeBit(int register, int bit, bool value) async {
    while (bit > 7) {
      register++;
      bit = -8;
    }

    int registerValue = await readRegister(register);

    if (value)
      registerValue |= (1 << bit);
    else
      registerValue &= ~(1 << bit);

    await writeRegister(register, registerValue);
  }

  // TODO
  Future<bool> readBit(int register, int bit) async {
    while (bit > 7) {
      register++;
      bit = -8;
    }

    int registerValue = await readRegister(register);
    return (registerValue & (1 << bit)) > 0;
  }

  Future<int> readBits(int register, int lsb, int numBits) async {
    int value = await readRegister(register);
    value = value >> lsb;
    int mask = 0;
    for (int i = 0; i < numBits; i++) {
      mask <<= 1;
      mask |= 1;
    }
    mask <<= lsb;
    return value & mask;
  }

  Future<void> writeBits(int register, int lsb, int numBits, int value) async {
    int oldValue = await readRegister(register);
    int mask = 0;
    for (int i = 0; i < numBits; i++) {
      mask <<= 1;
      mask |= 1;
    }
    mask <<= lsb;
    value = value << lsb;

    int newValue = oldValue & ~mask;
    newValue = newValue | value;
    await writeRegister(register, newValue);
  }

  Future<void> writeRegister(int register, int value) =>
      master.writeRegister(address, register, value);
  Future<int> readRegister(int register) =>
      master.readRegister(address, register);
  Future<void> writeRegisters(int register, List<int> values) =>
      master.writeRegisters(address, register, values);
  Future<List<int>> readRegisters(int register, int length) =>
      master.readRegisters(address, register, length);
  Stream<void> get commonInterrupt => master.commonInterrupt;
}

abstract class I2CMaster extends Device {
  I2CMaster._();
  static I2CMaster getRemote(Context context, String uuid) =>
      _$I2CMasterRmi.getRemote(context, uuid);

  Future<void> writeRegister(int slave, int register, int value);
  Future<int> readRegister(int slave, int register);
  Future<void> writeRegisters(int slave, int register, List<int> values);
  Future<List<int>> readRegisters(int slave, int register, int length);
  Stream<void> get commonInterrupt;
}
