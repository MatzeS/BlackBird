// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rc_socket.dart';

// **************************************************************************
// DeviceGenerator
// **************************************************************************

class _$DipSwitchSocketDevice extends DipSwitchSocket {
  _$DipSwitchSocketDevice() : super._();

  Host get host =>
      throw new Exception('only implementation objects are hosted');

  DipSwitchSocket implementation(Map<Symbol, Object> dependencies) =>
      _$DipSwitchSocketImplementation(this, dependencies);
  @override
  Object invoke(Invocation invocation) =>
      throw new Exception('no invocation on devices');
  Provision provideRemote(Context context) =>
      throw new Exception('no RMI on devices');
  DipSwitchSocket getRemote(Context context, String uuid) =>
      throw new Exception('no RMI on devices');
  get hooks => _$DipSwitchSocketHooks;
  @override
  Map<String, dynamic> toJson() => _$DipSwitchSocketToJson(this);

  CodeWord get codeWord =>
      throw new Exception("you cannot execute stuff on devices");

  void writeState(int state) =>
      throw new Exception("you cannot execute stuff on devices");
  dynamic toggle() =>
      throw new Exception("you cannot execute stuff on devices");
}

class _$DipSwitchSocketImplementation extends DipSwitchSocket {
  Host _host;
  Ontario _sender;
  String _dipCode;

  _$DipSwitchSocketImplementation(
      DipSwitchSocket delegate, Map<Symbol, Object> parameters)
      : super._() {
    if (parameters == null) {
      ConstructionInfoException info = new ConstructionInfoException();
      info.dependencies.add(new Dependency(
          name: #host,
          type: [
            "asset:blackbird/lib/src/device.dart#Host",
            "asset:blackbird/lib/src/device.dart#Device",
            "dart:core#Object"
          ],
          device: this,
          module: null,
          isModule: false));
      info.dependencies.add(new Dependency(
          name: #sender,
          type: [
            "asset:blackbird/lib/devices/ontario.dart#Ontario",
            "asset:blackbird/lib/src/device.dart#Device",
            "dart:core#Object"
          ],
          device: this,
          module: delegate.sender,
          isModule: true));
      info[#host].annotations.add(Runtime());
      throw info;
    }

    _host = parameters[#host];
    _sender = parameters[#sender];
    _dipCode = delegate.dipCode;
  }

  Host get host => _host;

  DipSwitchSocket implementation(Map<Symbol, Object> dependencies) =>
      throw Exception('this is already an implementation');
  @override
  Object invoke(Invocation invocation) =>
      _$DipSwitchSocketInvoker.invoke(invocation, this);
  Provision provideRemote(Context context) =>
      _$DipSwitchSocketRmi.provideRemote(context, this);
  DipSwitchSocket getRemote(Context context, String uuid) =>
      _$DipSwitchSocketRmi.getRemote(context, uuid);
  @override
  Map<String, dynamic> toJson() => _$DipSwitchSocketToJson(this);

  get hooks => _$DipSwitchSocketHooks;

  String get dipCode => _dipCode;
  set dipCode(String _dipCode) => throw new Exception(
      'cannot change device property after implementationconstruction');

  Ontario get sender => _sender;
  set sender(Ontario _sender) => throw new Exception(
      "cannot change module after implementation construction");
}

Map<String, dynamic> get _$DipSwitchSocketHooks {
  return {
    "classURL":
        "asset:blackbird/lib/src/ontario/functions/rc_socket.dart#DipSwitchSocket",
    "remote": _$DipSwitchSocketRmi.getRemote,
    "fromJson": _$DipSwitchSocketFromJson
  };
}

class _$IntertechnoSwitchDevice extends IntertechnoSwitch {
  _$IntertechnoSwitchDevice() : super._();

  Host get host =>
      throw new Exception('only implementation objects are hosted');

  IntertechnoSwitch implementation(Map<Symbol, Object> dependencies) =>
      _$IntertechnoSwitchImplementation(this, dependencies);
  @override
  Object invoke(Invocation invocation) =>
      throw new Exception('no invocation on devices');
  Provision provideRemote(Context context) =>
      throw new Exception('no RMI on devices');
  IntertechnoSwitch getRemote(Context context, String uuid) =>
      throw new Exception('no RMI on devices');
  get hooks => _$IntertechnoSwitchHooks;
  @override
  Map<String, dynamic> toJson() => _$IntertechnoSwitchToJson(this);

  CodeWord get codeWord =>
      throw new Exception("you cannot execute stuff on devices");

  void writeState(int state) =>
      throw new Exception("you cannot execute stuff on devices");
  dynamic toggle() =>
      throw new Exception("you cannot execute stuff on devices");
}

class _$IntertechnoSwitchImplementation extends IntertechnoSwitch {
  Host _host;
  Ontario _sender;
  String _family;
  int _device;

  _$IntertechnoSwitchImplementation(
      IntertechnoSwitch delegate, Map<Symbol, Object> parameters)
      : super._() {
    if (parameters == null) {
      ConstructionInfoException info = new ConstructionInfoException();
      info.dependencies.add(new Dependency(
          name: #host,
          type: [
            "asset:blackbird/lib/src/device.dart#Host",
            "asset:blackbird/lib/src/device.dart#Device",
            "dart:core#Object"
          ],
          device: this,
          module: null,
          isModule: false));
      info.dependencies.add(new Dependency(
          name: #sender,
          type: [
            "asset:blackbird/lib/devices/ontario.dart#Ontario",
            "asset:blackbird/lib/src/device.dart#Device",
            "dart:core#Object"
          ],
          device: this,
          module: delegate.sender,
          isModule: true));
      info[#host].annotations.add(Runtime());
      throw info;
    }

    _host = parameters[#host];
    _sender = parameters[#sender];
    _family = delegate.family;
    _device = delegate.device;
  }

  Host get host => _host;

  IntertechnoSwitch implementation(Map<Symbol, Object> dependencies) =>
      throw Exception('this is already an implementation');
  @override
  Object invoke(Invocation invocation) =>
      _$IntertechnoSwitchInvoker.invoke(invocation, this);
  Provision provideRemote(Context context) =>
      _$IntertechnoSwitchRmi.provideRemote(context, this);
  IntertechnoSwitch getRemote(Context context, String uuid) =>
      _$IntertechnoSwitchRmi.getRemote(context, uuid);
  @override
  Map<String, dynamic> toJson() => _$IntertechnoSwitchToJson(this);

  get hooks => _$IntertechnoSwitchHooks;

  String get family => _family;
  set family(String _family) => throw new Exception(
      'cannot change device property after implementationconstruction');
  int get device => _device;
  set device(int _device) => throw new Exception(
      'cannot change device property after implementationconstruction');

  Ontario get sender => _sender;
  set sender(Ontario _sender) => throw new Exception(
      "cannot change module after implementation construction");
}

Map<String, dynamic> get _$IntertechnoSwitchHooks {
  return {
    "classURL":
        "asset:blackbird/lib/src/ontario/functions/rc_socket.dart#IntertechnoSwitch",
    "remote": _$IntertechnoSwitchRmi.getRemote,
    "fromJson": _$IntertechnoSwitchFromJson
  };
}

// **************************************************************************
// DeviceJsonSerializableGenerator
// **************************************************************************

DipSwitchSocket _$DipSwitchSocketFromJson(Map<String, dynamic> json) {
  return DipSwitchSocket(json['dipCode'] as String);
}

Map<String, dynamic> _$DipSwitchSocketToJson(DipSwitchSocket instance) =>
    <String, dynamic>{
      'dipCode': instance.dipCode,
      'json_serializable.className':
          "asset:blackbird/lib/src/ontario/functions/rc_socket.dart#DipSwitchSocket",
    };

IntertechnoSwitch _$IntertechnoSwitchFromJson(Map<String, dynamic> json) {
  return IntertechnoSwitch(json['family'] as String, json['device'] as int);
}

Map<String, dynamic> _$IntertechnoSwitchToJson(IntertechnoSwitch instance) =>
    <String, dynamic>{
      'family': instance.family,
      'device': instance.device,
      'json_serializable.className':
          "asset:blackbird/lib/src/ontario/functions/rc_socket.dart#IntertechnoSwitch",
    };

// **************************************************************************
// InvokerGenerator
// **************************************************************************

class _$RCSocketInvoker {
  static dynamic invoke(Invocation invocation, RCSocket target) {
    if (invocation.isMethod && #writeState == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.writeState(
        positionalArguments[0],
      );
    }
    if (invocation.isGetter && #sender == invocation.memberName) {
      return target.sender;
    }
    if (invocation.isSetter && #sender == invocation.memberName) {
      target.sender = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isGetter && #codeWord == invocation.memberName) {
      return target.codeWord;
    }
    if (invocation.isGetter && #states == invocation.memberName) {
      return target.states;
    }
    if (invocation.isSetter && #binaryState == invocation.memberName) {
      target.binaryState = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isGetter && #state == invocation.memberName) {
      return target.state;
    }
    if (invocation.isSetter && #state == invocation.memberName) {
      target.state = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isGetter && #blackbird == invocation.memberName) {
      return target.blackbird;
    }
    if (invocation.isSetter && #blackbird == invocation.memberName) {
      target.blackbird = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isGetter && #host == invocation.memberName) {
      return target.host;
    }
    if (invocation.isGetter && #hooks == invocation.memberName) {
      return target.hooks;
    }
    if (invocation.isGetter && #hashCode == invocation.memberName) {
      return target.hashCode;
    }
    if (invocation.isGetter && #runtimeType == invocation.memberName) {
      return target.runtimeType;
    }
    if (invocation.isMethod && #toggle == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.toggle();
    }
    if (invocation.isMethod && #turnOn == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.turnOn();
    }
    if (invocation.isMethod && #turnOff == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.turnOff();
    }
    if (invocation.isMethod && #implementation == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.implementation(
        positionalArguments[0],
      );
    }
    if (invocation.isMethod && #provideRemote == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.provideRemote(
        positionalArguments[0],
      );
    }
    if (invocation.isMethod && #toJson == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.toJson();
    }
    if (invocation.isMethod && #== == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target == positionalArguments[0];
    }
    if (invocation.isMethod && #toString == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.toString();
    }
    if (invocation.isMethod && #noSuchMethod == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.noSuchMethod(
        positionalArguments[0],
      );
    }
    if (invocation.isMethod && #== == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target == positionalArguments[0];
    }
  }
}

class _$DipSwitchSocketInvoker {
  static dynamic invoke(Invocation invocation, DipSwitchSocket target) {
    if (invocation.isGetter && #dipCode == invocation.memberName) {
      return target.dipCode;
    }
    if (invocation.isSetter && #dipCode == invocation.memberName) {
      target.dipCode = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isGetter && #codeWord == invocation.memberName) {
      return target.codeWord;
    }
    if (invocation.isGetter && #sender == invocation.memberName) {
      return target.sender;
    }
    if (invocation.isSetter && #sender == invocation.memberName) {
      target.sender = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isGetter && #states == invocation.memberName) {
      return target.states;
    }
    if (invocation.isSetter && #binaryState == invocation.memberName) {
      target.binaryState = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isGetter && #state == invocation.memberName) {
      return target.state;
    }
    if (invocation.isSetter && #state == invocation.memberName) {
      target.state = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isGetter && #blackbird == invocation.memberName) {
      return target.blackbird;
    }
    if (invocation.isSetter && #blackbird == invocation.memberName) {
      target.blackbird = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isGetter && #host == invocation.memberName) {
      return target.host;
    }
    if (invocation.isGetter && #hooks == invocation.memberName) {
      return target.hooks;
    }
    if (invocation.isGetter && #hashCode == invocation.memberName) {
      return target.hashCode;
    }
    if (invocation.isGetter && #runtimeType == invocation.memberName) {
      return target.runtimeType;
    }
    if (invocation.isMethod && #writeState == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.writeState(
        positionalArguments[0],
      );
    }
    if (invocation.isMethod && #toggle == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.toggle();
    }
    if (invocation.isMethod && #turnOn == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.turnOn();
    }
    if (invocation.isMethod && #turnOff == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.turnOff();
    }
    if (invocation.isMethod && #implementation == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.implementation(
        positionalArguments[0],
      );
    }
    if (invocation.isMethod && #provideRemote == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.provideRemote(
        positionalArguments[0],
      );
    }
    if (invocation.isMethod && #toJson == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.toJson();
    }
    if (invocation.isMethod && #== == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target == positionalArguments[0];
    }
    if (invocation.isMethod && #toString == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.toString();
    }
    if (invocation.isMethod && #noSuchMethod == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.noSuchMethod(
        positionalArguments[0],
      );
    }
    if (invocation.isMethod && #== == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target == positionalArguments[0];
    }
  }
}

class _$IntertechnoSwitchInvoker {
  static dynamic invoke(Invocation invocation, IntertechnoSwitch target) {
    if (invocation.isGetter && #family == invocation.memberName) {
      return target.family;
    }
    if (invocation.isSetter && #family == invocation.memberName) {
      target.family = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isGetter && #device == invocation.memberName) {
      return target.device;
    }
    if (invocation.isSetter && #device == invocation.memberName) {
      target.device = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isGetter && #codeWord == invocation.memberName) {
      return target.codeWord;
    }
    if (invocation.isGetter && #sender == invocation.memberName) {
      return target.sender;
    }
    if (invocation.isSetter && #sender == invocation.memberName) {
      target.sender = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isGetter && #states == invocation.memberName) {
      return target.states;
    }
    if (invocation.isSetter && #binaryState == invocation.memberName) {
      target.binaryState = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isGetter && #state == invocation.memberName) {
      return target.state;
    }
    if (invocation.isSetter && #state == invocation.memberName) {
      target.state = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isGetter && #blackbird == invocation.memberName) {
      return target.blackbird;
    }
    if (invocation.isSetter && #blackbird == invocation.memberName) {
      target.blackbird = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isGetter && #host == invocation.memberName) {
      return target.host;
    }
    if (invocation.isGetter && #hooks == invocation.memberName) {
      return target.hooks;
    }
    if (invocation.isGetter && #hashCode == invocation.memberName) {
      return target.hashCode;
    }
    if (invocation.isGetter && #runtimeType == invocation.memberName) {
      return target.runtimeType;
    }
    if (invocation.isMethod && #writeState == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.writeState(
        positionalArguments[0],
      );
    }
    if (invocation.isMethod && #toggle == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.toggle();
    }
    if (invocation.isMethod && #turnOn == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.turnOn();
    }
    if (invocation.isMethod && #turnOff == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.turnOff();
    }
    if (invocation.isMethod && #implementation == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.implementation(
        positionalArguments[0],
      );
    }
    if (invocation.isMethod && #provideRemote == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.provideRemote(
        positionalArguments[0],
      );
    }
    if (invocation.isMethod && #toJson == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.toJson();
    }
    if (invocation.isMethod && #== == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target == positionalArguments[0];
    }
    if (invocation.isMethod && #toString == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.toString();
    }
    if (invocation.isMethod && #noSuchMethod == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.noSuchMethod(
        positionalArguments[0],
      );
    }
    if (invocation.isMethod && #== == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target == positionalArguments[0];
    }
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodeWordD _$CodeWordDFromJson(Map<String, dynamic> json) {
  return CodeWordD(json['group'] as String, json['device'] as int);
}

Map<String, dynamic> _$CodeWordDToJson(CodeWordD instance) => <String, dynamic>{
      'group': instance.group,
      'device': instance.device,
      'json_serializable.className':
          "asset:blackbird/lib/src/ontario/functions/rc_socket.dart#CodeWordD",
    };

// **************************************************************************
// ProxyGenerator
// **************************************************************************

class _$RCSocketProxy implements RCSocket {
  void writeState(int state) {
    List<Object> arguments = [];
    arguments.add(state);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#writeState, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.elementMetadata.add(Executive());
    metadata.isStream = false;

    _handle(_$invocation, metadata);
  }

  dynamic toggle() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#toggle, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  Future<void> turnOn() async {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#turnOn, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return await _handle(_$invocation, metadata);
  }

  Future<void> turnOff() async {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#turnOff, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return await _handle(_$invocation, metadata);
  }

  Device implementation(Map dependencies) {
    List<Object> arguments = [];
    arguments.add(dependencies);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#implementation, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  Provision provideRemote(Context context) {
    List<Object> arguments = [];
    arguments.add(context);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#provideRemote, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  Object invoke(Invocation invocation) {
    List<Object> arguments = [];
    arguments.add(invocation);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#invoke, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  Map<String, dynamic> toJson() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#toJson, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  bool operator ==(Object other) {
    List<Object> arguments = [];
    arguments.add(other);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation = Invocation.method(#==, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  String toString() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#toString, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  dynamic noSuchMethod(Invocation invocation) {
    List<Object> arguments = [];
    arguments.add(invocation);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#noSuchMethod, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  InvocationHandlerFunction _handle;
  _$RCSocketProxy(this._handle) : super();

  Ontario get sender {
    Invocation invocation = Invocation.getter(#sender);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  CodeWord get codeWord {
    Invocation invocation = Invocation.getter(#codeWord);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.elementMetadata.add(Executive());
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  int get states {
    Invocation invocation = Invocation.getter(#states);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.elementMetadata.add(Property());
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  set state(int state) {
    Invocation invocation = Invocation.setter(#state, state);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.elementMetadata.add(Executive());
    metadata.isStream = false;

    _handle(invocation, metadata);
  }

  set binaryState(bool binaryState) {
    Invocation invocation = Invocation.setter(#binaryState, binaryState);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    _handle(invocation, metadata);
  }

  Blackbird get blackbird {
    Invocation invocation = Invocation.getter(#blackbird);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  Host get host {
    Invocation invocation = Invocation.getter(#host);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.elementMetadata.add(Runtime());
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  Map<String, dynamic> get hooks {
    Invocation invocation = Invocation.getter(#hooks);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  int get hashCode {
    Invocation invocation = Invocation.getter(#hashCode);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  Type get runtimeType {
    Invocation invocation = Invocation.getter(#runtimeType);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }
}

class _$DipSwitchSocketProxy implements DipSwitchSocket {
  void writeState(int state) {
    List<Object> arguments = [];
    arguments.add(state);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#writeState, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.elementMetadata.add(Executive());
    metadata.isStream = false;

    _handle(_$invocation, metadata);
  }

  dynamic toggle() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#toggle, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  Future<void> turnOn() async {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#turnOn, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return await _handle(_$invocation, metadata);
  }

  Future<void> turnOff() async {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#turnOff, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return await _handle(_$invocation, metadata);
  }

  Device implementation(Map dependencies) {
    List<Object> arguments = [];
    arguments.add(dependencies);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#implementation, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  Provision provideRemote(Context context) {
    List<Object> arguments = [];
    arguments.add(context);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#provideRemote, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  Object invoke(Invocation invocation) {
    List<Object> arguments = [];
    arguments.add(invocation);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#invoke, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  Map<String, dynamic> toJson() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#toJson, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  bool operator ==(Object other) {
    List<Object> arguments = [];
    arguments.add(other);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation = Invocation.method(#==, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  String toString() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#toString, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  dynamic noSuchMethod(Invocation invocation) {
    List<Object> arguments = [];
    arguments.add(invocation);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#noSuchMethod, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  InvocationHandlerFunction _handle;
  _$DipSwitchSocketProxy(this._handle) : super();

  String get dipCode {
    Invocation invocation = Invocation.getter(#dipCode);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  CodeWord get codeWord {
    Invocation invocation = Invocation.getter(#codeWord);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  Ontario get sender {
    Invocation invocation = Invocation.getter(#sender);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  int get states {
    Invocation invocation = Invocation.getter(#states);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.elementMetadata.add(Property());
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  set state(int state) {
    Invocation invocation = Invocation.setter(#state, state);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.elementMetadata.add(Executive());
    metadata.isStream = false;

    _handle(invocation, metadata);
  }

  set binaryState(bool binaryState) {
    Invocation invocation = Invocation.setter(#binaryState, binaryState);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    _handle(invocation, metadata);
  }

  Blackbird get blackbird {
    Invocation invocation = Invocation.getter(#blackbird);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  Host get host {
    Invocation invocation = Invocation.getter(#host);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.elementMetadata.add(Runtime());
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  Map<String, dynamic> get hooks {
    Invocation invocation = Invocation.getter(#hooks);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  int get hashCode {
    Invocation invocation = Invocation.getter(#hashCode);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  Type get runtimeType {
    Invocation invocation = Invocation.getter(#runtimeType);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }
}

class _$IntertechnoSwitchProxy implements IntertechnoSwitch {
  void writeState(int state) {
    List<Object> arguments = [];
    arguments.add(state);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#writeState, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.elementMetadata.add(Executive());
    metadata.isStream = false;

    _handle(_$invocation, metadata);
  }

  dynamic toggle() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#toggle, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  Future<void> turnOn() async {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#turnOn, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return await _handle(_$invocation, metadata);
  }

  Future<void> turnOff() async {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#turnOff, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return await _handle(_$invocation, metadata);
  }

  Device implementation(Map dependencies) {
    List<Object> arguments = [];
    arguments.add(dependencies);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#implementation, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  Provision provideRemote(Context context) {
    List<Object> arguments = [];
    arguments.add(context);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#provideRemote, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  Object invoke(Invocation invocation) {
    List<Object> arguments = [];
    arguments.add(invocation);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#invoke, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  Map<String, dynamic> toJson() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#toJson, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  bool operator ==(Object other) {
    List<Object> arguments = [];
    arguments.add(other);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation = Invocation.method(#==, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  String toString() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#toString, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  dynamic noSuchMethod(Invocation invocation) {
    List<Object> arguments = [];
    arguments.add(invocation);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#noSuchMethod, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  InvocationHandlerFunction _handle;
  _$IntertechnoSwitchProxy(this._handle) : super();

  String get family {
    Invocation invocation = Invocation.getter(#family);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  int get device {
    Invocation invocation = Invocation.getter(#device);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  CodeWord get codeWord {
    Invocation invocation = Invocation.getter(#codeWord);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  Ontario get sender {
    Invocation invocation = Invocation.getter(#sender);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  int get states {
    Invocation invocation = Invocation.getter(#states);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.elementMetadata.add(Property());
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  set state(int state) {
    Invocation invocation = Invocation.setter(#state, state);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.elementMetadata.add(Executive());
    metadata.isStream = false;

    _handle(invocation, metadata);
  }

  set binaryState(bool binaryState) {
    Invocation invocation = Invocation.setter(#binaryState, binaryState);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    _handle(invocation, metadata);
  }

  Blackbird get blackbird {
    Invocation invocation = Invocation.getter(#blackbird);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  Host get host {
    Invocation invocation = Invocation.getter(#host);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.elementMetadata.add(Runtime());
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  Map<String, dynamic> get hooks {
    Invocation invocation = Invocation.getter(#hooks);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  int get hashCode {
    Invocation invocation = Invocation.getter(#hashCode);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  Type get runtimeType {
    Invocation invocation = Invocation.getter(#runtimeType);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.elementMetadata.add(Ignore());
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }
}

// **************************************************************************
// RmiGenerator
// **************************************************************************

class _$RCSocketRmi {
  static void _registerSerializers(Context context) {}
  static void _registerStubConstructors(Context context) {
    context.registerRemoteStubConstructor(
        'asset:blackbird/lib/devices/ontario.dart#Ontario', Ontario.getRemote);
    context.registerRemoteStubConstructor(
        'asset:blackbird/lib/src/ontario/functions/rc_socket.dart#RCSocket',
        getRemote);
  }

  static RCSocket getRemote(Context context, String uuid) {
    _registerSerializers(context);
    _registerStubConstructors(context);
    RmiProxyHandler handler = RmiProxyHandler(context, uuid);
    return _$RCSocketProxy(handler.handle);
  }

  static Provision provideRemote(Context context, RCSocket target) {
    _registerSerializers(context);
    _registerStubConstructors(context);
    return rmiProvideRemote(context, target,
        'asset:blackbird/lib/src/ontario/functions/rc_socket.dart#RCSocket');
  }
}

class _$DipSwitchSocketRmi {
  static void _registerSerializers(Context context) {}
  static void _registerStubConstructors(Context context) {
    context.registerRemoteStubConstructor(
        'asset:blackbird/lib/src/ontario/functions/rc_socket.dart#DipSwitchSocket',
        getRemote);
  }

  static DipSwitchSocket getRemote(Context context, String uuid) {
    _registerSerializers(context);
    _registerStubConstructors(context);
    RmiProxyHandler handler = RmiProxyHandler(context, uuid);
    return _$DipSwitchSocketProxy(handler.handle);
  }

  static Provision provideRemote(Context context, DipSwitchSocket target) {
    _registerSerializers(context);
    _registerStubConstructors(context);
    return rmiProvideRemote(context, target,
        'asset:blackbird/lib/src/ontario/functions/rc_socket.dart#DipSwitchSocket');
  }
}

class _$IntertechnoSwitchRmi {
  static void _registerSerializers(Context context) {}
  static void _registerStubConstructors(Context context) {
    context.registerRemoteStubConstructor(
        'asset:blackbird/lib/src/ontario/functions/rc_socket.dart#IntertechnoSwitch',
        getRemote);
  }

  static IntertechnoSwitch getRemote(Context context, String uuid) {
    _registerSerializers(context);
    _registerStubConstructors(context);
    RmiProxyHandler handler = RmiProxyHandler(context, uuid);
    return _$IntertechnoSwitchProxy(handler.handle);
  }

  static Provision provideRemote(Context context, IntertechnoSwitch target) {
    _registerSerializers(context);
    _registerStubConstructors(context);
    return rmiProvideRemote(context, target,
        'asset:blackbird/lib/src/ontario/functions/rc_socket.dart#IntertechnoSwitch');
  }
}
