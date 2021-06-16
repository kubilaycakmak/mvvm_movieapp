import 'package:json_annotation/json_annotation.dart';

part 'link.g.dart';

@JsonSerializable()
class Link {
  final String type;
  final String url;
  final String suggested_link_text;

  Link({
    required this.type,
    required this.url,
    required this.suggested_link_text,
  });

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);
  // return Link(
  //   type: json["type"],
  //   url: json["url"],
  //   suggested_link_text: json["suggested_link_text"],
  // );
}
