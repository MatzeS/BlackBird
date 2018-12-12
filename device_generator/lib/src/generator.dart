import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
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

//TODO check for no arg construcotr

Builder builder(BuilderOptions options) =>
    new SharedPartBuilder([new DeviceGenerator(options)], 'blackbird_device');

class DeviceGenerator extends Generator {
  BuilderOptions options;
  DeviceGenerator(this.options);

  bool elementFilter(Element element) {
    if (TypeChecker.fromUrl("asset:blackbird/lib/device.dart#Device")
        .isExactly(element)) return false;

    // if (isAnnotatedWith<Device>(element)) return true;

    if (TypeChecker.fromUrl("asset:blackbird/lib/device.dart#Device")
        .isAssignableFrom(element)) return true;

    if (isAnnotatedWith(element, 'Device ()')) return true;

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

    // SuperVisitor superVisitor = SuperVisitor(element);
    // element.visitChildren(superVisitor); //todo replace with sueprvisitor.accept

    DeviceVisitor deviceVisitor = new DeviceVisitor(element);
    OverrideVisitor deviceOverride = new OverrideVisitor(deviceVisitor);
    ClassOutputVisitor deviceOutput = new ClassOutputVisitor(deviceOverride);

    ImplementationVisitor implementationVisitor =
        new ImplementationVisitor(element);
    OverrideVisitor implementationOverride =
        new OverrideVisitor(implementationVisitor);
    ClassOutputVisitor implementationOutput =
        new ClassOutputVisitor(implementationOverride);

    List<Element> elements = [];
    elements.add(element);
    elements.addAll(allClassChildren(element));
    //TODO expand more subfileds

    List<Future<void>> accepted;

    // accepted = elements.map((e) => e.accept(deviceOutput)).toList();
    await deviceOutput.visitElements(elements);
    await implementationOutput.visitElements(elements);
    // accepted = elements.map((e) => e.accept(implementationOutput)).toList();
    // await Future.wait(accepted);

    // if (!classvisitor.foundNoArgConstructor) {
    //   log.severe('${classElement} must have a no argument constructor');
    // }

    StringBuffer output = new StringBuffer();
    // output.write(await superVisitor.output); TODO remove
    output.write(await deviceOutput.output);
    output.write(await implementationOutput.output);
    print(output.toString());
    return output.toString();
  }
}
