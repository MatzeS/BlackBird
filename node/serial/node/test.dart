import 'package:dart_node_serialport/serial_port_module.dart';
import 'package:dart_node_serialport/serial_connection.dart';
import 'package:dart_node_serialport/rc_socket.dart';
import 'package:dart_node_serialport/device_identification.dart';

main() {
  // SerialPort port = serialPortModule('/dev/ttyUSB0');
  // print(port);
  List<int> sequence = [0xFF, 0xE4, 10, 0x90, 0x10, 0x00, 0xFF];
  // List<int> sequence = [0xFF, 0xE0, 0xFF];
  print(sequence);
  // print(new String.fromCharCodes(sequence));
  // port.write(sequence);

  // port.on('data', ([dynamic payload]) {
  //   print(new String.fromCharCodes(payload));
  // });

  // SerialPort port = new SerialPort('/dev/ttyACM0');
  // port.write('this is some text');
  // port.flush();
  // port.open();

  AVRConnection connection = new AVRConnection('/dev/ttyUSB0');
  // connection.send(new RCSwitchQuery(528, true));
  connection.send(new DeviceIdentificationQuery());
  // send(new DeviceIdentificationQuery());
  // send(new DeviceIdentificationQuery());
  // send(new DeviceIdentificationQuery());
}
