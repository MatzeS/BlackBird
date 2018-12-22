import 'package:blackbird/blackbird.dart';

part 'ontario.g.dart';

abstract class Ontario extends Device {
  Ontario();
  factory Ontario.device() => _$OntarioDevice();
}
