
import 'package:marvel_heroes/domain/entities/event.dart';

import '../../../domain/entities/thumbnail.dart';
import 'thumbnailModel.dart';

class EventModel {

  int? id;
  String? title;
  String? description;
  String? resourceURI;
  ThumbnailModel? thumbnail;

  EventModel({this.id, this.title, this.description, this.resourceURI, this.thumbnail});

  EventModel.fromJson(Map<String, dynamic> data) {
    id = data["id"];
    title = data["title"];
    description = data["description"];
    resourceURI = data["resourceURI"];
    thumbnail = (data["thumbnail"] != null) ? ThumbnailModel.fromJson(data["thumbnail"]) : ThumbnailModel();
  }

  Event toEntity() => Event(
      id: id ?? 0,
      title: title ?? "",
      description: description ?? "",
      resourceURI: resourceURI ?? "",
      thumbnail: thumbnail!.toEntity()
  );

}