// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
    display_title: json['display_title'] as String,
    multimedia: Multimedia.fromJson(
        json['multimedia'] ?? {'type': '', 'src': '', 'width': 0, 'height': 0}),
    publication_date: json['publication_date'] as String,
    byline: json['byline'] as String,
    summary_short: json['summary_short'] as String,
    headline: json['headline'] as String,
    link: Link.fromJson(
        json['link'] ?? {'type': '', 'url': '', 'suggested_link_text': ''}),
  );
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'display_title': instance.display_title,
      'multimedia': instance.multimedia,
      'publication_date': instance.publication_date,
      'byLine': instance.byline,
      'summary_short': instance.summary_short,
      'headline': instance.headline,
      'link': instance.link,
    };
