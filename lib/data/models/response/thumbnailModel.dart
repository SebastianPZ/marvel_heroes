
import 'package:marvel_heroes/domain/entities/thumbnail.dart';
import 'package:marvel_heroes/util/theme/drawable.dart';

class ThumbnailModel {

    String? path;
    String? extension;

    ThumbnailModel({this.path, this.extension});

    ThumbnailModel.fromJson(Map<String, dynamic> data) {
        path = data["path"];
        extension = data["extension"];
    }

    Thumbnail toEntity() => Thumbnail(
        path: path ?? defaultImagePath,
        extension: extension ?? defaultImageExtension
    );
}