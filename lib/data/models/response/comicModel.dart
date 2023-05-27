
import 'package:marvel_heroes/data/models/response/thumbnailModel.dart';
import 'package:marvel_heroes/domain/entities/comic.dart';

import '../../../domain/entities/thumbnail.dart';

class ComicModel {

  int? id;
  int? digitalId;
  String? title;
  int? issueNumber;
  String? description;
  ThumbnailModel? thumbnail;

  ComicModel({this.id, this.digitalId, this.title, this.issueNumber, this.description,
    this.thumbnail});

  ComicModel.fromJson(Map<String, dynamic> data) {
    id = data["id"];
    digitalId = data["digitalId"];
    title = data["title"];
    issueNumber = data["issueNumber"];
    description = data["description"];
    thumbnail = (data["thumbnail"] != null) ? ThumbnailModel.fromJson(data["thumbnail"]) : ThumbnailModel();
  }

  Comic toEntity() => Comic(
      id: id ?? 0,
      digitalId: digitalId ?? 0,
      title: title ?? "",
      issueNumber: issueNumber ?? 0,
      description: description ?? "",
      thumbnail: thumbnail!.toEntity()
  );

}