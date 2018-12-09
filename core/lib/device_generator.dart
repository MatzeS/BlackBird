import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/source_gen/output_visitor.dart';
import 'src/source_gen/helper.dart';
import 'blackbird.dart';
import 'src/device_generator/device_class.dart';
import 'src/device_generator/super_class.dart';
import 'src/device_generator/implementation_class.dart';

//TODO check for no arg construcotr

Builder builder(BuilderOptions options) => new SharedPartBuilder(
    [new DeviceGenerator(options)], 'blackbird_core_device');

class DeviceGenerator extends Generator {
  BuilderOptions options;
  DeviceGenerator(this.options);

  bool isAnnotatedWith<T>(Element element) {
    return TypeChecker.fromRuntime(T).firstAnnotationOf(element) != null;
  }

  bool elementFilter(Element element) {
    if (TypeChecker.fromRuntime(Device).isExactly(element)) return false;

    if (isAnnotatedWith<Device>(element)) return true;
    if (TypeChecker.fromRuntime(Device).isAssignableFrom(element)) return true;
    return false;
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

    SuperVisitor superVisitor = SuperVisitor(element);
    element.visitChildren(superVisitor); //todo replace with sueprvisitor.accept

    DeviceVisitor deviceVisitor = new DeviceVisitor(element);
    OutputVisitor deviceOutput = new OutputVisitor(deviceVisitor);

    ImplementationVisitor implementationVisitor =
        new ImplementationVisitor(element);
    OutputVisitor implementationOutput =
        new OutputVisitor(implementationVisitor);

    List<Element> elements = [];
    elements.add(element);
    elements.addAll(element.constructors);
    elements.addAll(element.methods);
    elements.addAll(element.accessors);
    elements.addAll(element.fields);
    //TODO expand more subfileds

    List<Future<void>> accepted;

    accepted = elements.map((e) => e.accept(deviceOutput)).toList();
    await Future.wait(accepted);

    accepted = elements.map((e) => e.accept(implementationOutput)).toList();
    await Future.wait(accepted);

    // if (!classvisitor.foundNoArgConstructor) {
    //   log.severe('${classElement} must have a no argument constructor');
    // }

    StringBuffer output = new StringBuffer();
    output.write(await superVisitor.output);
    output.write(await deviceOutput.output);
    output.write(await implementationOutput.output);
    return output.toString();
  }
}
