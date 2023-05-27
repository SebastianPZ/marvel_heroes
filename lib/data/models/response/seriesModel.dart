
import 'package:marvel_heroes/domain/entities/series.dart';

import '../../../domain/entities/thumbnail.dart';
import 'thumbnailModel.dart';

class SeriesModel {

  int? id;
  String? title;
  String? description;
  String? resourceURI;
  ThumbnailModel? thumbnail;

  SeriesModel({this.id, this.title, this.description, this.resourceURI, this.thumbnail});

  SeriesModel.fromJson(Map<String, dynamic> data) {
    id = data["id"];
    title = data["title"];
    description = data["description"];
    resourceURI = data["resourceURI"];
    thumbnail = (data["thumbnail"] != null) ? ThumbnailModel.fromJson(data["thumbnail"]) : ThumbnailModel();
  }

  Series toEntity() => Series(
      id: id ?? 0,
      title: title ?? "",
      description: description ?? "",
      resourceURI: resourceURI ?? "",
      thumbnail: thumbnail!.toEntity()
  );

}
