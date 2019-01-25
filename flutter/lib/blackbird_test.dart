import 'package:blackbird/blackbird.dart';
import 'package:blackbird/devices/osram_bulb.dart';
import 'package:blackbird/devices/ontario.dart';
import 'package:blackbird/domum.dart';

bool _setup = false;
void setup() {
  if (_setup) return;
  _setup = true;

  setupDomum('companion');
}

test() async {
  setup();
  print('doing $bulb');

  bulb = await blackbird.interfaceDevice(bulb);
  bulb.turnOff();
  await Future.delayed(Duration(milliseconds: 500));
  bulb.turnOn();
}
