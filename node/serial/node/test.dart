import 'package:dart_node_serialport/serial_port_module.dart';
import 'package:test/test.dart';
import 'package:dart_node_serialport/impl.dart';
import 'package:blackbird/ontario/serial_port.dart';
import 'package:blackbird/ontario/connection.dart';
import 'package:blackbird/ontario/functions/device_identification.dart';
import 'package:blackbird/ontario/functions/rc_socket.dart';
import 'package:blackbird/src/manager/dependency_builders.dart';
import 'package:blackbird/device.dart';
import 'package:blackbird/blackbird.dart';
import 'package:blackbird/src/manager/construction.dart';
import 'package:blackbird/devices/socket.dart';
import 'package:blackbird/ontario/functions/rc_socket.dart';
import 'package:blackbird/ontario/functions/rc_socket.dart';

part 'test.g.dart';

class StubBuilder extends FilteredDependencyBuilder<RCSocket, AVRConnection> {
  AVRConnection con;
  StubBuilder(this.con);
  @override
  List<String> get producedTypes => _$StubBuilderTypes;

  @override
  Object buildFiltered(Dependency dependency) {
    return con;
  }
}

main() async {
  // SerialPort port = newSerialPort('/dev/ttyUSB0');
  //serialPortModule('/dev/ttyUSB0');
  // print(port);
  // List<int> sequence = [0xFF, 0xE4, 10, 0x90, 0x10, 0x00, 0xFF];
  // List<int> sequence = [0xFF, 0xE0, 0xFF];
  // print(sequence);
  // print(new String.fromCharCodes(sequence));
  // port.write(sequence);

  // port.on('data', ([dynamic payload]) {
  //   print(new String.fromCharCodes(payload));
  // });

  // SerialPort port = new SerialPort('/dev/ttyACM0');
  // port.write('this is some text');
  // port.flush();
  // port.open();

  // AVRConnection connection = new AVRConnection('/dev/ttyUSB0');
  // connection.send(new RCSwitchQuery(528, true));
  // connection.send(new DeviceIdentificationQuery());
  // send(new DeviceIdentificationQuery());
  // send(new DeviceIdentificationQuery());
  // send(new DeviceIdentificationQuery());

  SerialPort port = NodeSerialPort('/dev/ttyUSB0');

  // List<int> sequence = [0xFF, 0xE4, 10, 0x90, 0x10, 0x00, 0xFF];
  // port.output.add(String.fromCharCodes(sequence));
  // List<int> sequence = [0xFF, 0xE0, 0xFF];
  // print(sequence);
  // print(new String.fromCharCodes(sequence));

  AVRConnection avr = new AVRConnection(port);
  // print((await avr.sendAndReceive<DeviceIdentificationResponse>(
  //         new DeviceIdentificationQuery()))
  //     .avrID);
  // port.
  // avr.send(new RCSwitchQuery(528, true));

  StubBuilder builder = new StubBuilder(avr);

  Blackbird blackbird = new Blackbird();

  RCSocket socket = new RCSocket.device();
  socket.address = 528;
  socket.blackbird = blackbird;

  addDependencyBuilder(builder);

  socket.turnOn();
}
