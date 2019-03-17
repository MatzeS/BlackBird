import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:source_gen/source_gen.dart';
import 'package:source_gen_helpers/class/util.dart';
import 'package:build/build.dart';

bool isProperty(Element e) => identify(e) == DeviceMemberType.property;
bool isRuntimeDependency(Element e) => identify(e) == DeviceMemberType.runtime;
bool isSubModule(Element e) => identify(e) == DeviceMemberType.submodule;
bool isExecutive(Element e) => identify(e) == DeviceMemberType.executive;
bool isIgnored(Element e) => identify(e) == DeviceMemberType.ignored;

enum DeviceMemberType { property, runtime, executive, submodule, ignored }

class AnnotationUrl {
  static const String property = 'asset:blackbird/lib/src/device.dart#Property';
  static const String runtime = 'asset:blackbird/lib/src/device.dart#Runtime';
  static const String executive =
      'asset:blackbird/lib/src/device.dart#Executive';
  static const String submodule =
      'asset:blackbird/lib/src/device.dart#SubModule';
  static const String ignore = 'asset:blackbird/lib/src/device.dart#Ignore';
}

List<DartObject> _getAnnotations(Element element, String url) =>
    TypeChecker.fromUrl(url).annotationsOf(element).toList();

List<DartObject> _getAllAnnotations(Element element) {
  List<DartObject> list = [];
  list.addAll(_getAnnotations(element, AnnotationUrl.property));
  list.addAll(_getAnnotations(element, AnnotationUrl.runtime));
  list.addAll(_getAnnotations(element, AnnotationUrl.executive));
  list.addAll(_getAnnotations(element, AnnotationUrl.submodule));
  list.addAll(_getAnnotations(element, AnnotationUrl.ignore));
  return list;
}

bool _annotationIs(DartObject annotation, String url) =>
    annotation != null &&
    TypeChecker.fromUrl(url).isAssignableFromType(annotation.type);

DeviceMemberType _typeByAnnotation(Element element) {
  var annotation = _getAllAnnotations(element).single;
  return _mapAnnotationToType(annotation);
}

DeviceMemberType _mapAnnotationToType(DartObject annotation) {
  if (_annotationIs(annotation, AnnotationUrl.property))
    return DeviceMemberType.property;
  if (_annotationIs(annotation, AnnotationUrl.runtime))
    return DeviceMemberType.runtime;
  if (_annotationIs(annotation, AnnotationUrl.executive))
    return DeviceMemberType.executive;
  if (_annotationIs(annotation, AnnotationUrl.submodule))
    return DeviceMemberType.submodule;
  if (_annotationIs(annotation, AnnotationUrl.ignore))
    return DeviceMemberType.ignored;

  throw new Exception('cannot identify element by annotation: $annotation');
}

DeviceMemberType identify(Element element) {
  if (element is ExecutableElement && element.isStatic)
    throw new Exception("static elements cannot be device members");
  if (element is! MethodElement &&
      element is! PropertyAccessorElement &&
      element is! FieldElement)
    throw new Exception(
        'element is not consumed by the device generator [$element], expect field, method or proeprty accessor');
  if (element.isPrivate)
    throw new Exception('element is not public [$element]');
  if (element is ExecutableElement && element.isStatic)
    throw new Exception('element is static [$element]');

  MethodElement method;
  ExecutableElement executable;
  FieldElement field;
  PropertyAccessorElement accessor;
  PropertyAccessorElement corresponding;

  if (element is MethodElement) method = element;
  if (element is FieldElement) field = element;
  if (element is PropertyAccessorElement) accessor = element;

  // fill corresponders
  if (element is FieldElement) accessor = element.getter ?? element.setter;
  if (element is PropertyAccessorElement) {
    field = (element.enclosingElement as ClassElement)
        .getField(element.displayName);
  }

  if (accessor != null) {
    if (accessor.isSetter) corresponding = accessor.correspondingGetter;
    if (accessor.isGetter) corresponding = accessor.correspondingSetter;
  }

  // check annotation consistency between accessor and corresponding
  if (corresponding != null) {
    if (_getAllAnnotations(accessor).length !=
        _getAllAnnotations(corresponding).length) {
      throw new Exception(
          'accessor $accessor and corresponding are not equally annotated, one of which has none');
    }

    if (_getAllAnnotations(accessor).isNotEmpty &&
        _typeByAnnotation(accessor) != _typeByAnnotation(corresponding)) {
      throw Exception(
          '$element and corresponding $corresponding are illegaly, differently annotated');
    }
  }

  executable = accessor ?? method;

  // Sort out ignore
  var annotations = [];
  if (field != null) annotations.addAll(_getAllAnnotations(field));
  if (executable != null) annotations.addAll(_getAllAnnotations(executable));

  if (annotations.length > 1) {
    throw new Exception('device member $element cannot be multiply annotated');
  }
  var annotation = annotations.firstWhere((x) => true, orElse: () => null);

  if (_annotationIs(annotation, AnnotationUrl.ignore)) {
    return DeviceMemberType.ignored;
  }

  // if annotated check for consistency

  // sort out module stuff
  bool deviceParameter = executable.parameters
      .where((p) =>
          TypeChecker.fromUrl('asset:blackbird/lib/src/device.dart#Device')
              .isAssignableFromType(p.type))
      .isNotEmpty;
  bool returnsDevice = !executable.returnType.isVoid &&
      TypeChecker.fromUrl('asset:blackbird/lib/src/device.dart#Device')
          .isAssignableFromType(executable.returnType);
  bool isSubmodule = deviceParameter || returnsDevice;

  if (annotation != null) {
    DeviceMemberType type = _mapAnnotationToType(annotation);
    if (type == DeviceMemberType.submodule) {
      if (executable.returnType.isVoid)
        throw new Exception('submodule accessor/method cannot be void');

      return DeviceMemberType.submodule;
    } else if (type == DeviceMemberType.property) {
      // property basically allows everything
      return DeviceMemberType.property;
    } else if (type == DeviceMemberType.runtime) {
      if (executable.returnType.isVoid)
        throw new Exception('runtime dependencies cannot be void');
      if (element is PropertyAccessorElement &&
          (element.isSetter || element.correspondingSetter != null))
        throw new Exception(
            'there exists a setter for runtime dependency $element');

      return DeviceMemberType.runtime;
    } else if (type == DeviceMemberType.executive) {
      // executive basically allows everything
      return DeviceMemberType.executive;
    }
  }

  // not annotated, assume type

  if (isSubmodule) {
    //log.fine('$element is not annotated, assuming submodule');

    if (element is MethodElement)
      throw Exception(
          'submodules cannot be passed by methods, only by property accessors [$element]');
    if (accessor == null || corresponding == null)
      throw new Exception(
          'submodules must be settable and gettable [$element]');
    if ((!accessor.isSynthetic && !accessor.isAbstract) ||
        (!corresponding.isSynthetic && !corresponding.isAbstract))
      throw new Exception(
          'submodules is solely implemented by source generation and must be abstract [$element]');

    return DeviceMemberType.submodule;
  }

  if (element is MethodElement) {
    //log.fine('Method $element is not annotated, assuming executive');
    return DeviceMemberType.executive;
  }

  // element is property accessor, already available in accessor variable

  // abstract getter without setter => runtime
  if (accessor.isGetter && accessor.isAbstract && corresponding == null) {
    //log.fine('$element is not annotated, assuming runtime');
    return DeviceMemberType.runtime;
  }

  if (!executable.isSynthetic && !executable.isAbstract) {
    //log.fine('$element is not annotated, assuming executive');
    return DeviceMemberType.executive;
  }

  if (accessor != null && corresponding != null) {
    //log.fine('Method $element is not annotated, assuming property');
    return DeviceMemberType.property;
  }

  throw new Exception('not identifiable $element, ${element.enclosingElement}');
}

bool _isDevice(DartType type) {
  return TypeChecker.fromUrl('asset:blackbird/lib/src/device.dart#Device')
      .isAssignableFromType(type);
}

bool _typeImplies<T>(e, test(T t)) => e is! T || (e is T && test(e));
List<Element> _relevantMembers(ClassElement e) => filterConcreteElements(
        e, allClassMember(e))
    .where((e) => e.isPublic && e is! ConstructorElement)
    .where((e) => _typeImplies<ClassMemberElement>(e, (e) => !e.isStatic))
    .where((e) => _typeImplies<PropertyAccessorElement>(e, (e) => !e.isStatic))
    .toList();

List<Element> getRuntimeDependencies(ClassElement classElement) =>
    _relevantMembers(classElement)
        .where((e) => isRuntimeDependency(e))
        .toList();
List<Element> getProperties(ClassElement classElement) =>
    _relevantMembers(classElement).where((e) => isProperty(e)).toList();
List<Element> getSubModules(ClassElement classElement) =>
    _relevantMembers(classElement).where((e) => isSubModule(e)).toList();

List<Element> getExecutables(ClassElement classElement) =>
    filterConcreteElements(classElement, allExecutables(classElement))
        .where((e) => e.isPublic && e is! ConstructorElement)
        .where((e) => !e.isStatic)
        .where((e) => isExecutive(e))
        .toList();

bool deviceClassIsAbstract(ClassElement classElement) {
  var c = classElement;

  if (getExecutables(classElement).isEmpty) return false;
  return (getExecutables(classElement)).any((e) {
    // if (!isConcrete(e, c)) print(e);
    return !isConcrete(e, c);
  });
}

bool deviceClassIsAbstract2(ClassElement e) {
  var list = [];
  list.addAll(e.accessors);
  list.addAll(e.methods);

  list = list.where((e) => e.isPublic && !e.isStatic).toList();
}
