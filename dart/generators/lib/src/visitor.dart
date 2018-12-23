import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'package:source_gen_helpers/class/class_visitor.dart';
import 'package:source_gen_helpers/class/util.dart';
import 'package:source_gen_helpers/class/output_visitor.dart';
import 'package:source_gen_helpers/class/override_visitor.dart';

import 'package:blackbird_common/member_identifier.dart';
import 'dart:async';

abstract class BasicDeviceVisitor<T> extends ClassVisitor<FutureOr<T>> {
  Future<List<Element>> get runtimeDependencies async =>
      getRuntimeDependencies(await classElement);
  Future<List<Element>> get properties async =>
      getProperties(await classElement);
  Future<List<Element>> get modules async => getModules(await classElement);
  Future<List<Element>> get executables async =>
      getExecutables(await classElement);

  @override
  visitFieldElement(FieldElement element) async {
    switch (identify(element)) {
      case DeviceMemberType.property:
        return visitPropertyField(element);
      case DeviceMemberType.module:
        return visitModuleField(element);
      default:
        print('this is a unvisited field $element');
        if (!element.isSynthetic)
          throw new Exception('error in identify or visitor');
        else
          return null;
    }
  }

  @override
  visitPropertyAccessorElement(PropertyAccessorElement element) async {
    switch (identify(element)) {
      case DeviceMemberType.property:
        return visitPropertyAccessor(element);
      case DeviceMemberType.runtime:
        return visitRuntimeAccessor(element);
      case DeviceMemberType.executive:
        return visitExecutiveAccessor(element);
      case DeviceMemberType.module:
        return visitModuleAccessor(element);
      case DeviceMemberType.ignored:
        return null;
    }
    throw new Exception('unreached');
  }

  FutureOr<T> visitPropertyAccessor(PropertyAccessorElement element) async {
    if (element.isSetter) return visitPropertySetter(element);
    if (element.isGetter) return visitPropertyGetter(element);
    throw new Exception('invalid argument');
  }

  FutureOr<T> visitRuntimeAccessor(PropertyAccessorElement element) async {
    if (element.isSetter)
      throw new Exception('runtime dependencys cannot be written');
    if (element.isGetter) return visitRuntimeGetter(element);
    throw new Exception('invalid argument');
  }

  FutureOr<T> visitModuleAccessor(PropertyAccessorElement element) async {
    if (element.isSetter) return visitModuleSetter(element);
    if (element.isGetter) return visitModuleGetter(element);
    throw new Exception('invalid argument');
  }

  FutureOr<T> visitExecutiveAccessor(PropertyAccessorElement element) async {
    if (element.isSetter) return visitExecutiveSetter(element);
    if (element.isGetter) return visitExecutiveGetter(element);
    throw new Exception('invalid argument');
  }

  @override
  visitMethodElement(MethodElement element) async {
    switch (identify(element)) {
      case DeviceMemberType.executive:
        return visitExecutiveMethod(element);
      default:
        throw new Exception('error in identify or visitor');
    }
  }

  FutureOr<T> visitPropertyGetter(PropertyAccessorElement element);
  FutureOr<T> visitPropertySetter(PropertyAccessorElement element);
  FutureOr<T> visitPropertyField(FieldElement element);

  FutureOr<T> visitRuntimeGetter(PropertyAccessorElement element);

  FutureOr<T> visitExecutiveMethod(MethodElement element);
  FutureOr<T> visitExecutiveGetter(PropertyAccessorElement element);
  FutureOr<T> visitExecutiveSetter(PropertyAccessorElement element);

  FutureOr<T> visitModuleGetter(PropertyAccessorElement element);
  FutureOr<T> visitModuleSetter(PropertyAccessorElement element);
  FutureOr<T> visitModuleField(FieldElement element);
}
