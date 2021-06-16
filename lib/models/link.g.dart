// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Link _$LinkFromJson(Map<String, dynamic> json) {
  return Link(
    type: json['type'] as String,
    url: json['url'] as String,
    suggested_link_text: json['suggested_link_text'] as String,
  );
}

Map<String, dynamic> _$LinkToJson(Link instance) => <String, dynamic>{
      'type': instance.type,
      'url': instance.url,
      'suggested_link_text': instance.suggested_link_text,
    };
