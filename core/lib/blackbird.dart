import 'package:rmi/remote_method_invocation.dart';

class RuntimeDependency {
  const RuntimeDependency();
}

abstract class Device implements RmiTarget {
  const Device();
}

class Blackbird {
  //todo singleton

  Blackbird();

  R interfaceDevice<R>(Device device) {
    return null;
  }
}
