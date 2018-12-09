import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import '../source_gen/output_visitor.dart';
import '../source_gen/helper.dart';
import '../../blackbird.dart';

import 'dart:async';

abstract class BasicDeviceVisitor extends ClassVisitor {
  BasicDeviceVisitor(ClassElement element) : super(element);

  StringBuffer additionalMembers = new StringBuffer();

  Completer<List<ParameterElement>> deviceProperties = new Completer();
  //TODO
  Future<bool> isDeviceProperty(Element element) async =>
      (await deviceProperties.future)
          .map((p) => p.displayName)
          .contains(element.displayName);
  identifiyClassElement(Element element) async {
    if (isAnnotatedWith<RuntimeDependency>(element))
      return DeviceClassElement.runtime;

    if (await isDeviceProperty(element)) return DeviceClassElement.property;

    throw new Exception('cannot identify element');
  }

  @override
  visitConstructorElement(ConstructorElement element) async {
    if (element.isFactory) return '';
    //todo exactly one no arg constructor and public
    deviceProperties.complete(element.parameters);
  }

  @override
  visitMethodElement(MethodElement element) async {
    return generateMethod(element, visitExecutiveMethod(element));
  }

  @override
  visitPropertyAccessorElement(PropertyAccessorElement element) async {
    if (element.isSynthetic) return '';

    if (element.isSetter) return visitSetter(element);
    if (element.isGetter) return visitGetter(element);
  }

  @override
  visitFieldElement(FieldElement field) async {
    String setter = await visitSetter(field.setter, field);
    if (!field.setter.isSynthetic) setter = '';
    String getter = await visitGetter(field.getter, field);
    if (!field.getter.isSynthetic) getter = '';

    return (setter ?? '') + '\n' + (getter ?? '');
  }

  Future<String> visitGetter(PropertyAccessorElement element,
      [FieldElement field]) async {
    DeviceClassElement type = await identifiyClassElement(field ?? element);
    switch (type) {
      case DeviceClassElement.property:
        return generateMethod(element, visitPropertyGetter(element));
      case DeviceClassElement.runtime:
        return generateMethod(element, visitRuntimeGetter(element));
      case DeviceClassElement.executive:
        return generateMethod(element, visitExecutiveGetter(element));
    }
  }

  Future<String> visitSetter(PropertyAccessorElement element,
      [FieldElement field]) async {
    DeviceClassElement type = await identifiyClassElement(field ?? element);
    switch (type) {
      case DeviceClassElement.property:
        return generateMethod(element, visitPropertySetter(element));
      case DeviceClassElement.runtime:
        return generateMethod(element, visitRuntimeSetter(element));
      case DeviceClassElement.executive:
        return generateMethod(element, visitExecutiveSetter(element));
    }
  }

  FutureOr<String> visitPropertyGetter(PropertyAccessorElement element) =>
      _throw(element);
  FutureOr<String> visitPropertySetter(PropertyAccessorElement element) =>
      _throw(element);

  FutureOr<String> visitRuntimeGetter(PropertyAccessorElement element) =>
      _throw(element);
  FutureOr<String> visitRuntimeSetter(PropertyAccessorElement element) =>
      _throw(element);

  FutureOr<String> visitExecutiveMethod(MethodElement element) =>
      _throw(element);
  FutureOr<String> visitExecutiveGetter(PropertyAccessorElement element) =>
      _throw(element);
  FutureOr<String> visitExecutiveSetter(PropertyAccessorElement element) =>
      _throw(element);

  _throw(Element element) => throw new Exception(
      'Missing implementation of visit${element.runtimeType}');
}

Future<String> generateMethod(
    ExecutableElement element, FutureOr<String> body) async {
  String declaration = generateDeclaration(element);
  String bodyText = await body;
  if (bodyText.isEmpty) return '';
  String tail = methodTail(body);
  return '''$declaration $tail''';
}

String methodTail(String methodBody) {
  if (methodBody.isEmpty) return '';
  if (methodBody.contains('return'))
    return '{' + methodBody + ';}';
  else
    return '=> ' + methodBody + (methodBody.endsWith(';') ? '' : ';');
}
