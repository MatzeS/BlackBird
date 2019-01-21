import 'package:blackbird/blackbird.dart';
import 'i2c.dart';
import 'package:blackbird/src/ontario/connection.dart';
import 'package:blackbird/src/ontario/functions/i2c.dart';

export 'package:blackbird/src/ontario/connection.dart';
export 'package:blackbird/src/ontario/serial_port.dart';
export 'package:blackbird/src/ontario/functions/rc_socket.dart';

part 'ontario.g.dart';

abstract class Ontario extends Device implements I2CMaster {
  Ontario._();
  factory Ontario() => _$OntarioDevice();

  AVRConnection get connection;

  writeRegister(int slave, int register, int value) =>
      writeRegisters(slave, register, [value]);
  readRegister(int slave, int register) async =>
      readRegisters(slave, register, 1).then((l) => l.single);

  Future<void> writeRegisters(
          int slave, int register, List<int> values) async =>
      connection.send(new I2CWriteQuery(slave, register, values));

  Future<List<int>> readRegisters(int slave, int register, int length) async =>
      connection
          .sendAndReceive<I2CReadResponse>(
              new I2CReadQuery(slave, register, length),
              filter: (r) =>
                  r.slaveAddress == slave && r.registerAddress == register)
          .then((r) => r.data);
}
