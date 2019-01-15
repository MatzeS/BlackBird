import 'package:blackbird/src/connection.dart';
import 'dart:async';

abstract class SerialPort extends Connection<List<int>> {
  SerialPort(Connection<List<int>> connection) : super(connection);
}
