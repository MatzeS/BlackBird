import 'package:blackbird/device.dart';

abstract class DependencyBuilder {
  Object build(Dependency dependency);
}

abstract class FilteredDependencyBuilder<D, R> {
  List<String> producedTypes;

  bool filterDevice(D device) => true;
  bool filterType(String type) => true;
  bool filterSymbol(Symbol symbol) => true;
  bool filterAnnotations(List<Object> annotations) => true;

  Object build(Dependency dependency) {
    if (dependency.device is! D) {
      throw new Exception('does not consume this device');
    }

    if (!filterDevice(dependency.device as D)) {
      throw new Exception('does not consume this device, filtered');
    }

    if (!filterSymbol(dependency.name)) {
      throw new Exception('does not produce for this dependency');
    }

    if (!producedTypes.contains(dependency.type)) {
      throw new Exception('does not produce this type');
    }

    if (!filterAnnotations(dependency.annotations)) {
      throw new Exception('does not produce with this annotations');
    }

    return buildFiltered(dependency);
  }

  Object buildFiltered(Dependency dependency);
}

abstract class SpecificAnnotationBuilder<D, R, A>
    extends FilteredDependencyBuilder<D, R> {
  bool filterAnnotation(A annotation) => true;

  Object buildFiltered(Dependency dependency) {
    A annotation = dependency.annotations.firstWhere((a) => a is A, orElse: () {
      throw new Exception('has no fitting annotation for $A');
    });

    if (!filterAnnotation(annotation)) {
      throw new Exception('annotation $annotation does not fit');
    }

    return buildFromAnnotation(dependency, annotation);
  }

  buildFromAnnotation(Dependency dependency, A annotation);
}
