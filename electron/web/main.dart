import 'dart:html';
import 'package:blackbird_electron/interop.dart';
import 'package:node_interop/node.dart' hide require;
import 'package:node_interop/path.dart';

import 'dart:html';
import 'package:node_interop/node.dart' hide require;
import 'package:node_interop/path.dart';
import 'package:js/js.dart';
import 'package:angular/angular.dart';
import 'app/app_component.template.dart' as ng;

void main() {
  runApp(ng.AppComponentNgFactory);

  var p = require<Path>('path');
  console.log('test');
  // window..console.info(p.join(process.cwd(), 'foo', 'bar'));
  // ..alert('Hello, Dart! Electron version: ${process.version}');
}
