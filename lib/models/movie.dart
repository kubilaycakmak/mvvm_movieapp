import 'package:flutter/material.dart';

import 'multimedia.dart';
import 'package:json_annotation/json_annotation.dart';
import 'link.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  final String display_title;
  final Multimedia multimedia;
  final String publication_date;
  final String byline;
  final String summary_short;
  final String headline;
  final Link link;

  Movie(
      {required this.display_title,
      required this.multimedia,
      required this.publication_date,
      required this.byline,
      required this.summary_short,
      required this.headline,
      required this.link});

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  // return Movie(
  //     title: json["display_title"],
  //     multimedia: Multimedia.fromJson(json["multimedia"] ?? null),
  //     date: json["publication_date"],
  //     byLine: json["byline"],
  //     description: json["summary_short"],
  //     headline: json["headline"],
  //     link: Link.fromJson(json["link"]));

}
