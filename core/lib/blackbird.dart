import 'package:rmi/remote_method_invocation.dart';
import 'src/manager/device_manager.dart';

import 'device.dart';

class Blackbird {
  static final Blackbird _singleton = new Blackbird._internal();
  factory Blackbird() {
    return _singleton;
  }
  Blackbird._internal();

  R interfaceDevice<R extends Device>(R device) {
    // return getManager(device).interfaceDevice;
  }

  R implementDevice<R extends Device>(R device) {
    // return getManager(device).implementDevice;
  }

  List<Device> devices; //TODO
  List<Host> get hosts => devices.where((d) => d is Host).toList();

  Host get localDevice {
    //TODO
  }

  Map<Device, DeviceManager> _managers;

  DeviceManager getManager(Device device) {
    if (_managers[device] != null) {
      return _managers[device];
    }

    DeviceManager manager = managerFactory(device);
    _managers.putIfAbsent(device, () => manager);
    return manager;
  }
}

DeviceManager managerFactory(Device device) {
  if (device is Host)
    return new HostManager(device);
  else
    return AgentManager(device);
}
