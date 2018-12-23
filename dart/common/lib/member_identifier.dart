import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:source_gen/source_gen.dart';
import 'package:source_gen_helpers/class/util.dart';

enum DeviceMemberType { property, runtime, executive, module, ignored }

bool isRuntimeDependency(Element e) => identify(e) == DeviceMemberType.runtime;
bool isProperty(Element e) => identify(e) == DeviceMemberType.property;
bool isModule(Element e) => identify(e) == DeviceMemberType.module;
bool isExecutive(Element e) => identify(e) == DeviceMemberType.executive;
bool isIgnored(Element e) => identify(e) == DeviceMemberType.ignored;

DeviceMemberType identify(Element element) {
  if (element.isPrivate)
    throw new Exception(
        'element is not consumed by the device generator [$element] , ${element.runtimeType}');
  if (element is ConstructorElement)
    throw new Exception(
        'element is not consumed by the device generator [$element]');

  if (TypeChecker.fromUrl('asset:blackbird/lib/src/device.dart#Ignore')
      .annotationsOf(element)
      .isNotEmpty) return DeviceMemberType.ignored;

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
  }

  PropertyAccessorElement getter = field.getter;
  PropertyAccessorElement setter = field.setter;
  bool hasGetter = field.getter != null;
  bool hasSetter = field.setter != null;

  bool _annotatedAs(String url) {
    check(Element e) => TypeChecker.fromUrl(url).annotationsOf(e).isNotEmpty;
    bool result = check(field);
    if (hasGetter) result |= check(getter);
    if (hasSetter) result |= check(setter);
    return result;
  }

  DeviceMemberType _checkAnnotations() {
    bool p = _annotatedAs('asset:blackbird/lib/src/device.dart#Property');
    bool r = _annotatedAs('asset:blackbird/lib/src/device.dart#Runtime');
    bool e = _annotatedAs('asset:blackbird/lib/src/device.dart#Executive');
    bool i = _annotatedAs('asset:blackbird/lib/src/device.dart#Ignore');

    int s = (p ? 1 : 0) + (r ? 1 : 0) + (e ? 1 : 0) + (i ? 1 : 0);
    if (s > 1)
      throw new Exception(
          'A classmember must be a distinct device member type [$element]');

    if (p) return DeviceMemberType.property;
    if (r) return DeviceMemberType.runtime;
    if (e) return DeviceMemberType.executive;
    if (i) return DeviceMemberType.ignored;
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
  return TypeChecker.fromUrl('asset:blackbird/lib/src/device.dart#Device')
      .isAssignableFromType(type);
}

List<Element> getRuntimeDependencies(ClassElement classElement) =>
    filterConcreteElements(classElement, allClassMember(classElement))
        .where((e) => e.isPublic && e is! ConstructorElement)
        .where((e) => isRuntimeDependency(e))
        .toList();
List<Element> getProperties(ClassElement classElement) =>
    filterConcreteElements(classElement, allClassMember(classElement))
        .where((e) => e.isPublic && e is! ConstructorElement)
        .where((e) => isProperty(e))
        .toList();
List<Element> getModules(ClassElement classElement) =>
    filterConcreteElements(classElement, allClassMember(classElement))
        .where((e) => e.isPublic && e is! ConstructorElement)
        .where((e) => isModule(e))
        .toList();
List<Element> getExecutables(ClassElement classElement) =>
    filterConcreteElements(classElement, allClassMember(classElement))
        .where((e) => e.isPublic && e is! ConstructorElement)
        .where((e) => isExecutive(e))
        .toList();

bool deviceClassIsAbstract(ClassElement classElement) {
  var c = classElement;

  if (getExecutables(classElement).isEmpty) return false;
  return (getExecutables(classElement)).any((e) {
    if (e.displayName == 'implementation') return false;
    if (e.displayName == 'provideRemote') return false;
    if (e.displayName == 'getRemote') return false;
    if (e.displayName == 'invoke') return false;

    if (e is FieldElement) return false;
    return !isConcrete(e, c);
  });
}

bool deviceClassIsAbstract2(ClassElement e) {
  var list = [];
  list.addAll(e.accessors);
  list.addAll(e.methods);

  list = list.where((e) => e.isPublic && !e.isStatic).toList();
}
