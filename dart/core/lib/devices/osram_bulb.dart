import 'package:blackbird/blackbird.dart';
import 'package:blackbird/src/ontario/functions/ir.dart';
import 'package:blackbird/devices/ontario.dart';
import 'output.dart';
part 'osram_bulb.g.dart';

const ON = 0xffe01f;
const OFF = 0xff609f;
const BRIGHTER = 0xff00ff;
const DIMMER = 0xff40bf;

const RED = 0xff10ef;
const GREEN = 0xff906f;
const BLUE = 0xff50af;
const WHITE = 0xffc03f;

const FLASH = 0xfff00f;
const STROBE = 0xffc837;
const SMOOTH = 0xffe817;
const MODE = 0xffd827;

const RED1 = 0xff30cf;
const RED2 = 0xff08f7;
const RED3 = 0xff28d7;
const RED4 = 0xff18e7;
const GREEN1 = 0xffb04f;
const GREEN2 = 0xff8877;
const GREEN3 = 0xffa857;
const GREEN4 = 0xff9867;
const BLUE1 = 0xff708f;
const BLUE2 = 0xff48b7;
const BLUE3 = 0xff6897;
const BLUE4 = 0xff58a7;

abstract class OsramBulb extends Device with BinaryOutput, BufferedOutput {
  OsramBulb._() : super();
  factory OsramBulb() => _$OsramBulbDevice();
  static OsramBulb getRemote(Context context, String uuid) =>
      _$OsramBulbRmi.getRemote(context, uuid);

  Ontario ontario;
  _send(int data) => ontario.sendIR(data);

  turnOn() async {
    _send(ON);
    _send(WHITE);
  }

  turnOff() async {
    _send(OFF);
  }

  @Ignore()
  operator ==(Object other) {
    if (other is! OsramBulb) return false;
    return true;
  }

  @Ignore()
  @override
  int get hashCode {
    return 1234;
  }

  toggle() => state = state == ON ? OFF : ON;

  void writeState(int state) {
    if (state == ON)
      turnOn();
    else
      turnOff();
  }
}
