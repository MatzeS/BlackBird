import 'package:blackbird/blackbird.dart';
import 'i2c.dart';
import 'package:blackbird/src/ontario/connection.dart';
import 'package:blackbird/src/ontario/functions/i2c.dart';
import 'package:blackbird/src/ontario/functions/ir.dart';
import 'package:blackbird/src/ontario/functions/common_interrupt.dart';
import 'package:blackbird/devices/ir.dart';

export 'package:blackbird/src/ontario/connection.dart';
export 'package:blackbird/src/ontario/serial_port.dart';
export 'package:blackbird/src/ontario/functions/rc_socket.dart';
export 'package:blackbird/src/ontario/functions/ir.dart';
export 'package:blackbird/devices/ir.dart';

part 'ontario.g.dart';

abstract class Ontario extends Device
    implements I2CMaster, IRReceiver, IRTransmitter {
  Ontario._();
  factory Ontario() => _$OntarioDevice();
  static Ontario getRemote(Context context, String uuid) =>
      _$OntarioRmi.getRemote(context, uuid);

  AVRConnection get connection;

  Stream<int> get receive => connection.stream
      .where((p) => p is IRReceiveResponse)
      .map((r) => r as IRReceiveResponse)
      .map((r) => r.data);

  Future<void> transmitIRCode(int code) async {
    connection.send(new IRSendQuery(code));
  }

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
