import '../connection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:blackbird/devices/outlet.dart';
import 'package:blackbird/devices/ontario.dart';
import 'package:blackbird/blackbird.dart';
import 'package:rmi/remote_method_invocation.dart';
import 'package:rmi/invoker.dart';
import 'package:rmi/proxy.dart';
import 'package:blackbird/devices/common.dart';

part 'rc_socket.g.dart';

abstract class RCSocket extends Outlet {
  RCSocket._() : super();
  static RCSocket getRemote(Context context, String uuid) =>
      _$RCSocketRmi.getRemote(context, uuid);

  //TODO create sender
  Ontario sender;

  // not ideally this is used to force an abstract device
  @Executive()
  CodeWord get codeWord;

  @Executive()
  writeState(int state) {
    sender.connection
        .send(new RCSwitchAdvancedQuery(codeWord.forStatus(state == ON)));
  }
}

abstract class DipSwitchSocket extends RCSocket {
  DipSwitchSocket._() : super._();
  static DipSwitchSocket getRemote(Context context, String uuid) =>
      _$DipSwitchSocketRmi.getRemote(context, uuid);

  String dipCode;
  CodeWord get codeWord => new CodeWordA(dipCode);

  factory DipSwitchSocket(String dipCode) {
    var res = _$DipSwitchSocketDevice();
    res.dipCode = dipCode;
    return res;
  }
}

abstract class IntertechnoSwitch extends RCSocket {
  IntertechnoSwitch._() : super._();
  static IntertechnoSwitch getRemote(Context context, String uuid) =>
      _$IntertechnoSwitchRmi.getRemote(context, uuid);

  String family;
  int device;
  CodeWord get codeWord => new CodeWordCDualDial(family, device);

  factory IntertechnoSwitch(String family, int device) {
    var res = _$IntertechnoSwitchDevice();
    res.family = family;
    res.device = device;
    return res;
  }
}

// Old implementation, supports only 10 bit dip switches
@deprecated
class RCSimpleSwitchQuery extends TransmittableAVRPacket {
  final int address;
  final bool state;

  RCSimpleSwitchQuery(this.address, this.state) : super(0xE4);

  @override
  List<int> get payload {
    int groupByte = 0;
    int socketByte = 0;
    for (int i = 0; i < 5; i++) {
      if (address & (1 << (5 + i)) > 0) groupByte |= 1 << i;
      if (address & (1 << i) > 0) socketByte |= 1 << i;
    }
    if (state) groupByte |= 1 << 7;

    return [10, groupByte, socketByte];
  }
}

class RCSwitchAdvancedQuery extends TransmittableAVRPacket {
  final String sequence;

  RCSwitchAdvancedQuery(this.sequence) : super(0xE4);

  @override
  List<int> get payload {
    // code 40, 12 char sequence, termination byte;
    return [40].followedBy(sequence.codeUnits).followedBy([0]).toList();
  }
}

abstract class CodeWord {
  String forStatus(bool status);
}

class CodeWordA extends CodeWord {
  final String dip;
  CodeWordA(this.dip);
  String forStatus(bool status) => _getCodeWordA(dip, status);
}

class CodeWordB extends CodeWord {
  final int address;
  final int channel;
  CodeWordB(this.address, this.channel);
  String forStatus(bool status) => _getCodeWordB(address, channel, status);
}

class CodeWordC extends CodeWord {
  final String family;
  final int group;
  final int device;
  CodeWordC(this.family, this.group, this.device);
  String forStatus(bool status) => _getCodeWordC(family, group, device, status);
}

class CodeWordCDualDial extends CodeWord {
  final String family;
  final int device;
  CodeWordCDualDial(this.family, this.device);
  String forStatus(bool status) =>
      _getCodeWordCDualDial(family, device, status);
}

@JsonSerializable()
class CodeWordD extends CodeWord {
  final String group;
  final int device;
  CodeWordD(this.group, this.device);
  String forStatus(bool status) => _getCodeWordD(group, device, status);
}

/// The code word generation is based on the RCSwitch library by Suat Özgür (github:sui77)
/// The following code is based on the work of a number of RCSwitch contributors. All credit belongs to them.
/// See https://github.com/sui77/rc-switch/blob/master/RCSwitch.cpp, Feb. 2019

/// Code of the switch group (refers to DIP switches 1..5 where "1" = on and "0" = off, if all DIP switches are on it's "11111")
String _getCodeWordA(String dip, bool status) {
  StringBuffer result = new StringBuffer();

  for (int i = 0; i < 10; i++) {
    result.write((dip[i] == '0') ? 'F' : '0');
  }

  result.write(status ? '0' : 'F');
  result.write(status ? 'F' : '0');

  return result.toString();
}

/**
 * Encoding for type B switches with two rotary/sliding switches.
 *
 * The code word is a tristate word and with following bit pattern:
 *
 * +-----------------------------+-----------------------------+----------+------------+
 * | 4 bits address              | 4 bits address              | 3 bits   | 1 bit      |
 * | switch group                | switch number               | not used | on / off   |
 * | 1=0FFF 2=F0FF 3=FF0F 4=FFF0 | 1=0FFF 2=F0FF 3=FF0F 4=FFF0 | FFF      | on=F off=0 |
 * +-----------------------------+-----------------------------+----------+------------+
 *
 * @param nAddressCode  Number of the switch group (1..4)
 * @param nChannelCode  Number of the switch itself (1..4)
 * @param status       Whether to switch on (true) or off (false)
 *
 * @return char[13], representing a tristate code word of length 12
 */
String _getCodeWordB(int addressCode, int channelCode, bool status) {
  StringBuffer result = new StringBuffer();

  if (addressCode < 1 ||
      addressCode > 4 ||
      channelCode < 1 ||
      channelCode > 4) {
    throw new ArgumentError('');
  }

  for (int i = 1; i <= 4; i++) {
    result.write((addressCode == i) ? '0' : 'F');
  }

  for (int i = 1; i <= 4; i++) {
    result.write((channelCode == i) ? '0' : 'F');
  }

  result.write('F');
  result.write('F');
  result.write('F');

  result.write(status ? 'F' : '0');

  return result.toString();
}

/**
 * Like getCodeWord (Type C = Intertechno)
 */
String _getCodeWordC(String family, int group, int device, bool status) {
  StringBuffer result = new StringBuffer();

  int familyNum = family.codeUnitAt(0) - 'a'.codeUnitAt(0);
  if (familyNum < 0 ||
      familyNum > 15 ||
      group < 1 ||
      group > 4 ||
      device < 1 ||
      device > 4) {
    throw new ArgumentError('');
  }

  // encode the family into four bits
  result.write((familyNum & 1) > 0 ? 'F' : '0');
  result.write((familyNum & 2) > 0 ? 'F' : '0');
  result.write((familyNum & 4) > 0 ? 'F' : '0');
  result.write((familyNum & 8) > 0 ? 'F' : '0');

  // encode the device and group
  result.write(((device - 1) & 1) > 0 ? 'F' : '0');
  result.write(((device - 1) & 2) > 0 ? 'F' : '0');
  result.write(((group - 1) & 1) > 0 ? 'F' : '0');
  result.write(((group - 1) & 2) > 0 ? 'F' : '0');

  // encode the status code
  result.write('0');
  result.write('F');
  result.write('F');
  result.write(status ? 'F' : '0');

  return result.toString();
}

String _getCodeWordCDualDial(String family, int device, bool status) {
  StringBuffer result = new StringBuffer();

  device--;

  //TODO captial
  int familyNum = family.codeUnitAt(0) - 'A'.codeUnitAt(0);
  if (familyNum < 0 || familyNum > 15 || device < 0 || device > 15) {
    throw new ArgumentError('argument out of range');
  }

  // encode the family into four bits
  result.write((familyNum & 1) > 0 ? 'F' : '0');
  result.write((familyNum & 2) > 0 ? 'F' : '0');
  result.write((familyNum & 4) > 0 ? 'F' : '0');
  result.write((familyNum & 8) > 0 ? 'F' : '0');

  // encode the device into four bits
  result.write((device & 1) > 0 ? 'F' : '0');
  result.write((device & 2) > 0 ? 'F' : '0');
  result.write((device & 4) > 0 ? 'F' : '0');
  result.write((device & 8) > 0 ? 'F' : '0');

  // encode the status code
  result.write('0');
  result.write('F');
  result.write('F');
  result.write(status ? 'F' : '0');

  return result.toString();
}

/**
 * Encoding for the REV Switch Type
 *
 * The code word is a tristate word and with following bit pattern:
 *
 * +-----------------------------+-------------------+----------+--------------+
 * | 4 bits address              | 3 bits address    | 3 bits   | 2 bits       |
 * | switch group                | device number     | not used | on / off     |
 * | A=1FFF B=F1FF C=FF1F D=FFF1 | 1=0FF 2=F0F 3=FF0 | 000      | on=10 off=01 |
 * +-----------------------------+-------------------+----------+--------------+
 *
 * Source: http://www.the-intruder.net/funksteckdosen-von-rev-uber-arduino-ansteuern/
 *
 * @param sGroup        Name of the switch group (A..D, resp. a..d) 
 * @param device       Number of the switch itself (1..3)
 * @param status       Whether to switch on (true) or off (false)
 *
 * @return char[13], representing a tristate code word of length 12
 */
String _getCodeWordD(String group, int device, bool status) {
  StringBuffer result = new StringBuffer();

  // sGroup must be one of the letters in "abcdABCD"
  int groupNum = (group.codeUnitAt(0) >= 'a'.codeUnitAt(0))
      ? group.codeUnitAt(0) - 'a'.codeUnitAt(0)
      : group.codeUnitAt(0) - 'A'.codeUnitAt(0);
  if (groupNum < 0 || groupNum > 3 || device < 1 || device > 3) {
    throw new ArgumentError('argument out of range');
  }

  for (int i = 0; i < 4; i++) {
    result.write((group == i) ? '1' : 'F');
  }

  for (int i = 1; i <= 3; i++) {
    result.write((device == i) ? '1' : 'F');
  }

  result.write('0');
  result.write('0');
  result.write('0');

  result.write(status ? '1' : '0');
  result.write(status ? '0' : '1');

  return result.toString();
}
