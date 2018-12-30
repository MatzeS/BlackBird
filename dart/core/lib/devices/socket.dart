import 'package:blackbird/blackbird.dart';
import 'common.dart';
import 'package:blackbird/devices/input.dart';
import 'package:blackbird/devices/output.dart';
part 'socket.g.dart';

abstract class Socket extends DiscreteOutput with BinaryOutput, BufferedOutput {
  toggle() => state = state == ON ? OFF : ON;
}
