import 'dart:io';

import 'dart:async';

import 'package:json_serialization/json_serialization.dart';
import 'package:rmi/rmi.dart';

import 'manager/dependency_builders.dart';

class BlackbirdHelpers {
  // RMI helpers
  JsonSerialization serialization = new JsonSerialization();
  RemoteStubProvider remoteStubProvider = new RemoteStubProvider();

  Context createContext(Stream<String> input, StreamSink<String> output) =>
      new Context(input, output,
          serialization: serialization, remoteStubProvider: remoteStubProvider);

  // Dependency Builders, may move in the future
  List<DependencyBuilder> dependencyBuilders = [];
}
