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

class SubModule {
  const SubModule();
}

// class SuperModule {
//   const SuperModule();
// }

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
  List<Dependency> dependencies;
  ConstructionInfoException([this.dependencies]) {
    if (dependencies == null) dependencies = [];
  }

  @override
  String toString() {
    return 'ConstructionInfoException';
  }

  @override
  Dependency operator [](Object key) {
    return dependencies.firstWhere((d) => d.name == key);
  }
}

class Dependency {
  Device device;
  Symbol name;
  List<String> type;
  Device module;

  List<Object> annotations;
  Dependency(
      {this.device, this.name, this.type, this.module, this.annotations}) {
    if (annotations == null) annotations = [];
  }

  A findAnnotation<A>([bool filter(A annotation)]) =>
      annotations.firstWhere((a) => a is A && (filter == null || filter(a)),
          orElse: () => null);

  bool get isModule => module != null;
  bool get isRuntime => !isModule;
  bool get isSuperModule =>
      module is Device && findAnnotation<SubModule>() == null;
  bool get isSubModule =>
      module is Device && findAnnotation<SubModule>() != null;
}
