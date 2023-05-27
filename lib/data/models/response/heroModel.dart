
import 'package:marvel_heroes/domain/entities/thumbnail.dart';

import '../../../util/strings.dart';
import 'thumbnailModel.dart';
import 'package:marvel_heroes/domain/entities/hero.dart';

class HeroModel{

  int? id;
  String? name;
  String? description;
  String? modified;
  ThumbnailModel? thumbnail;
  String? resourceURI;
  Map<String, dynamic>? comics;
  Map<String, dynamic>? series;
  Map<String, dynamic>? stories;
  Map<String, dynamic>? events;
  List<Map<String, dynamic>>? urls;

  HeroModel({this.id, this.name, this.description, this.modified, this.thumbnail,
    this.resourceURI, this.comics, this.series, this.stories, this.events, this.urls});

  HeroModel.fromJson(Map<String, dynamic> data) {
    id = data["id"];
    name = data["name"];
    description = data["description"];
    thumbnail = (data["thumbnail"] != null) ? ThumbnailModel.fromJson(data["thumbnail"]) : ThumbnailModel();
  }

  Hero toEntity() => Hero(
      id: id ?? 0,
      name: name ?? "",
      description: (description != null) ? (description!.isNotEmpty) ?
        description! : defaultHeroDescription : defaultHeroDescription,
      modified: modified ?? "",
      thumbnail: thumbnail!.toEntity(),
      resourceURI: resourceURI ?? "",
      comics: comics ?? {},
      series: series ?? {},
      stories: stories ?? {},
      events: events ?? {},
      urls: urls ?? []
  );

}