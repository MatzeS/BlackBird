import 'manager/device_manager.dart';
import 'device.dart';

class Blackbird {
  /// See [DeviceManager.interfaceDevice]
  R interfaceDevice<R extends Device>(R device) =>
      getManager(device).interfaceDevice;

  /// See [DeviceManager.implementDevice]
  R implementDevice<R extends Device>(R device) =>
      getManager(device).implementDevice;

  List<Device> devices; //TODO
  List<Host> get hosts => devices.where((d) => d is Host).toList();

  Host get localDevice {
    //TODO
  }

  Map<Device, DeviceManager> _managers = {};

  DeviceManager getManager(Device device) {
    if (device == null) throw new Exception('device is null');

    if (_managers[device] != null) {
      return _managers[device];
    }

    DeviceManager manager = managerFactory(device);
    _managers.putIfAbsent(device, () => manager);
    return manager;
  }

  DeviceManager managerFactory(Device device) {
    if (device is Host)
      return new HostManager(device, this);
    else
      return AgentManager(device, this);
  }
}
