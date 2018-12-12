import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'package:source_gen_class_visitor/class_visitor.dart';
import 'package:source_gen_class_visitor/helper.dart';
import 'package:source_gen_class_visitor/output_visitor.dart';
import 'package:source_gen_class_visitor/override_visitor.dart';
import 'member_identifier.dart';

import 'dart:async';

abstract class BasicDeviceVisitor extends ClassVisitor {
  BasicDeviceVisitor(ClassElement element) : super(element);

  List<Element> get runtimeDependencies => allClassChildren(classElement)
      .where((e) =>
          e.isPublic && e is! ConstructorElement && isRuntimeDependency(e))
      .toList();
  List<Element> get properties => allClassChildren(classElement)
      .where((e) =>
          e.isPublic && e is! ConstructorElement && isRuntimeDependency(e))
      .toList();
  List<Element> get modules => allClassChildren(classElement)
      .where((e) => e.isPublic && e is! ConstructorElement && isModule(e))
      .toList();
  List<Element> get executables => allClassChildren(classElement)
      .where((e) => e.isPublic && e is! ConstructorElement && isExecutive(e))
      .toList();

  @override
  visitFieldElement(FieldElement element) async {
    switch (identify(element)) {
      case DeviceMemberType.property:
        return visitPropertyField(element);
      case DeviceMemberType.module:
        return visitModuleField(element);
      default:
        if (!element.isSynthetic)
          throw new Exception('error in identify or visitor');
        else
          return '';
    }
  }

  @override
  visitPropertyAccessorElement(PropertyAccessorElement element) async {
    if (element.isPrivate) return '';
    switch (identify(element)) {
      case DeviceMemberType.property:
        return visitPropertyAccessor(element);
      case DeviceMemberType.runtime:
        return visitRuntimeAccessor(element);
      case DeviceMemberType.executive:
        return visitExecutiveAccessor(element);
      case DeviceMemberType.module:
        return visitModuleAccessor(element);
    }
  }

  Future<String> visitPropertyAccessor(PropertyAccessorElement element) async {
    if (element.isSetter) return visitPropertySetter(element);
    if (element.isGetter) return visitPropertyGetter(element);
  }

  Future<String> visitRuntimeAccessor(PropertyAccessorElement element) async {
    if (element.isSetter)
      throw new Exception('runtime dependencys cannot be written');
    if (element.isGetter) return visitRuntimeGetter(element);
  }

  Future<String> visitModuleAccessor(PropertyAccessorElement element) async {
    if (element.isSetter) return visitModuleSetter(element);
    if (element.isGetter) return visitModuleGetter(element);
  }

  Future<String> visitExecutiveAccessor(PropertyAccessorElement element) async {
    if (element.isSetter) return visitExecutiveSetter(element);
    if (element.isGetter) return visitExecutiveGetter(element);
  }

  @override
  visitMethodElement(MethodElement element) async {
    if (element.isStatic) return '';
    if (element.isOperator) return '';
    if (element.isPrivate) return '';

    switch (identify(element)) {
      case DeviceMemberType.executive:
        return visitExecutiveMethod(element);
      default:
        throw new Exception('error in identify or visitor');
    }
  }

  FutureOr<String> visitPropertyGetter(PropertyAccessorElement element);
  FutureOr<String> visitPropertySetter(PropertyAccessorElement element);
  FutureOr<String> visitPropertyField(FieldElement element);

  FutureOr<String> visitRuntimeGetter(PropertyAccessorElement element);

  FutureOr<String> visitExecutiveMethod(MethodElement element);
  FutureOr<String> visitExecutiveGetter(PropertyAccessorElement element);
  FutureOr<String> visitExecutiveSetter(PropertyAccessorElement element);

  FutureOr<String> visitModuleField(FieldElement element);
  FutureOr<String> visitModuleGetter(PropertyAccessorElement element);
  FutureOr<String> visitModuleSetter(PropertyAccessorElement element);
}
