import 'device_manager.dart';
import 'package:blackbird/device.dart';
import 'dependency_builders.dart';

List<DependencyBuilder> dependencyBuilders = [];

bool isSuperModule(Type type, List<Object> annotations) {
  type is Device;
}

abstract class ConstructionManager extends DeviceManager {
  ConstructionManager(Device device) : super(device);

  Object constructDependency(Dependency dependency) {
    if (dependency.isRuntime) return constructRuntimeDependency(dependency);
    //TODO
    throw new Exception();
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
