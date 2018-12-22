import 'package:blackbird/blackbird.dart';
import 'package:rmi/rmi.dart';

part 'socket.g.dart';

abstract class Socket extends Device {
  @Executive()
  bool get state;
  @Executive()
  set state(bool state);

  void toggle() => state = !state;
  void turnOff() => state = false;
  void turnOn() => state = true;
}

abstract class RemoteSocket extends Socket {
  bool _state;

  @override
  @Executive()
  bool get state => _state;

  @override
  @Executive()
  set state(bool state) {
    remoteState = state;
    _state = state;
  }

  @Executive()
  set remoteState(bool state);
}
