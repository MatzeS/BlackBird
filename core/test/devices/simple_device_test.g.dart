// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_device_test.dart';

// **************************************************************************
// DeviceGenerator
// **************************************************************************

class _$SimpleDeviceDevice extends SimpleDevice {
  SimpleDevice implementation() => _$SimpleDeviceImplementation(this);

  @override
  Object invoke(Invocation invocation) =>
      _$SimpleDeviceInvoker.invoke(invocation, this);
  Provision provideRemote(Context context) =>
      _$SimpleDeviceRmi.provideRemote(context, this);
  SimpleDevice getRemote(Context context, String uuid) =>
      _$SimpleDeviceRmi.getRemote(context, uuid);

  _$SimpleDeviceDevice(int propertyField) : super(propertyField);

  void executiveMethod() => Blackbird().interfaceDevice(this).executiveMethod();

  set propertyField(int _propertyField) =>
      throw new Exception('cannot set device property after construction');

  set master(I2CMaster _master) => throw new Exception(
      'cannot set runtime dependencys (especially not on device representation)');
  I2CMaster get master => throw new Exception(
      'cannot get runtime dependencys on device representation');
}

class _$SimpleDeviceImplementation extends SimpleDevice {
  I2CMaster _master;

  _$SimpleDeviceImplementation(SimpleDevice device)
      : super(device.propertyField) {
    _master = Blackbird().implementDevice(master);
  }

  SimpleDevice implementation() => _$SimpleDeviceImplementation(this);

  @override
  Object invoke(Invocation invocation) =>
      _$SimpleDeviceInvoker.invoke(invocation, this);
  Provision provideRemote(Context context) =>
      _$SimpleDeviceRmi.provideRemote(context, this);
  SimpleDevice getRemote(Context context, String uuid) =>
      _$SimpleDeviceRmi.getRemote(context, uuid);

  set propertyField(int _propertyField) =>
      throw new Exception('cannot set device property after construction');

  set master(I2CMaster _master) =>
      throw new Exception('cannot set runtime dependencys after construction');
  I2CMaster get master => _master;
}

// **************************************************************************
// InvokerGenerator
// **************************************************************************

class _$SimpleDeviceInvoker {
  static dynamic invoke(Invocation invocation, SimpleDevice target) {
    if (invocation.isGetter && #propertyField == invocation.memberName) {
      return target.propertyField;
    }
    if (invocation.isSetter && #propertyField == invocation.memberName) {
      target.propertyField = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isGetter && #master == invocation.memberName) {
      return target.master;
    }
    if (invocation.isSetter && #master == invocation.memberName) {
      target.master = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isMethod && #executiveMethod == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.executiveMethod();
    }
  }
}

// **************************************************************************
// ProxyGenerator
// **************************************************************************

class _$SimpleDeviceProxy implements SimpleDevice {
  InvocationHandlerFunction _handle;
  _$SimpleDeviceProxy(this._handle) : super();

  int get propertyField {
    Invocation invocation = Invocation.getter(#propertyField);

    return _handle(invocation);
  }

  set propertyField(int _propertyField) {
    Invocation invocation = Invocation.setter(#propertyField, _propertyField);

    _handle(invocation);
  }

  I2CMaster get master {
    Invocation invocation = Invocation.getter(#master);

    return _handle(invocation);
  }

  set master(I2CMaster _master) {
    Invocation invocation = Invocation.setter(#master, _master);

    _handle(invocation);
  }

  void executiveMethod() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#executiveMethod, arguments, namedArguments);

    _handle(_$invocation);
  }

  int get hashCode {
    Invocation invocation = Invocation.getter(#hashCode);

    return _handle(invocation);
  }

  Type get runtimeType {
    Invocation invocation = Invocation.getter(#runtimeType);

    return _handle(invocation);
  }

  String toString() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#toString, arguments, namedArguments);

    return _handle(_$invocation);
  }

  dynamic noSuchMethod(Invocation invocation) {
    List<Object> arguments = [];
    arguments.add(invocation);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#noSuchMethod, arguments, namedArguments);

    return _handle(_$invocation);
  }

  Device implementation() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#implementation, arguments, namedArguments);

    return _handle(_$invocation);
  }

  Device getRemote(Context context, String uuid) {
    List<Object> arguments = [];
    arguments.add(context);
    arguments.add(uuid);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#getRemote, arguments, namedArguments);

    return _handle(_$invocation);
  }

  Provision provideRemote(Context context) {
    List<Object> arguments = [];
    arguments.add(context);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#provideRemote, arguments, namedArguments);

    return _handle(_$invocation);
  }

  Object invoke(Invocation invocation) {
    List<Object> arguments = [];
    arguments.add(invocation);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#invoke, arguments, namedArguments);

    return _handle(_$invocation);
  }
}

// **************************************************************************
// RmiGenerator
// **************************************************************************

class _$SimpleDeviceRmi {
  static bool _registered = false;
  static void _registerSerializers() {
    if (_registered) return;
    _registered = true;

    rmiRegisterSerializers([]);
  }

  static void _registerStubConstructors(Context context) {}
  static SimpleDevice getRemote(Context context, String uuid) {
    _registerSerializers();
    _registerStubConstructors(context);
    RmiProxyHandler handler = RmiProxyHandler(context, uuid);
    return _$SimpleDeviceProxy(handler.handle);
  }

  static Provision provideRemote(Context context, SimpleDevice target) {
    _registerSerializers();
    _registerStubConstructors(context);
    return rmiProvideRemote(context, target);
  }
}
