import 'package:json_annotation/json_annotation.dart';

part 'multimedia.g.dart';

@JsonSerializable()
class Multimedia {
  final String type;
  final String src;
  final int width;
  final int height;

  Multimedia({
    required this.type,
    required this.src,
    required this.width,
    required this.height,
  });

  factory Multimedia.fromJson(Map<String, dynamic> json) =>
      _$MultimediaFromJson(json);
  // return Multimedia(
  //   type: json["type"] ?? null,
  //   src: json["src"] ?? null,
  //   width: json["width"] ?? null,
  //   height: json["height"] ?? null,
  // );
}
