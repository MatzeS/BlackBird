import 'package:blackbird/blackbird.dart';
import 'register_table_device.dart';
export 'register_table_device.dart';

part 'i2c.g.dart';

abstract class I2CSlave extends Device with RegisterTableDevice {
  I2CSlave._();
  I2CSlave.extender();
  factory I2CSlave() => _$I2CSlaveDevice();
  static I2CSlave getRemote(Context context, String uuid) =>
      _$I2CSlaveRmi.getRemote(context, uuid);
  factory I2CSlave.fromJson(Map<String, dynamic> json) =>
      _$I2CSlaveFromJson(json);

  I2CMaster master;
  int address;

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

  Future<void> writeRegisters(int slave, int register, List<int> values);
  Future<List<int>> readRegisters(int slave, int register, int length);

  Stream<void> get commonInterrupt;
}
