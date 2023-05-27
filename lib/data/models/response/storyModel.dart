
import 'package:marvel_heroes/domain/entities/story.dart';

import '../../../domain/entities/thumbnail.dart';
import 'thumbnailModel.dart';

class StoryModel {

  int? id;
  String? title;
  String? description;
  String? resourceURI;
  String? type;
  ThumbnailModel? thumbnail;

  StoryModel({this.id, this.title, this.description, this.resourceURI, this.type,
    this.thumbnail});

  StoryModel.fromJson(Map<String, dynamic> data) {
    id = data["id"];
    title = data["title"];
    description = data["description"];
    type = data["type"];
    resourceURI = data["resourceURI"];
    thumbnail = (data["thumbnail"] != null) ? ThumbnailModel.fromJson(data["thumbnail"]) : ThumbnailModel();
  }

  Story toEntity() => Story(
      id: id ?? 0,
      title: title ?? "",
      description: description ?? "",
      resourceURI: resourceURI ?? "",
      type: type ?? "",
      thumbnail: thumbnail!.toEntity()
  );

}