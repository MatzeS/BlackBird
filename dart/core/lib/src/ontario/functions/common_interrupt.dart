import 'package:blackbird/src/ontario/connection.dart';
import 'command_bytes.dart';

class CommonInterruptParser extends PacketParser {
  CommonInterruptParser() : super(COMMON_INTERRUPT);

  @override
  AVRPacket parse(String data) {
    // print('common interrupt raised');
    return new CommonInterruptResponse();
  }
}

class CommonInterruptResponse extends AVRPacket {
  CommonInterruptResponse();
}
