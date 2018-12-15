import 'device_manager.dart';
import 'package:blackbird/device.dart';
import 'dependency_builders.dart';
import 'package:blackbird/blackbird.dart';

List<DependencyBuilder> dependencyBuilders = [];

addDependencyBuilder(DependencyBuilder builder) =>
    dependencyBuilders.add(builder);

abstract class ConstructionManager extends DeviceManager {
  ConstructionManager(Device device) : super(device);

  Object constructDependency(Dependency dependency) {
    if (dependency.isSuperModule) {
      return Blackbird().implementDevice(dependency.module);
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
      throw new Exception('no builder succeeded');
    }

    return result;
  }

  Device constructDevice() {
    ConstructionInfoException info;
    try {
      device.implementation(null);
    } on ConstructionInfoException catch (e) {
      info = e;
    }

    Map<Symbol, Object> dependencies = {};
    info.dependencies.forEach((d) {
      Object value = constructDependency(d);
      dependencies.putIfAbsent(d.name, () => value);
    });

    return device.implementation(dependencies);
  }
}
