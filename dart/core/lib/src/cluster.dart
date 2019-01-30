import 'device.dart';

class Cluster {
  List<Device> devices = [];
  List<Host> get hosts =>
      devices.where((d) => d is Host).map((h) => h as Host).toList();
}
