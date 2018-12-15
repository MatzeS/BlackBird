import 'dart:async';

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
import '../type_list.dart';

Builder builder(BuilderOptions options) => new SharedPartBuilder(
    [new FilteredDependencyBuilderTypeGenerator(options)],
    'filtered_dependency_builder');

class FilteredDependencyBuilderTypeGenerator extends Generator {
  BuilderOptions options;
  FilteredDependencyBuilderTypeGenerator(this.options);

  bool elementFilter(Element element) {
    if (TypeChecker.fromUrl(
            "asset:blackbird/lib/manager/dependency_builders.dart#FilteredDependencyBuilder")
        .isSuperOf(element)) return true;

    if (element is! ClassElement) return false;

    // print((element as ClassElement).allSupertypes);

    // print((element as ClassElement)
    //     .allSupertypes
    //     .map((t) => t.displayName)
    //     .any((t) => t.contains('FilteredDependencyBuilder')));

//TypeChecker.fromUrl(
    //     "asset:blackbird/lib/manager/dependency_builders.dart#FilteredDependencyBuilder")
    // .isExactlyType(t)

    return (element as ClassElement)
        .allSupertypes
        .map((t) => t.displayName)
        .any((t) => t.contains('FilteredDependencyBuilder'));
  }

  @override
  generate(LibraryReader library, BuildStep buildStep) async {
    var futures = library.allElements
        .where(elementFilter)
        .map((e) async => await generateForElement(e))
        .toList();
    var result = await Future.wait(futures);
    return result.join('\n\n');
  }

  generateForElement(Element pElement) async {
    ClassElement element = pElement as ClassElement;

    StringBuffer output = new StringBuffer();
    output.write('''
      List<String> get _\$${element.name}Types {
        List<String> types = [];
    ''');

    DartType originalType = element.supertype.typeArguments[1];
    if (originalType is! InterfaceType) return '';

    typeList(originalType).forEach((t) {
      output.writeln('types.add("$t");');
    });

    output.write('return types; }');

    return output.toString();
  }
}
