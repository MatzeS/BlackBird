import 'package:dart_node_serialport/serial_port_module.dart';
import 'package:test/test.dart';
import 'package:dart_node_serialport/impl.dart';
import 'package:blackbird/devices/ontario.dart';
import 'package:blackbird/devices/osram_bulb.dart';
import 'package:blackbird/devices/mcp23017.dart';
import 'package:blackbird/src/manager/dependency_builders.dart';
import 'package:blackbird/blackbird.dart';
import 'package:blackbird/src/manager/construction.dart';

part 'test.g.dart';

class StubBuilder extends FilteredDependencyBuilder<Ontario, AVRConnection> {
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
  a();
}

AVRConnection avr;
void x() async {
  // await avr.receive();
  await Future.delayed(Duration(seconds: 2));
  // while (true) {
  // avr.send(new IRSendQuery(0xFFFFFFFF));
  // avr.send(new IRSendQuery(0xFF40BF));
  // avr.send(new IRSendQuery(0xFFFFFFFF));
  // await Future.delayed(Duration(seconds: 2));
  // while (true) {
  // avr.send(new IRSendQuery(0xFFFFFFFF));
  // avr.send(new IRSendQuery(0xBF40FF00));
  // avr.send(new IRSendQuery(0xFFFFFFFF));
  // await Future.delayed(Duration(seconds: 1));
  print('done');
  // }
}

void a() async {
  var p = '/dev/ttyUSB1';
  SerialPort port = NodeSerialPort(p, newSerialPort(p));

  avr = new AVRConnection(port);

  StubBuilder builder = new StubBuilder(avr);

  Host local = new Host();
  Blackbird blackbird = new Blackbird(local);

  blackbird.addDependencyBuilder(builder);

  Ontario ontario = new Ontario();
  OsramBulb bulb = new OsramBulb();
  bulb.ontario = ontario;

  // await blackbird.implementDevice(ontario);
  // bulb = await blackbird.implementDevice(bulb);
  // bulb.turnOff();

  MCP23017 mcp = new MCP23017();
  mcp.master = ontario;
  mcp.address = 32;
  mcp = await blackbird.implementDevice(mcp);
  mcp.turnOn();

  // RCSocket socket = new RCSocket();
  // socket.address = 528;
  // socket.blackbird = blackbird;

  // while (true) {
  // await x();
  // }
  while (true) await avr.receive();

  // while (true) );

  // // socket.turnOff();
  // // await Future.delayed(Duration(seconds: 2));
  // avr.send(new IRSendQuery(1));
  // await Future.delayed(Duration(seconds: 2));

  // socket.turnOff();
}
