import 'package:blackbird/blackbird.dart';
import 'device_manager.dart';
import 'dependency_builders.dart';

List<DependencyBuilder> dependencyBuilders = [];

//TODO remove
addDependencyBuilder(DependencyBuilder builder) =>
    dependencyBuilders.add(builder);

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

    for (DependencyBuilder builder in dependencyBuilders) {
      try {
        result = builder.build(dependency);
        break;
      } on Exception {
        // relatively fine, TODO logging though
      }
    }

    if (result == null) {
      throw new Exception('no builder succeeded for ${dependency.name}');
    }

    return result;
  }

  Object constructModule(Dependency dependency) {
    return blackbird.implementDevice(dependency.module);
  }

  Device constructImplementation() {
    ConstructionInfoException info;
    try {
      device.implementation(null);
    } on ConstructionInfoException catch (e) {
      info = e;
    }

    Map<Symbol, Object> dependencies = {};
    info.dependencies.forEach((d) {
      Object value;
      if (d.name == #host) {
        value = blackbird.localDevice;
      } else if (d.isModule) {
        value = constructModule(d);
      } else if (d.isRuntime) {
        value = constructDependency(d);
      }
      dependencies.putIfAbsent(d.name, () => value);
    });

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
