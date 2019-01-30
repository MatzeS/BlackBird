import 'package:blackbird/blackbird.dart';
import 'package:json_annotation/json_annotation.dart';

part 'packets.g.dart';

@JsonSerializable()
class HandshakePacket extends HostConnectionPacket {
  final Host self;
  final String rmiUuid;

  HandshakePacket(this.self, this.rmiUuid);

  Map<String, dynamic> toJson() => _$HandshakePacketToJson(this);
  static HandshakePacket fromJson(Map<String, dynamic> json) =>
      _$HandshakePacketFromJson(json);
}

@JsonSerializable()
class RmiWrapperPacket extends HostConnectionPacket {
  final String wrapped;
  RmiWrapperPacket(this.wrapped);

  Map<String, dynamic> toJson() => _$RmiWrapperPacketToJson(this);
  static RmiWrapperPacket fromJson(Map<String, dynamic> json) =>
      _$RmiWrapperPacketFromJson(json);
}
