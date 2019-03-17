import 'package:domum/domum.dart';
import 'package:dart_node_serialport/serial_port_module.dart';
import 'package:test/test.dart';
import 'package:dart_node_serialport/impl.dart';
import 'package:blackbird/devices/ontario.dart';
import 'package:blackbird/devices/i2c.dart';
import 'package:blackbird/devices/osram_bulb.dart';
import 'package:blackbird/devices/input.dart';
import 'package:blackbird/devices/mcp23017.dart';
import 'package:blackbird/devices/mpr121.dart';
import 'package:blackbird/devices/apple_remote.dart';
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

MPR121 mpr;

main() async {
  setupDomum('empty');

  var p = '/dev/ttyUSB0';
  SerialPort port = NodeSerialPort(p, newSerialPort(p));
  AVRConnection avr = new AVRConnection(port);
  StubBuilder builder = new StubBuilder(avr);
  blackbird.addDependencyBuilder(builder);

  // #############################

  AppleRemote remote = new AppleRemote();
  remote.address = AppleRemote.ALL_ADDR; //0xc6;
  remote.receiver = ontario;

  remote = await blackbird.interfaceDevice(remote);

  workbenchLamp = await blackbird.interfaceDevice(workbenchLamp);
  deskLamp = await blackbird.interfaceDevice(deskLamp);
  ambientLight = await blackbird.interfaceDevice(ambientLight);
  computerPeripherals = await blackbird.interfaceDevice(computerPeripherals);
  // ambientLight.turnOn();
  // deskLamp = await blackbird.interfaceDevice(bulbe);

  remote.up.listen((_) => ambientLight.toggle());
  // remote.down.listen((_) => ambientLight.turnOff());

  remote.left.listen((_) => workbenchLamp.toggle());
  remote.right.listen((_) => deskLamp.toggle());

  remote.play.listen((_) async {
    await ambientLight.turnOn();
    await Future.delayed(Duration(milliseconds: 200));
    await workbenchLamp.turnOn();
    await Future.delayed(Duration(milliseconds: 200));
    await deskLamp.turnOn();
  });
  remote.menu.listen((_) async {
    await ambientLight.turnOff();
    await Future.delayed(Duration(milliseconds: 200));
    await workbenchLamp.turnOff();
    await Future.delayed(Duration(milliseconds: 200));
    await deskLamp.turnOff();
  });

  SequenceTrigger sequence =
      new SequenceTrigger(remote.keyCode, [Codes.KEY_DOWN, Codes.KEY_CENTER_1]);
  sequence.trigger.listen((_) => computerPeripherals.toggle());

  remote.keyCode.listen(print);

  // bulbe = new OsramBulb();
  // bulbe.ontario = ontario;

  // ontario.send();
  // RCSocket s = new RCSocket();
  // s.connection = avr;
  // int addr = 1 << 3;
  // while (true) {
  //
  //   await Future.delayed(Duration(milliseconds: 1000));
  //   await avr.send(new RCSwitchAdvancedQuery(false));
  //   await Future.delayed(Duration(milliseconds: 1000));
  //   print('DONE');
  // }

  // await blackbird.interfaceDevice(ontario);
  // bulbe = await blackbird.interfaceDevice(bulbe);
  // await bulbe.turnOn();
  // await Future.delayed(Duration(milliseconds: 500));
  // await bulbe.turnOff();
  // await Future.delayed(Duration(milliseconds: 500));

  mpr = new MPR121();
  mpr.address = Address.GND;
  mpr.master = ontario;
  mpr = await blackbird.interfaceDevice(mpr);
  await mprStart();
  // await testBus();
  // bulbe.turnOn();
  // await Future.delayed(Duration(milliseconds: 500));

  // print('register ${await mpr.readRegister(0x5E)}');
  // await start();
  // mpr.activate();

  // MCP23017 mcp = new MCP23017();
  // mcp.master = ontario;
  // mcp.address = 32;
  // mcp = await blackbird.interfaceDevice(mcp);
  // while (true) {
  //   mcp.turnOn();
  //   await Future.delayed(Duration(seconds: 1));

  //   mcp.turnOff();
  //   await Future.delayed(Duration(seconds: 1));
  // }
  // RCSocket socket = new RCSocket();
  // socket.address = 528;
  // socket.blackbird = blackbird;

  // while (true) {
  // await x();
  // }

  // avr.rece

  // try {
  // while (true) print(await avr.receive());
  // } catch (e, s) {
  //   print(e);
  //   print(s);
  // }
  // while (true) );

  // // socket.turnOff();
  // // await Future.delayed(Duration(seconds: 2));
  // avr.send(new IRSendQuery(1));
  // await Future.delayed(Duration(seconds: 2));

  // socket.turnOff();
}

void mprStart() async {
  print('start');

  await mpr.softReset();
  await Future.delayed(Duration(milliseconds: 500));
  print('sr done ${await mpr.electrodeEnable}');

  List<Electrode> electrodes = [];
  for (int i = 0; i < 10; i++) {
    electrodes.add(mpr.electorde(i));
  }

  var config = ElectrodeConfig(0x3F ~/ 2, 4, 470, 100, 80);
  for (int i = 0; i < 7; i++) await electrodes[i].loadConfig(config);

  var config2 = ElectrodeConfig(0x3F ~/ 2, 4, 540, 100, 80);
  await electrodes[8].loadConfig(config2);
  await electrodes[9].loadConfig(config2);

  await mpr.setElectrodeEnable(10);
  print('enabled: ${await mpr.electrodeEnable}');

  mpr.touchEvent.listen(print);

  electrodes[6].touched.listen((e) => workbenchLamp.toggle());
  electrodes[4].touched.listen((e) => deskLamp.toggle());
  electrodes[5].touched.listen((e) => ambientLight.toggle());

  var ep = mpr.touchEvent
      .where((e) => e.transition.isTouched)
      .map((e) => e.electrode)
      .asBroadcastStream();

  SequenceTrigger doubleTab = new SequenceTrigger(ep, [8, 8]);
  doubleTab.trigger.listen((_) => deskLamp.toggle());

  SequenceTrigger doubleTab2 = new SequenceTrigger(ep, [9, 9]);
  doubleTab2.trigger.listen((_) => workbenchLamp.toggle());

  SequenceTrigger doubleTab3 = new SequenceTrigger(ep, [8, 9, 8]);
  doubleTab3.trigger.listen((_) => ambientLight.toggle());

  SequenceTrigger doubleTab5 = new SequenceTrigger(ep, [3, 3]);
  doubleTab5.trigger.listen((_) => computerPeripherals.toggle());
  // while (true) {
  //   print(await electrodes[8].electrodeFilteredData);
  // }

  // electrodes[4]
  //     .change
  //     .where((t) => t == Transition.TOUCHED)
  //     .listen((e) => deskLamp.dim());

  // electrodes[3]
  //     .change
  //     .where((t) => t == Transition.TOUCHED)
  //     .listen((e) => deskLamp.brighten());
}

testBus() async {
  print('');
  print('=====================================');
  print('');

  // I2CSlave slave = new I2CSlave();
  // slave.master = ontario;
  // slave.address = 0x74;
  // // slave.address = int.parse('01110100', radix: 2);

  // slave = await blackbird.interfaceDevice(slave);

  // int value = int.parse('00001000', radix: 2);
  // slave.writeRegisters(value, []);

  print('done');
  await mpr.writeRegister(0x5E, 0x15);
  print('MPR register ${await mpr.readRegister(0x5E)}');
  print('done');
}
