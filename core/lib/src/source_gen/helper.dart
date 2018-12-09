import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'output_visitor.dart';
import '../../blackbird.dart';

enum DeviceClassElement {
  property,
  runtime, //,state
  executive,
}

bool isAnnotatedWith<T>(Element element) {
  return TypeChecker.fromRuntime(T).annotationsOf(element).isNotEmpty;
}

String generateArgumentDeclarations(ExecutableElement element) {
  bool hasNamedArgs = element.parameters.any((p) => p.isNamed);
  bool hasPositionalArgs =
      element.parameters.any((p) => p.isPositional && p.isOptional);
  if (hasNamedArgs && hasPositionalArgs) {
    log.severe('named and positional arguments $element');
  }
  String argumentEncoder(Iterable<ParameterElement> elements) =>
      elements.map((p) => '${p.type.name} ${p.name}').join(', ');
  String declarationRequiredArguments =
      argumentEncoder(element.parameters.where((p) => p.isNotOptional));
  String declarationPositionalArguments = argumentEncoder(
      element.parameters.where((p) => p.isPositional && p.isOptional));
  String declarationNamedArguments =
      argumentEncoder(element.parameters.where((p) => p.isNamed));
  String argumentDeclarations = declarationRequiredArguments;
  if ((hasNamedArgs || hasPositionalArgs) &&
      declarationRequiredArguments.isNotEmpty) argumentDeclarations += ', ';
  if (hasPositionalArgs) {
    argumentDeclarations += '[' + declarationPositionalArguments + ']';
  }
  if (hasNamedArgs) {
    argumentDeclarations += '{' + declarationNamedArguments + '}';
  }

  return argumentDeclarations;
}

String generateDeclaration(ExecutableElement element) {
  String argumentDeclarations = generateArgumentDeclarations(element);

  bool isSetter = element is PropertyAccessorElement && element.isSetter;
  bool isGetter = element is PropertyAccessorElement && element.isGetter;

  StringBuffer output = new StringBuffer();
  if (isSetter) {
    output.write('set ');
  } else {
    output.write(element.returnType.toString() + ' ');
  }
  if (isGetter) output.write(' get ');
  output.write(element.displayName);
  if (!isGetter) {
    output.write(' ( ');
    output.write(argumentDeclarations);
    output.write(' ) ');
  }
  output.write(element.isAsynchronous ? 'async' : '');
  return output.toString();
}
