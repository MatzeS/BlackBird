import 'package:blackbird/blackbird.dart';
import 'package:blackbird/devices/ir_receiver.dart';

part 'apple_remote.g.dart';

class Codes {
  static const int PREFIX = 0x77e1;

  static const int KEY_DOWN = 0xb0; // down
  static const int KEY_UP = 0xd0; // up
  static const int KEY_RIGHT = 0xe0; // right
  static const int KEY_LEFT = 0x10; // left
  static const int KEY_CENTER_1 = 0xba; // center
  static const int KEY_CENTER_2 = 0x20;
  static const int KEY_MENU = 0x40; // menu
  static const int KEY_PLAY_1 = 0x7a; //play
  static const int KEY_PLAY_2 = 0x20;

  static bool testPrefix(int code) => _getPrefix(code) == Codes.PREFIX;
  static bool testKey(int code, int key) => _getKeyByte(code) == key;
  static bool testSuffix(int code, int suffix) => _getSuffix(code) == suffix;
}

abstract class AppleRemote extends Device {
  AppleRemote._() : super();
  factory AppleRemote() => _$AppleRemoteDevice();
  static AppleRemote getRemote(Context context, String uuid) =>
      _$AppleRemoteRmi.getRemote(context, uuid);

  int address;

  IRReceiver receiver;

  Stream<int> get fullCode => receiver.receive
      .where((c) => Codes.testPrefix(c) && Codes.testSuffix(c, address));
  Stream<int> get keyCode => fullCode.map((c) => _getKeyByte(c));

  Stream<void> get up => keyCode.where((c) => c == Codes.KEY_UP);
  Stream<void> get down => keyCode.where((c) => c == Codes.KEY_DOWN);
  Stream<void> get right => keyCode.where((c) => c == Codes.KEY_RIGHT);
  Stream<void> get left => keyCode.where((c) => c == Codes.KEY_LEFT);
  Stream<void> get play => keyCode.where((c) => c == Codes.KEY_PLAY_1);
  Stream<void> get menu => keyCode.where((c) => c == Codes.KEY_MENU);
  Stream<void> get center => keyCode.where((c) => c == Codes.KEY_CENTER_1);
}

int _getSuffix(int code) => (code & 0xFF) >> 0;
int _getKeyByte(int code) => (code & 0xFF00) >> 8;
int _getPrefix(int code) => (code & 0xFFFF0000) >> 16;
