import 'package:blackbird/blackbird.dart';
import 'package:blackbird/src/ontario/functions/ir.dart';
import 'package:blackbird/devices/ontario.dart';
import 'output.dart';
part 'osram_bulb.g.dart';

class Code {
  static const ON = 0xffe01f;
  static const OFF = 0xff609f;
  static const BRIGHTER = 0xff00ff;
  static const DIMMER = 0xff40bf;

  static const RED = 0xff10ef;
  static const GREEN = 0xff906f;
  static const BLUE = 0xff50af;
  static const WHITE = 0xffc03f;

  static const FLASH = 0xfff00f;
  static const STROBE = 0xffc837;
  static const SMOOTH = 0xffe817;
  static const MODE = 0xffd827;

  static const RED1 = 0xff30cf;
  static const RED2 = 0xff08f7;
  static const RED3 = 0xff28d7;
  static const RED4 = 0xff18e7;
  static const GREEN1 = 0xffb04f;
  static const GREEN2 = 0xff8877;
  static const GREEN3 = 0xffa857;
  static const GREEN4 = 0xff9867;
  static const BLUE1 = 0xff708f;
  static const BLUE2 = 0xff48b7;
  static const BLUE3 = 0xff6897;
  static const BLUE4 = 0xff58a7;
}

abstract class OsramBulb extends Device with BinaryOutput, BufferedOutput {
  OsramBulb._() : super();
  factory OsramBulb() => _$OsramBulbDevice();
  static OsramBulb getRemote(Context context, String uuid) =>
      _$OsramBulbRmi.getRemote(context, uuid);

  IRTransmitter transmitter;
  _send(int data) => transmitter.transmitIRCode(data);

  toggle() => state = state == ON ? OFF : ON;

  @override
  void writeState(int state) {
    if (state == ON) {
      _send(Code.ON);
      _send(Code.WHITE);
    } else {
      _send(Code.OFF);
    }
  }

  brighten() async {
    _send(Code.BRIGHTER);
  }

  dim() async {
    _send(Code.DIMMER);
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
}
