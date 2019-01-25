import 'package:blackbird/blackbird.dart';
import 'common.dart';
import 'package:blackbird/devices/input.dart';
import 'package:blackbird/devices/output.dart';
part 'outlet.g.dart';

abstract class Outlet extends DiscreteOutput with BinaryOutput, BufferedOutput {
  static Outlet getRemote(Context context, String uuid) =>
      _$OutletRmi.getRemote(context, uuid);

  Outlet();
  Outlet._();
  toggle() => state = state == ON ? OFF : ON;
}
