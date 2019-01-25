import 'package:blackbird/blackbird.dart';
import 'device_manager.dart';
import 'dependency_builders.dart';

abstract class ConstructionManager extends DeviceManager {
  ConstructionManager(Device device, Blackbird blackbird)
      : super(device, blackbird);

  Object constructDependency(Dependency dependency) {
    if (dependency.isSuperModule) {
      return blackbird.implementDevice(dependency.module);
    } else if (dependency.isSubModule) {
      throw new Exception('not yet implemented');
    } else if (dependency.isRuntime) {
      return constructRuntimeDependency(dependency);
    } else {
      throw new Exception();
    }
  }

  Object constructRuntimeDependency(Dependency dependency) {
    Object result;

    for (DependencyBuilder builder in blackbird.dependencyBuilders) {
      try {
        result = builder.build(dependency);
        break;
      } on Exception {
        // relatively fine, TODO logging though
      }
    }

    if (result == null) {
      throw new Exception(
          'no builder succeeded for ${dependency.name} on $device');
    }

    return result;
  }

  Future<Object> constructModule(Dependency dependency) async {
    return await blackbird.implementDevice(dependency.module);
  }

  Future<Device> constructImplementation() async {
    ConstructionInfoException info;
    try {
      device.implementation(null);
    } on ConstructionInfoException catch (e) {
      info = e;
    }

    Map<Symbol, Object> dependencies = {};
    var list = info.dependencies.map((d) async {
      Object value;
      if (d.name == #host) {
        value = blackbird.localDevice;
      } else if (d.isModule) {
        value = await constructModule(d);
      } else if (d.isRuntime) {
        value = await constructDependency(d);
      }
      dependencies.putIfAbsent(d.name, () => value);
    }).toList();

    await Future.wait(list);

    return device.implementation(dependencies);
  }
}

/// Collects the dependency information for a device implementation
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

/// Information on a device implementation dependency
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
