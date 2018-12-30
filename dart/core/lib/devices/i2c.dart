import 'package:blackbird/blackbird.dart';

part 'i2c.g.dart';

abstract class I2CSlave extends Device {
  I2CSlave();
  factory I2CSlave.device() => _$I2CSlaveDevice();
  static I2CSlave getRemote(Context context, String uuid) =>
      _$I2CSlaveRmi.getRemote(context, uuid);

  I2CMaster master;
  int address;

  Future<void> writeRegister(int register, int value) =>
      master.writeRegister(address, register, value);
  Future<int> readRegister(int register) =>
      master.readRegister(address, register);
  Future<void> writeRegisters(int register, List<int> values) =>
      master.writeRegisters(address, register, values);
  Future<List<int>> readRegisters(int register, int length) =>
      master.readRegisters(address, register, length);
}

abstract class I2CMaster extends Device {
  static I2CMaster getRemote(Context context, String uuid) =>
      _$I2CMasterRmi.getRemote(context, uuid);

  Future<void> writeRegister(int slave, int register, int value);
  Future<int> readRegister(int slave, int register);
  Future<void> writeRegisters(int slave, int register, List<int> values);
  Future<List<int>> readRegisters(int slave, int register, int length);
}
