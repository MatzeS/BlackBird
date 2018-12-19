import '../connection.dart';
import 'package:blackbird/devices/socket.dart';
import 'package:blackbird/device.dart';
import 'package:blackbird/device.dart';
import 'package:blackbird/blackbird.dart';
import 'package:rmi/remote_method_invocation.dart';
import 'package:rmi/invoker.dart';
import 'package:rmi/proxy.dart';

part 'rc_socket.g.dart';

abstract class RCSocket extends RemoteSocket {
  @Runtime()
  AVRConnection get connection;

  @Property()
  int address;

  @override
  set remoteState(bool state) {
    connection.send(new RCSwitchQuery(address, state));
  }

  RCSocket();
  factory RCSocket.device() => _$RCSocketDevice();
}

class RCSwitchQuery extends TransmittableAVRPacket {
  final int address;
  final bool state;

  RCSwitchQuery(this.address, this.state) : super(0xE4);

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
