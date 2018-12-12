import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:source_gen/src/utils.dart';

import 'package:source_gen_class_visitor/class_visitor.dart';
import 'package:source_gen_class_visitor/helper.dart';
import 'package:source_gen_class_visitor/output_visitor.dart';
import 'package:source_gen_class_visitor/override_visitor.dart';
import 'device_class.dart';
import 'super_class.dart';
import 'implementation_class.dart';
import 'package:blackbird/device.dart';

enum DeviceMemberType { property, runtime, executive, module }

bool isRuntimeDependency(Element e) => identify(e) == DeviceMemberType.runtime;
bool isProperty(Element e) => identify(e) == DeviceMemberType.property;
bool isModule(Element e) => identify(e) == DeviceMemberType.module;
bool isExecutive(Element e) => identify(e) == DeviceMemberType.executive;

DeviceMemberType identify(Element element) {
  if (element.isPrivate)
    throw new Exception(
        'element is not consumed by the device generator [$element]');
  if (element is ConstructorElement)
    throw new Exception(
        'element is not consumed by the device generator [$element]');

  if (element is MethodElement) {
    return DeviceMemberType.executive;
  }

  FieldElement field;
  if (element is FieldElement) {
    field = element;
  } else {
    ClassElement classElement = element.enclosingElement as ClassElement;
    field = classElement.fields.firstWhere(
        (f) => f.displayName == element.displayName,
        orElse: () => null);

    if (field == null) {
      print(
          'asd;lfkj;asldfjl;kasfj;klsdaj;lkljs $element, ${element.runtimeType}');
      (element.enclosingElement as ClassElement)
          .fields
          .forEach((e) => print('field: $e'));
    }
  }

  PropertyAccessorElement getter = field.getter;
  PropertyAccessorElement setter = field.setter;
  bool hasGetter = field.getter != null;
  bool hasSetter = field.setter != null;

  bool _annotatedAs<T>() {
    check(Element e) => TypeChecker.fromRuntime(T).annotationsOf(e).isNotEmpty;
    bool result = check(field);
    if (hasGetter) result |= check(getter);
    if (hasSetter) result |= check(setter);
    return result;
  }

  DeviceMemberType _checkAnnotations() {
    bool p = _annotatedAs<Property>();
    bool r = _annotatedAs<Runtime>();
    bool e = _annotatedAs<Executive>();

    int s = (p ? 1 : 0) + (r ? 1 : 0) + (e ? 1 : 0);
    if (s > 1)
      throw new Exception(
          'A classmember must be a distinct device member type [$element]');

    if (p) return DeviceMemberType.property;
    if (r) return DeviceMemberType.runtime;
    if (e) return DeviceMemberType.executive;
    return null;
  }

  if (_checkAnnotations() != null) return _checkAnnotations();

  if (field != null && !field.isSynthetic) {
    if (_isDevice(field.type)) {
      if (field.getter == null || field.setter == null) {
        throw new Exception('modules must be read/write [$element]');
      }

      return DeviceMemberType.module;
    }

    if (field.getter != null && field.setter != null) {
      return DeviceMemberType.property;
    }

    if (field.getter != null && field.getter.isAbstract) {
      return DeviceMemberType.runtime;
    }

    if (field.setter != null && !field.setter.isAbstract) {
      return DeviceMemberType.executive;
    }
  }

  if (element is FieldElement) {
    element = field.getter ?? field.setter; // TODO ambigious
  }

  if (element is PropertyAccessorElement) {
    PropertyAccessorElement property = element;
    if (property.isGetter && _isDevice(property.returnType)) {
      throw new Exception(
          'provide device modules only by field, not by manual getter or setters [$element]');
    }

    //TODO property getter
    if (property.isGetter && property.isAbstract)
      return DeviceMemberType.runtime;
    if (property.isGetter && !property.isAbstract)
      return DeviceMemberType.executive;
    if (property.isSetter)
      return DeviceMemberType.executive; // untypical but only reasonable
  }

  throw new Exception('not identifiable $element');
}

bool _isDevice(DartType type) {
  return TypeChecker.fromRuntime(Device).isAssignableFromType(type);
}
