import 'package:rmi/remote_method_invocation.dart';
// import '../manager/device_manager.dart';
import 'package:blackbird/blackbird.dart';
import 'package:rmi/proxy.dart';

part 'device.g.dart';

class Property {
  const Property();
}

class Runtime {
  const Runtime();
}

class Executive {
  const Executive();
}

abstract class Device implements RmiTarget {
  Device._();
  Device implementation(Map<Symbol, Object> dependencies);
  static Device getRemote(Context context, String uuid) =>
      _$DeviceRmi.getRemote(context, uuid);

  @Runtime()
  Host get host;
}

abstract class Host implements Device {
  Host._();
  factory Host.device() => _$HostDevice();

  static Host getRemote(Context context, String uuid) =>
      _$HostRmi.getRemote(context, uuid);
}

class ConstructionInfoException implements Exception {
  final Map<Symbol, Type> types;
  final Map<Symbol, List<Object>> annotations;
  ConstructionInfoException(this.types, this.annotations);
  @override
  String toString() {
    return 'ConstructionInfoException';
  }
}
