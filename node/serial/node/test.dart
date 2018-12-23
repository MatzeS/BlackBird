import 'package:dart_node_serialport/serial_port_module.dart';
import 'package:test/test.dart';
import 'package:dart_node_serialport/impl.dart';
import 'package:blackbird/devices/ontario.dart';
import 'package:blackbird/src/manager/dependency_builders.dart';
import 'package:blackbird/blackbird.dart';
import 'package:blackbird/src/manager/construction.dart';
import 'package:blackbird/devices/socket.dart';

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
  SerialPort port = NodeSerialPort('/dev/ttyUSB0');

  AVRConnection avr = new AVRConnection(port);

  StubBuilder builder = new StubBuilder(avr);

  Blackbird blackbird = new Blackbird();

  addDependencyBuilder(builder);

  RCSocket socket = new RCSocket.device();
  socket.address = 528;
  socket.blackbird = blackbird;

  socket.turnOn();
}
