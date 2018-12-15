import 'package:test/test.dart';
import 'package:blackbird/device.dart';
import '../device_generator/simple_device.dart';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:blackbird/src/manager/dependency_builders.dart';
import 'package:blackbird/src/manager/construction.dart';
import 'builders.dart';
import 'package:blackbird/src/manager/construction.dart';

int significantNumber = 123456789;

singleDependencyBuilder(DependencyBuilder b) {
  dependencyBuilders.removeWhere((b) => true);
  dependencyBuilders.add(b);
}

class Manager extends ConstructionManager {
  Manager(Device device) : super(device);
  @override
  Host get currentHost => throw new Exception('not implemented for test');
  @override
  Device get implementDevice => throw new Exception('not implemented for test');
  @override
  Device get interfaceDevice => throw new Exception('not implemented for test');
}

main() {
  group('dependency injection', () {
    SimpleDevice device;
    ConstructionManager manager;
    Dependency dependency;
    setUp(() {
      device = new SimpleDevice.device();
      manager = new Manager(device);
      dependency = new Dependency(
          name: #aRuntimeDependency,
          type: ["dart:core#int", "dart:core#num", "dart:core#Object"],
          device: device,
          module: null);
      dependency.annotations.add(SomeAnnotation('text', const {'asdf': 123}));
    });
    test('call', () {
      CallBuilder b = new CallBuilder(significantNumber);
      singleDependencyBuilder(b);

      Object result = manager.constructDependency(dependency);

      expect(b.calls.length, 1);
      expect(result, significantNumber);
    });

    checkNotTriggered(DependencyBuilder b) {
      singleDependencyBuilder(b);
      expect(() => manager.constructDependency(dependency), throwsException);
    }

    test('FilterCorrectDeviceWrongReturn', () {
      checkNotTriggered(new FilterCorrectDeviceWrongReturn());
    });
    test('FilterWrongDeviceCorrectReturn', () {
      checkNotTriggered(new FilterWrongDeviceCorrectReturn());
    });
    test('FilterWrongDeviceWrongReturn', () {
      checkNotTriggered(new FilterWrongDeviceWrongReturn());
    });
    test('FilterCorrectDeviceCorrectReturn', () {
      FilterCorrectDeviceCorrectReturn b =
          new FilterCorrectDeviceCorrectReturn();
      singleDependencyBuilder(b);
      manager.constructDependency(dependency);
      expect(b.triggered, true);
    });

    test('Manual Filter default true', () {
      // this test just ensures we are not building by default
      ManualFilter b = new ManualFilter();
      singleDependencyBuilder(b);
      manager.constructDependency(dependency);
      expect(b.triggered, true);
    });
    test('Device filter active', () {
      ManualFilter b = new ManualFilter();
      b.deviceFilter = (Device device) => false;
      checkNotTriggered(b);
    });
    test('Type filter active', () {
      ManualFilter b = new ManualFilter();
      b.typeFilter = (List<String> type) => false;
      checkNotTriggered(b);
    });
    test('Annotations filter active', () {
      ManualFilter b = new ManualFilter();
      b.annotationsFilter = (List<Object> a) => false;
      checkNotTriggered(b);
    });
    test('Specific annotation builder', () {
      RuntimeDependencyBuilder b =
          new RuntimeDependencyBuilder(significantNumber);
      singleDependencyBuilder(b);

      Object result = manager.constructDependency(dependency);
      expect(result, significantNumber);
      expect(b.annotation, SomeAnnotation('text', {'asdf': 123}));
    });
    test('Specific annotation builder, annotation filter', () {
      RuntimeDependencyBuilder b =
          new RuntimeDependencyBuilder(significantNumber);
      b.annotationFilter = (SomeAnnotation a) => false;
      checkNotTriggered(b);
    });
  });
}
