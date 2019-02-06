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
  // bulb.turnOn();
  // await Future.delayed(Duration(milliseconds: 500));
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

  // await mpr.writeBitBlock(BitBlocks.AC_ACE, 1);
  // await mpr.writeRegister(0x7D, 0xFF);
  // await mpr.writeRegister(0x7E, 0x0);
  // await mpr.writeRegister(0x7F, 0xFF ~/ 2);

  List<Electrode> electrodes = [];
  for (int i = 0; i < 8; i++) {
    electrodes.add(mpr.electorde(i));
  }

  // Electrode e0 = mpr.electorde(0);
  // Electrode e1 = mpr.electorde(1);

  var config = ElectrodeConfig(0x3F ~/ 2, 4, 470, 100, 80);
  // var config2 = ElectrodeConfig(0x3F ~/ 2, 4, 470, 100, 80);
  for (int i = 1; i < 8; i++) await electrodes[i].loadConfig(config);
  // await electrodes[1].loadConfig(config);
  // await electrodes[2].loadConfig(config);
  // await electrodes[3].loadConfig(config);
  // await electrodes[4].loadConfig(config2);
  // await e1.loadConfig(config);

  await mpr.setElectrodeEnable(8);
  print('enabled: ${await mpr.electrodeEnable}');

  electrodes[1]
      .change
      .where((t) => t == Transition.TOUCHED)
      .listen((e) => bulbe.toggle());

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
