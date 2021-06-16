// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multimedia.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Multimedia _$MultimediaFromJson(Map<String, dynamic> json) {
  return Multimedia(
    type: json['type'] as String,
    src: json['src'] as String,
    width: json['width'] as int,
    height: json['height'] as int,
  );
}

Map<String, dynamic> _$MultimediaToJson(Multimedia instance) =>
    <String, dynamic>{
      'type': instance.type,
      'src': instance.src,
      'width': instance.width,
      'height': instance.height,
    };
