import 'package:blackbird/blackbird.dart';
import 'i2c.dart';
import 'package:blackbird/src/ontario/connection.dart';
import 'package:blackbird/src/ontario/functions/i2c.dart';
import 'package:blackbird/src/ontario/functions/ir.dart';
import 'package:blackbird/src/ontario/functions/common_interrupt.dart';
import 'package:blackbird/devices/ir_receiver.dart';

export 'package:blackbird/src/ontario/connection.dart';
export 'package:blackbird/src/ontario/serial_port.dart';
export 'package:blackbird/src/ontario/functions/rc_socket.dart';
export 'package:blackbird/src/ontario/functions/ir.dart';

part 'ontario.g.dart';

abstract class Ontario extends Device implements I2CMaster, IRReceiver {
  Ontario._();
  factory Ontario() => _$OntarioDevice();
  static Ontario getRemote(Context context, String uuid) =>
      _$OntarioRmi.getRemote(context, uuid);

  AVRConnection get connection;

  Stream<int> get receive => connection.stream
      .where((p) => p is IRReceiveResponse)
      .map((r) => r as IRReceiveResponse)
      .map((r) => r.data);

  Future<void> sendIR(int ir) {
    //TODO
    IRSendQuery x = new IRSendQuery(ir);
    connection.send(x);
  }

  writeRegister(int slave, int register, int value) =>
      writeRegisters(slave, register, [value]);
  readRegister(int slave, int register) async =>
      readRegisters(slave, register, 1).then((l) => l.single);

  Stream<void> _commonInterruptStream;
  Stream<void> get commonInterrupt {
    if (_commonInterruptStream == null) setupCommonInterruptStream();
    return _commonInterruptStream;
  }

  setupCommonInterruptStream() {
    _commonInterruptStream = connection.stream
        .where((p) => p is CommonInterruptResponse)
        .map((p) => p as CommonInterruptResponse)
        .asBroadcastStream();
  }

  Future<void> writeRegisters(int slave, int register, List<int> values) async {
    connection.send(new I2CWriteQuery(slave, register, values));
  }

  Future<List<int>> readRegisters(int slave, int register, int length) async =>
      connection
          .sendAndReceive<I2CReadResponse>(
              new I2CReadQuery(slave, register, length),
              filter: (r) =>
                  r.slaveAddress == slave && r.registerAddress == register,
              timeout: Duration(milliseconds: 1000),
              tries: 3)
          .then((r) => r.data);
}
