import 'dart:io';

import 'package:rmi/rmi.dart';
import 'package:blackbird/blackbird.dart';
import 'main.dart';
import 'package:json_annotation/json_annotation.dart';

part 'device.g.dart';

/// Declares a class member as a device property
///
/// A device property is anything configurable and non-runtime specific
/// For example the adress or information how to connect to the device
/// This information has to be serializable
///
/// Properties cannot be changed as long as
/// the device's implementation object exists in the cluster.
///
///     class YourDevice extends Device{
///       @Property()
///       int address;
///
///       // non-final fields are also directly inferred as property
///       // and the annotation can be avoided
///       int another;
///
///       // for more sophisticated stuff, however, the annotatoin is required
///       // for example you can create an alternative property format
///       // this property should solely depends on other properties
///       // it is not serialized, as it can be reconstructed form other properties,
///       // thereby private variables should not be used as they are lost during serialization
///       @Property()
///       String get alternativeAddressFormat()
///         => address.toString();
///
///     }
///
/// TODO custom serialization for non trivial properties
class Property {
  const Property();
}

/// Declares a class member as a runtime dependency
///
/// Runtime dependencies are injected when the implementation is created
/// They are provided by a [DependencyBuilder] and may be used by
/// executive methods. A typical example is a connection interface.
///
///     class YourDevice extends Device{
///       @Runtime()
///       Connection get connection;
///
///       // A runtime dependency cannot be changed after creation.
///       // The only allowed declaration of a runtime dependency is an abstract getter
///       // and such one is also assumed to be a runtime dependency, if not specified otherwise (by annotation).
///       Connection get connection;
///     }
///
class Runtime {
  final bool isAbstract;
  const Runtime({this.isAbstract = false});
}

/// Declares a class member as a executive element
///
/// An executive element is the code run on the implementation object.
/// It uses the injected runtime dependencies to provide high level
/// device functionality. These things are not overwritten by source generation.
///
///     class YourDevice extends Device{
///
///       @Executive()
///       void turnLightOff(){
///         // ...
///       }
///
///       // Unless specified otherwise by annotation, any non abstract method is assumed as executive.
///       void turnLightOn(){
///       }
///
///     }
///
class Executive {
  const Executive();
}

/// Declares a class member as an submodule
///
/// A submodule is another device which is used within another device.
/// A submodule is both a property and runtime dependency.
/// It is set as property, where the device does not have to be implemented yet.
/// When constructed the subdevice is implemented and the implementation object is injected.
///
///     class YourDevice extends Device{
///
///       @Subdevice()
///       Device aSubmodule;
///
///       // Any property of type [Device] is assumed to be a submodule
///       Device aSubmodule;
///
///       // You cannot pass a Device by a device by anything else than a submodule
///       // This may change in the future
///       // void someSuspiciousMethod(Device d){} // not allowed
///     }
class SubModule {
  const SubModule();
}

///TODO not yet implemented
// class SuperModule {
//   const SuperModule();
// }

/// Excludes a class member from device interpertation
///
/// No code generation will be applied for this member, the method is not overwritten
class Ignore {
  const Ignore();
}

/// The root class for a device
///
/// A device is a complex object representing a device in the real world,
/// allowing high level API interaction with the device.
///
/// Make it aware of its object kind, device/implementation/proxy
abstract class Device implements RmiTarget {
  /// A device must specify a default constructor with no arguments
  ///
  /// This allows source genration to create the device
  Device();

  /// Local handle for blackbird instance
  @Ignore()
  Blackbird _blackbird;

  /// The blackbird instance the device object is associated with
  @Ignore()
  Blackbird get blackbird {
    if (_blackbird == null) {
      throw new Exception('device is not attached to blackbird instance');
    }

    return _blackbird;
  }

  /// The blackbird instance the device object is associated with
  /// can only be set once
  /// TODO add to blackbird cluster, allow for change
  @Ignore()
  set blackbird(Blackbird blackbird) {
    if (blackbird == _blackbird) return;

    if (_blackbird != null) {
      throw new Exception(
          'device already attached to another blackbird instance');
    }

    _blackbird = blackbird;
  }

  /// The host device the implementation object is located on
  ///
  /// TODO document what if not implemented
  @Runtime()
  Host get host;

  /// May be overwritten in order to perform some setup routine after creation of the implementation object
  void postImplementation() {}

  /// Creates the implementation object
  /// This should not be called or implemented manually
  @Ignore()
  Device implementation(Map<Symbol, Object> dependencies);

  /// Makes the object available for RMI
  /// Noted here for the Ignore annotation
  /// This should not be called or implemented manually
  @Ignore()
  Provision provideRemote(Context context);

  /// Invokes RMI calls
  /// Noted here for the Ignore annotation
  /// This should not be called or implemented manually
  @Ignore()
  Object invoke(Invocation invocation);

  /// This is required for RMI
  static Device getRemote(Context context, String uuid) =>
      _$DeviceRmi.getRemote(context, uuid);

  /// serializes propoerties and submodules
  @Ignore()
  Map<String, dynamic> toJson();

  /// A normal device class also features a deserialize function
  /// factory Device fromJson(Map<String, dynamic> json) =>
  ///     _$DeviceFromJson(serialized);

  /// The following methods are derived from [Object] and are only stated here for to ignore them
  @Ignore()
  int get hashCode;

  @Ignore()
  Type get runtimeType;

  @Ignore()
  bool operator ==(Object other);

  @Ignore()
  String toString();

  @Ignore()
  noSuchMethod(Invocation invocation);
}

/// A host is a device running a blackbird instance and possibly hosting implementation objects
abstract class Host extends Device {
  Host._();
  factory Host() => _$HostDevice();

  //TODO inetaddress?
  String address;
  int port;

  @Runtime()
  Blackbird get blackbird;

  Future<Device> getRemoteHandle(@NotAsRmi() Device device) async {
    return await blackbird.implementDevice(device);
  }

  Future<void> something(String text) async {
    print('well $address $text');
  }

  @Ignore()
  String toString() {
    return 'Host($address/$port)';
  }

  static Host getRemote(Context context, String uuid) =>
      _$HostRmi.getRemote(context, uuid);
  static Host fromJson(Map<String, dynamic> json) => _$HostFromJson(json);
}
