import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'package:source_gen_class_visitor/class_visitor.dart';
import 'package:source_gen_class_visitor/helper.dart';
import 'package:source_gen_class_visitor/output_visitor.dart';
import 'package:source_gen_class_visitor/override_visitor.dart';
import 'visitor.dart';
import 'package:tuple/tuple.dart';

import '../util/distinct.dart';
import 'dart:async';

class ImplementationVisitor extends BasicDeviceVisitor {
  ImplementationVisitor(ClassElement element) : super(element);

  static Tuple2<DartType, String> harmonize(Element e) {
    if (e is ExecutableElement) {
      return Tuple2(e.returnType, e.displayName);
    } else if (e is FieldElement) {
      return Tuple2(e.type, e.displayName);
    } else {
      throw new Exception('could not harmonize $e');
    }
  }

  visitClassElement(ClassElement element) async {
    classDeclaration.complete(
        'class _\$${element.name}Implementation extends ${element.name}');

    // construction info
    StringBuffer constructionInfo = new StringBuffer();
    constructionInfo.write('''
          if(parameters == null){
          Map<Symbol, Type> types = {};  
          Map<Symbol, List<Object>> annotations = {};  
    ''');

    List<Element> list = [];
    list.addAll(runtimeDependencies);
    list.addAll(modules);
    list.where((e) => !e.isSynthetic).map((e) => harmonize(e)).forEach((e) {
      // register type
      constructionInfo.write('types.putIfAbsent(#${e.item2}, ()=>${e.item1});');
      // put empty list to annotation map
      constructionInfo.write('annotations.putIfAbsent(#${e.item2}, ()=>[]);');
    });
    list.where((e) => !e.isSynthetic).forEach((e) {
      e.metadata.forEach((a) {
        //put annotation to list
        constructionInfo.write('''
            annotations[#${e.displayName}].add(
              ${a.toSource().substring(1)}
            );''');
      });
    });
    constructionInfo.write('''
      throw new ConstructionInfoException(types, annotations);
    ''');
    constructionInfo.write('}');

    // assignment of varaibles on construction
    String privateVariables = runtimeDependencies
        .where((e) => !e.isSynthetic)
        .map((e) => harmonize(e))
        .map((e) => '${e.item1} _${e.item2};')
        .join(' \n');

    privateVariables += modules
        .where((e) => !e.isSynthetic)
        .map((e) => harmonize(e))
        .map((e) => '${e.item1} _${e.item2};')
        .join(' \n');

    String assigns = runtimeDependencies
        .where((e) => !e.isSynthetic)
        .map((e) => '_${e.displayName} = parameters[#${e.displayName}];')
        .join('; \n');

    assigns += modules
        .where((e) => !e.isSynthetic)
        .map((e) => '_${e.displayName} = parameters[#${e.displayName}];')
        .join('; \n');

    String name = classElement.name;
    return '''
      $privateVariables

      _\$${await className}Implementation(Map<Symbol, Object> parameters) : super._(){
          $constructionInfo
        
          $assigns
        }

      $name implementation(Map<Symbol, Object> dependencies) 
        => _\$${name}Implementation(dependencies);
      @override
      Object invoke(Invocation invocation) =>
          _\$${name}Invoker.invoke(invocation, this);
      Provision provideRemote(Context context) =>
          _\$${name}Rmi.provideRemote(context, this);
      $name getRemote(Context context, String uuid) =>
        _\$${name}Rmi.getRemote(context, uuid);
    ''';
  }

  @override
  FutureOr<String> visitConstructorElement(ConstructorElement element) => '';

  @override
  FutureOr<String> visitPropertySetter(PropertyAccessorElement element) =>
      "=> throw new Exception('cannot change device property after implementationconstruction');";
  @override
  FutureOr<String> visitPropertyGetter(PropertyAccessorElement element) =>
      "=> _${element.name};";
  @override
  FutureOr<String> visitPropertyField(FieldElement e) =>
      '${e.type} _${e.displayName};';

  @override
  FutureOr<String> visitRuntimeGetter(PropertyAccessorElement element) =>
      "=> _${element.name};";

  @override
  FutureOr<String> visitExecutiveMethod(MethodElement element) => '';
  @override
  FutureOr<String> visitExecutiveSetter(PropertyAccessorElement element) => '';
  @override
  FutureOr<String> visitExecutiveGetter(PropertyAccessorElement element) => '';

  @override
  FutureOr<String> visitModuleGetter(PropertyAccessorElement e) =>
      '=> _${e.displayName};';
  @override
  FutureOr<String> visitModuleSetter(PropertyAccessorElement element) =>
      '=> throw new Exception("cannot change module after implementation construction");';
  @override
  FutureOr<String> visitModuleField(FieldElement element) => '';
}
