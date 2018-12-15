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

part 'builders.g.dart';

class CallBuilder extends DependencyBuilder {
  List<Dependency> calls = [];
  Object returnValue;
  CallBuilder(this.returnValue);

  @override
  Object build(Dependency dependency) {
    calls.add(dependency);
    return returnValue;
  }
}

typedef bool TypeFilter(List<String> type);
typedef bool AnnotationsFilter(List<Object> annotations);
typedef bool DeviceFilter(Device device);
typedef bool SymbolFilter(Symbol symbol);
typedef bool AnnotationFilter<A>(A annotation);

class ManualFilter extends FilteredDependencyBuilder<SimpleDevice, int> {
  bool triggered = false;
  @override
  List<String> get producedTypes => _$ManualFilterTypes;

  TypeFilter typeFilter = (List<String> t) => true;
  AnnotationsFilter annotationsFilter = (List<Object> a) => true;
  DeviceFilter deviceFilter = (Device d) => true;
  SymbolFilter symbolFilter = (Symbol s) => true;

  @override
  bool filterAnnotations(List<Object> a) => annotationsFilter(a);
  @override
  bool filterDevice(SimpleDevice d) => deviceFilter(d);
  @override
  bool filterSymbol(Symbol s) => symbolFilter(s);
  @override
  bool filterType(List<String> t) => typeFilter(t);

  @override
  Object buildFiltered(Dependency dependency) => triggered = true;
}

class FilterCorrectDeviceWrongReturn
    extends FilteredDependencyBuilder<SimpleDevice, String> {
  bool triggered = false;
  @override
  List<String> get producedTypes => _$FilterCorrectDeviceWrongReturnTypes;
  @override
  Object buildFiltered(Dependency dependency) => triggered = true;
}

class FilterWrongDeviceWrongReturn
    extends FilteredDependencyBuilder<Device, String> {
  @override
  List<String> get producedTypes => _$FilterWrongDeviceWrongReturnTypes;
  @override
  Object buildFiltered(Dependency dependency) => null;
}

class FilterWrongDeviceCorrectReturn
    extends FilteredDependencyBuilder<Device, int> {
  @override
  List<String> get producedTypes => _$FilterWrongDeviceCorrectReturnTypes;
  @override
  Object buildFiltered(Dependency dependency) => null;
}

class FilterCorrectDeviceCorrectReturn
    extends FilteredDependencyBuilder<SimpleDevice, int> {
  bool triggered = false;
  @override
  List<String> get producedTypes => _$FilterCorrectDeviceCorrectReturnTypes;
  @override
  Object buildFiltered(Dependency dependency) => triggered = true;
}

class RuntimeDependencyBuilder
    extends SpecificAnnotationBuilder<SimpleDevice, int, SomeAnnotation> {
  @override
  List<String> get producedTypes => _$RuntimeDependencyBuilderTypes;
  int injection;
  Object annotation;
  AnnotationFilter<SomeAnnotation> annotationFilter;
  bool filterAnnotation(SomeAnnotation a) =>
      annotationFilter != null ? annotationFilter(a) : true;
  RuntimeDependencyBuilder(this.injection);
  @override
  buildFromAnnotation(Dependency dependency, SomeAnnotation annotation) {
    if (this.annotation != null) throw new Exception('called twice');
    this.annotation = annotation;
    return injection;
  }
}
