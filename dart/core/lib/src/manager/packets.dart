import 'host_manager.dart';
import 'package:blackbird/blackbird.dart';
import 'package:json_annotation/json_annotation.dart';
part 'packets.g.dart';

@JsonSerializable()
class HandshakePacket extends BlackbirdPacket {
  final Host self;
  final String rmiUuid;

  HandshakePacket(this.self, this.rmiUuid);

  Map<String, dynamic> toJson() => _$HandshakePacketToJson(this);
  static HandshakePacket fromJson(Map<String, dynamic> json) =>
      _$HandshakePacketFromJson(json);
}

/// Wrapps RMI Packets
@JsonSerializable()
class RmiWrapperPacket extends BlackbirdPacket {
  final String wrapped;
  RmiWrapperPacket(this.wrapped);

  Map<String, dynamic> toJson() => _$RmiWrapperPacketToJson(this);
  static RmiWrapperPacket fromJson(Map<String, dynamic> json) =>
      _$RmiWrapperPacketFromJson(json);
}
