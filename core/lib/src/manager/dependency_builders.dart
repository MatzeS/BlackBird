import 'package:blackbird/device.dart';

abstract class DependencyBuilder {
  Object build(Dependency dependency);
}

abstract class FilteredDependencyBuilder<D, R> extends DependencyBuilder {
  List<String> producedTypes;

  bool filterDevice(D device) => true;
  bool filterType(List<String> type) => true;
  bool filterSymbol(Symbol symbol) => true;
  bool filterAnnotations(List<Object> annotations) => true;

  @override
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

    if (!producedTypes.contains(dependency.type.first)) {
      throw new Exception('does not produce this type');
    }

    if (!filterType(dependency.type)) {
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
    A annotation = dependency.findAnnotation<A>();

    if (annotation == null) {
      throw new Exception('no fitting annotation present ($A)');
    }

    if (!filterAnnotation(annotation)) {
      throw new Exception('annotation $annotation does not fit');
    }

    return buildFromAnnotation(dependency, annotation);
  }

  R buildFromAnnotation(Dependency dependency, A annotation);
}
