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

class Ignore {
  const Ignore();
}

// class SuperModule {
//   const SuperModule();
// }

abstract class Device implements RmiTarget {
  Device();

  @Ignore()
  Blackbird _blackbird;

  @Ignore()
  Blackbird get blackbird {
    if (_blackbird == null) {
      throw new Exception('device is not attached to blackbird instnace');
    }

    return _blackbird;
  }

  @Ignore()
  set blackbird(Blackbird blackbird) {
    if (blackbird == _blackbird) return;

    if (_blackbird != null) {
      throw new Exception(
          'device already attached to another blackbird instance');
    }

    _blackbird = blackbird;
  }

  @Runtime()
  Host get host;

  Device implementation(Map<Symbol, Object> dependencies);

  //TODO remove
  static Device getRemote(Context context, String uuid) =>
      _$DeviceRmi.getRemote(context, uuid);
}

abstract class Host extends Device {
  Host();
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
  bool isModule;

  List<Object> annotations;
  Dependency(
      {this.device,
      this.name,
      this.type,
      this.module,
      this.isModule,
      this.annotations}) {
    if (annotations == null) annotations = [];
  }

  A findAnnotation<A>([bool filter(A annotation)]) =>
      annotations.firstWhere((a) => a is A && (filter == null || filter(a)),
          orElse: () => null);

  bool get isRuntime => !isModule;
  bool get isSuperModule =>
      module is Device && findAnnotation<SubModule>() == null;
  bool get isSubModule =>
      module is Device && findAnnotation<SubModule>() != null;
}
