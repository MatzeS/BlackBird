import 'package:dart_node_serialport/serial_port_module.dart';
import 'package:test/test.dart';
import 'package:dart_node_serialport/impl.dart';
import 'package:blackbird/devices/ontario.dart';
import 'package:blackbird/devices/osram_bulb.dart';
import 'package:blackbird/devices/mcp23017.dart';
import 'package:blackbird/devices/mpr121.dart';
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

OsramBulb bulbe;
MPR121 mpr;
void a() async {
  var p = '/dev/ttyUSB0';
  SerialPort port = NodeSerialPort(p, newSerialPort(p));

  avr = new AVRConnection(port);

  StubBuilder builder = new StubBuilder(avr);

  Host local = new Host();
  Blackbird blackbird = new Blackbird(local);

  blackbird.addDependencyBuilder(builder);

  Ontario ontario = new Ontario();
  bulbe = new OsramBulb();
  bulbe.ontario = ontario;

  await blackbird.interfaceDevice(ontario);
  bulbe = await blackbird.interfaceDevice(bulbe);
  bulbe.turnOn();
  await Future.delayed(Duration(milliseconds: 500));
  bulbe.turnOff();
  await Future.delayed(Duration(milliseconds: 500));
  bulbe.turnOn();
  await Future.delayed(Duration(milliseconds: 500));

  mpr = new MPR121();
  mpr.address = Address.GND;
  mpr.master = ontario;

  mpr = await blackbird.interfaceDevice(mpr);
  // print('register ${await mpr.readRegister(0x5E)}');
  await start();
  // mpr.activate();

  MCP23017 mcp = new MCP23017();
  mcp.master = ontario;
  mcp.address = 32;
  mcp = await blackbird.interfaceDevice(mcp);
  while (true) {
    mcp.turnOn();
    await Future.delayed(Duration(seconds: 1));

    mcp.turnOff();
    await Future.delayed(Duration(seconds: 1));
  }
  // RCSocket socket = new RCSocket();
  // socket.address = 528;
  // socket.blackbird = blackbird;

  // while (true) {
  // await x();
  // }
  try {
    while (true) await avr.receive();
  } catch (e, s) {
    print(e);
    print(s);
  }
  // while (true) );

  // // socket.turnOff();
  // // await Future.delayed(Duration(seconds: 2));
  // avr.send(new IRSendQuery(1));
  // await Future.delayed(Duration(seconds: 2));

  // socket.turnOff();
}

void start() async {
  print('start');

  await mpr.softReset();
  await Future.delayed(Duration(milliseconds: 500));
  print('sr done ${await mpr.electrodeEnable}');

  List<Electrode> electrodes = [];
  for (int i = 0; i < 8; i++) {
    electrodes.add(mpr.electorde(i));
  }

  var config = ElectrodeConfig(0x3F ~/ 2, 4, 470, 100, 80);
  for (int i = 0; i < 7; i++) await electrodes[i].loadConfig(config);

  await mpr.setElectrodeEnable(8);
  print('enabled: ${await mpr.electrodeEnable}');

  mpr.touchEvent.listen(print);

  electrodes[6]
      .change
      .where((t) => t == Transition.TOUCHED)
      .listen((e) => bulbe.toggle());

  electrodes[4]
      .change
      .where((t) => t == Transition.TOUCHED)
      .listen((e) => bulbe.dim());

  electrodes[3]
      .change
      .where((t) => t == Transition.TOUCHED)
      .listen((e) => bulbe.brighten());

  while (true) {
    // String text = '';
    // for (int i = 0; i < 8; i++)
    //   text =
    //       text + (await electrodes[i].electrodeFilteredData).toString() + ' / ';
    // print(text);
    // print('enabled: ${await mpr.electrodeEnable}');
    // print(
    //     'electrode0 data: ${await e0.electrodeFilteredData}/${await e0.baseLineValue}');
    // print(
    //     'electrode1 data: ${await e1.electrodeFilteredData}/${await e1.baseLineValue}');
    await Future.delayed(Duration(milliseconds: 500));
  }
}
