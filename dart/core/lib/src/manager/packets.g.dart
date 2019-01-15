// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'packets.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HandshakePacket _$HandshakePacketFromJson(Map<String, dynamic> json) {
  return HandshakePacket(
      json['self'] == null
          ? null
          : Host.fromJson(json['self'] as Map<String, dynamic>),
      json['rmiUuid'] as String);
}

Map<String, dynamic> _$HandshakePacketToJson(HandshakePacket instance) =>
    <String, dynamic>{
      'self': instance.self,
      'rmiUuid': instance.rmiUuid,
      'json_serializable.className':
          "asset:blackbird/lib/src/manager/packets.dart#HandshakePacket",
    };

RmiWrapperPacket _$RmiWrapperPacketFromJson(Map<String, dynamic> json) {
  return RmiWrapperPacket(json['wrapped'] as String);
}

Map<String, dynamic> _$RmiWrapperPacketToJson(RmiWrapperPacket instance) =>
    <String, dynamic>{
      'wrapped': instance.wrapped,
      'json_serializable.className':
          "asset:blackbird/lib/src/manager/packets.dart#RmiWrapperPacket",
    };
