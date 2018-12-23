import 'package:blackbird/blackbird.dart';
export 'package:blackbird/src/ontario/connection.dart';
export 'package:blackbird/src/ontario/serial_port.dart';
export 'package:blackbird/src/ontario/functions/rc_socket.dart';
part 'ontario.g.dart';

abstract class Ontario extends Device {
  Ontario();
  factory Ontario.device() => _$OntarioDevice();
}
