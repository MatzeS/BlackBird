// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_test.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Simple _$SimpleFromJson(Map<String, dynamic> json) {
  return Simple()
    ..anInteger = json['anInteger'] as int
    ..anString = json['anString'] as String
    ..e = _$enumDecodeNullable(_$SomeEnumEnumMap, json['e']);
}

Map<String, dynamic> _$SimpleToJson(Simple instance) => <String, dynamic>{
      'anInteger': instance.anInteger,
      'anString': instance.anString,
      'e': _$SomeEnumEnumMap[instance.e]
    };

T _$enumDecode<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }
  return enumValues.entries
      .singleWhere((e) => e.value == source,
          orElse: () => throw ArgumentError(
              '`$source` is not one of the supported values: '
              '${enumValues.values.join(', ')}'))
      .key;
}

T _$enumDecodeNullable<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source);
}

const _$SomeEnumEnumMap = <SomeEnum, dynamic>{
  SomeEnum.a: 'a',
  SomeEnum.b: 'b',
  SomeEnum.c: 'c',
  SomeEnum.d: 'd'
};

Other _$OtherFromJson(Map<String, dynamic> json) {
  return Other()
    ..anInteger = json['anInteger'] as int
    ..simple = json['simple'] == null
        ? null
        : Simple.fromJson(json['simple'] as Map<String, dynamic>);
}

Map<String, dynamic> _$OtherToJson(Other instance) => <String, dynamic>{
      'anInteger': instance.anInteger,
      'simple': instance.simple
    };
